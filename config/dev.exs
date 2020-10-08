import Config

config :mcfeely, McFeely.Mailer, adapter: Swoosh.Adapters.Local
config :swoosh, serve_mailbox: true
