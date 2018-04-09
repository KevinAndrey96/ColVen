class Order < ActiveRecord::Base
  belongs_to :client
  mount_uploader :voucher, ImageUploader
  scope :desc, -> { order('id DESC') }
  validates :account, length: { is: 20 }
end
