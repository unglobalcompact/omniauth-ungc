# OmniAuth Ungc

This gem contains the Ungc strategy for OmniAuth

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-ungc'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :ungc, "APP_ID", "APP_SECRET"
end
```

Replace `"APP_ID"` and `"APP_SECRET"` with the appropriate values you obtained from the Ungc.
