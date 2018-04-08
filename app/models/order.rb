class Order < ActiveRecord::Base
  belongs_to :client
  mount_uploader :voucher, ImageUploader
  scope :desc, -> { order('id DESC') }
end
