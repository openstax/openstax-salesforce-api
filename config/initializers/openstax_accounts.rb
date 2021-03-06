OpenStax::Accounts.configure do |config|
  oauth_secrets = Rails.application.secrets.accounts[:oauth]

  config.openstax_application_id = oauth_secrets[:openstax_application_id]
  config.openstax_application_secret = oauth_secrets[:openstax_application_secret]
  config.openstax_accounts_url = oauth_secrets[:openstax_accounts_url]
  config.enable_stubbing = oauth_secrets[:enable_stubbing]
end
