class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, uniqueness: true

  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end

end
