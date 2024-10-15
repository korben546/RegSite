class ConRegistration < ApplicationRecord
  MAX_NUM_OF_REG_PER_USER_PER_CON = 1 # all caps variables are used for constants, you should use constants instead of magic numbers, this is the number of registrations per con period
  CON_DATE = Time.new(2024, 12, 12, 0, 0) # temporary test date
  PAYMENT_PERIOD_BEGIN = Time.new(2024, 12, 12, 0, 0) # temporary payment period (if people have from september 12 to pay start it then dont have it be the deadline)

  belongs_to :user

  validate :validate_user_reg_per_con, on: :create
  validate :validate_user_reg_can_destroy, on: :destroy
  validates_presence_of :full_name, :fur_name, :date_of_birth, :address_line1, :postcode, :country, :tel

  # the below scope stops access to any posts that arent the most recent if user is not admin
  scope :visible_to_user, ->(user) {
    if user.admin?
      Rails.logger.debug "User is admin"
      all
    else
      where(user_id: user.id).order(created_at: :desc).limit(1)
    end
  }

  def self.ransackable_associations(auth_object = nil)
    [ "user" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "accepted", "address_line1", "address_line2", "city", "country", "county", "created_at", "date_of_birth", "full_name", "fur_name", "id", "postcode", "tel", "updated_at", "user_id" ]
  end

  def self.per_con
    where("created_at < ?", CON_DATE)
  end

  def validate_user_reg_per_con
    if user.con_registrations.per_con.count >= MAX_NUM_OF_REG_PER_USER_PER_CON
      errors.add(:base, "you cannot have more than one registration per convention period, if you need help with your current registration contact us")
    end
  end

  def validate_user_reg_can_destroy
    if Time.current >= PAYMENT_PERIOD_BEGIN
      errors.add(:base, "you cannot cancel a registration after the payment period has begun, to cancel your reg contact us")
    end
  end
end
