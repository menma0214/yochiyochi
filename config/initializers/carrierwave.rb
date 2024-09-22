require 'carrierwave/orm/activerecord'
require 'carrierwave/storage/fog'

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:                ENV['AWS_REGION'], # 自分が設定したいリージョン(Renderのリージョンの関係でシンガポール)
  }
  config.fog_directory  = ENV['AWS_S3_BUCKET']
  config.fog_attributes = {'x-amz-acl' => nil} # ACLを設定しない
  config.cache_dir = Rails.root.join('tmp', 'uploads')
end
