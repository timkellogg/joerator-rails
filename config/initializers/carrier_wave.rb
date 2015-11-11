# if Rails.env.production?
#   CarrierWave.configure do |config|
#     config.fog_credentials = {
#       # Configuration for Amazon S3
#       :provider              => 'AWS',
#       :region                => ENV['S3_REGION'],
#       :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
#       :aws_secret_access_key => ENV['S3_SECRET_KEY']
#     }
#     config.fog_directory     =  ENV['S3_BUCKET']
#   end
# end

CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV['S3_BUCKET']
  config.aws_acl    = 'public-read'

  # Optionally define an asset host for configurations that are fronted by a
  # content host, such as CloudFront.
  # config.asset_host = 'http://example.com'

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
    access_key_id:     ENV['S3_ACCESS_KEY'],
    secret_access_key: ENV['S3_SECRET_KEY'],
    region:            ENV['S3_REGION'] 
  }

  # Optional: Signing of download urls, e.g. for serving private
  # content through CloudFront.
  # config.aws_signer = -> (unsigned_url, options) { Aws::CF::Signer.sign_url unsigned_url, options }
end
