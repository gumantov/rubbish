class Mail < ApplicationRecord
  validates :company, :size, presence: true


  belongs_to :user
  belongs_to :company

end
