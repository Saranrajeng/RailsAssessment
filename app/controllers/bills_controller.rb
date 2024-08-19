class BillsController < ApplicationController
  before_action :set_bill, only: %i[ show approve reject]
  before_action :authenticate_admin, only: %i[ approve reject]

  # GET /bills or /bills.json
  def index
    @bills= current_user.bills.includes(submitted_by: :department)
    @total_approved = @bills.approved.sum(:amount)
    @total_submitted = @bills.sum(:amount)
  end

  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.status="pending"
    @bill.submitted_by = current_user.employee
    respond_to do |format|
      if @bill.save
        format.html { redirect_to bills_path, notice: "Bill was successfully created." }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    redirect_to bills_path unless @bill.pending?
    respond_to do |format|
      if @bill.approved!
        format.html { redirect_to bills_path, notice: "Bill was successfully approved." }
        format.json { render :show, status: :created, location: @bill }
      else
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def reject
    redirect_to bills_path unless @bill.pending?
    respond_to do |format|
      if @bill.rejected!
        format.html { redirect_to bills_path, notice: "Bill was successfully rejected." }
        format.json { render :show, status: :created, location: @bill }
      else
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:amount, :bill_type, :submitted_by)
    end
end
