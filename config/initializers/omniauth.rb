Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'],{ 
    client_options: { ssl: { 
        ca_file: '/usr/lib/ssl/certs/ca-certificates.crt',
        ca_path: "/etc/ssl/certs"
    }}}
end