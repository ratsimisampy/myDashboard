class Password < ApplicationRecord
    validates :url, :format => { :with => URI::regexp(%w(http https)), :message => "invalid format"}
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Valid email required' }
    validates :pwd, presence: true, length: {minimum: 6}
end
