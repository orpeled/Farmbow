CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: 'eu-west-1'                  # optional, defaults to 'us-east-1'
    #host: 's3.amazonaws.com',             # optional, defaults to nil
    #endpoint: 'https://s3.amazonaws.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV["AWS_S3_BUCKET"]
  config.fog_public     = false                                   # optional, defaults to true
  #config.fog_attributes = {'Cache-Control'=>'max-age=1'}  # optional, defaults to {}
end