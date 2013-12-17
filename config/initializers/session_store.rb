# Be sure to restart your server when you modify this file.
#we can do redis or database store for the session
#cookie store has limits
Playlister::Application.config.session_store :cookie_store, key: '_playlister_session'
