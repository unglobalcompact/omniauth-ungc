require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class Ungc < OmniAuth::Strategies::OAuth2

      option :name, :ungc

      option :client_options, {
        site: "https://staging.unglobalcompact.org",
      }

      uid { raw_info["id"] }

      info do
        raw_info.slice(
          "name",
          "email",
          "organization_id",
          "organization_name"
        )
      end

      def raw_info
        @_raw_info ||= begin
          response = access_token.get("/api/v1/me.json")
          JSON.parse(response.try!(:body) || "{}")
        end
      end

      # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path
      end

    end
  end
end
