class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  has_one :employee
  enum role: { admin: 0, employee: 1}
  def to_json
    {id: id, email: email, role: role, name: name}
  end
  def bills
    if admin?
      Bill.all
    else
      employee.bills
    end
  end
end