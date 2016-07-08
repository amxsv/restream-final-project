Rails.application.configure do
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = {
    host: ENV['SMPT_DEFAULT_HOST'],
    port: ENV['SMPT_DEFAULT_POST']
  }
  config.action_mailer.default_options = {
    from: 'restream-final-project@yandex.ru'
  }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    enable_starttls_auto: true,
    address: 'smtp.yandex.ru',
    port: 587,
    domain: ENV['SMPT_DOMAIN'],
    authentication: 'login',
    user_name: ENV['YANDEX_USERNAME'],
    password: ENV['YANDEX_PASSWORD']
  }
end
