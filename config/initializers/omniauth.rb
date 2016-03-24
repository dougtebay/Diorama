keys = YAML.load_file('./config/secrets.yml')

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, keys['CONSUMER_KEY'], keys['CONSUMER_SECRET']
end