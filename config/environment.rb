# Load the Rails application.
require_relative "application"

# Set up encryption key (must be 16 bytes)
SECRET_KEY = ENV['SECRET_KEY_BASE']

if SECRET_KEY.nil? || SECRET_KEY.length != 16
  raise ArgumentError, "SECRET_KEY_BASE must be set and 16 bytes long"
end

cipher = OpenSSL::Cipher::AES256.new(:CBC)
cipher.key = SECRET_KEY

# Initialize the Rails application.
Rails.application.initialize!
