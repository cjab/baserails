# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dinopass_session',
  :secret      => '5729a6fdfe90451e99879e0aeb6ac8459820a32154e4b00ee66ce71b73a5fd850e633ba033b75431af0390c2fd64419473f886840df1eeef3b05ff4fa4539709'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
