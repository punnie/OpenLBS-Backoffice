# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_OpenLBS Backend_session',
  :secret      => 'd6c1da152010f1611b2a659c1633b4b558aaf2d1524a6d26bdbf2583683baa83ac68533e779503c053dfdb1fe49b74d131f1d90ec6e02a3f99447c01d9794960'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
