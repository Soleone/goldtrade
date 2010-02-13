# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_goldtrade_session',
  :secret      => 'a24a7069d768c07cf2a5ef3ae6558536d7cc5d0e8125b45357f1b4f905f832702003949bd8095287e25a4f6d12dc7a8c67f935f4eb05574161496101175c69c0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
