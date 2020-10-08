import Config

config :mcfeely, McFeely.Mailer,
  adapter: Swoosh.Adapters.Postmark,
  api_key: "your-api-key"
