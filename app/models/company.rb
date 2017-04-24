class Company < ApplicationRecord
  has_many :mails

  def company_size
    Mail.where(company:self).count
  end
  
end
