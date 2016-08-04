require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Dobt < OmniAuth::Strategies::OAuth2
      option :name, :dobt

      uid { raw_info['id'] }

      info do
        {
          name: raw_info['name'] || raw_info['email'],
          email: raw_info['email']
        }
      end

      extra do
        {
          remember_me: raw_info['remember_me'],
          two_factor_enabled: raw_info['two_factor_enabled'],
          email_confirmed: raw_info['email_confirmed']
        }
      end

      # Pass a few params to DOBT platform
      def authorize_params
        super.merge(
          pick(
            request.params,
            :invited_email,
            :invited_name,
            :request_signup,
            :use_previous_grant
          )
        )
      end

      def raw_info
        @raw_info ||= access_token.get('/api/account.json?v=1').parsed
      end

      private

      def pick(obj, *keys)
        stringified_keys = keys.map(&:to_s)

        {}.tap do |h|
          obj.each do |key, value|
            h[key.to_sym] = value if stringified_keys.include?(key.to_s)
          end
        end
      end
    end
  end
end
