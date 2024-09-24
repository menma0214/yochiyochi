CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
  end
end

RSpec.configure do |config|
  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads"])
  end
end
