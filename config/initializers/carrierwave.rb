CarrierWave.configure do |config|

  config.fog_credentials = {
    provider:                         'Google',
    google_storage_access_key_id:     Rails.application.secrets.google_storage_access_key_id,
    google_storage_secret_access_key: Rails.application.secrets.google_storage_secret_access_key
  }
  config.fog_directory = 'farmer-pictures'

  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end