Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials[Rails.env.to_sym][:google][:recaptcha_site_key] || '6Lc6BAAAAAAAAChqRbQZcn_yyyyyyyyyyyyyyyyy'
  config.secret_key = Rails.application.credentials[Rails.env.to_sym][:google][:recaptcha_secret_key] || '6Lc6BAAAAAAAAKN3DRm6VA_xxxxxxxxxxxxxxxxx'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end