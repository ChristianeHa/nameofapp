# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.site_key  = '6LdwzBkUAAAAAAYwqlmea53ZvZb9Ct0x7HUFZBi_'
  config.secret_key = '6LdwzBkUAAAAANRrNVnyhsOXYvWy7u5P9colQeRW'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
end