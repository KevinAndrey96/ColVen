class Order < ActiveRecord::Base
  belongs_to :client
  mount_uploader :voucher, ImageUploader
end
