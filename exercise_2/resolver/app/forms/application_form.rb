# Usage:
#
# class UserRegistrationForm < ApplicationForm
#   attr_accessor :user, :terms_of_service
#
#   delegate :attributes=, to: :user, prefix: true
#
#   validates :terms_of_service, acceptance: true
#   validate :check_valid_user
#
#   def initialize(user, params = {})
#     @user = user
#     super(params)
#   end
#
#   def submit
#     return false if invalid?
#     user.save
#   end
#
#   def persisted?
#     user.persisted?
#   end
#
#   private
#
#   def check_valid_user
#     errors.add(:user, :invalid) if user.invalid?
#   end
# end
#
# user = User.new
# form = UserRegistrationForm.new(user, permitted_params)
# form.submit

class ApplicationForm
  include ActiveModel::Model

  class << self
    def i18n_scope
      :form
    end
  end

  def persisted?
    raise NotImplementedError, "You must define `persisted?` as instance method in #{self.class.name} class."
  end
end
