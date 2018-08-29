OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '904486839413-nm910c719hhkhd27lo6rlel3083og5pj.apps.googleusercontent.com', '5GxSp9I-woD_x9zZtKT7Ffw_', { client_options: { ssl: { ca_file: Rails.root.join("cacert.pem").to_s } } }
end
