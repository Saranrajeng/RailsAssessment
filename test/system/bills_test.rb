require "application_system_test_case"

class BillsTest < ApplicationSystemTestCase
  setup do
    @bill = bills(:one)
  end

  test "visiting the index" do
    visit bills_url
    assert_selector "h1", text: "Bills"
  end

  test "should create bill" do
    visit bills_url
    click_on "New bill"

    fill_in "Amount", with: @bill.amount
    fill_in "Bill type", with: @bill.bill_type
    fill_in "Status", with: @bill.status
    fill_in "Submitted by", with: @bill.submitted_by
    click_on "Create Bill"

    assert_text "Bill was successfully created"
    click_on "Back"
  end

  test "should update Bill" do
    visit bill_url(@bill)
    click_on "Edit this bill", match: :first

    fill_in "Amount", with: @bill.amount
    fill_in "Bill type", with: @bill.bill_type
    fill_in "Status", with: @bill.status
    fill_in "Submitted by", with: @bill.submitted_by
    click_on "Update Bill"

    assert_text "Bill was successfully updated"
    click_on "Back"
  end

  test "should destroy Bill" do
    visit bill_url(@bill)
    click_on "Destroy this bill", match: :first

    assert_text "Bill was successfully destroyed"
  end
end
