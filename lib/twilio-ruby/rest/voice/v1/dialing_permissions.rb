##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Voice < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class DialingPermissionsList < ListResource
          ##
          # Initialize the DialingPermissionsList
          # @param [Version] version Version that contains the resource
          # @return [DialingPermissionsList] DialingPermissionsList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}

            # Components
            @countries = nil
            @settings = nil
            @bulk_country_updates = nil
          end

          ##
          # Access the countries
          # @param [String] iso_code The [ISO country
          #   code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
          #   DialingPermissions Country resource to fetch
          # @return [CountryList]
          # @return [CountryContext] if iso_code was passed.
          def countries(iso_code=:unset)
            raise ArgumentError, 'iso_code cannot be nil' if iso_code.nil?

            if iso_code != :unset
              return CountryContext.new(@version, iso_code, )
            end

              @countries ||= CountryList.new(@version, )
          end

          ##
          # Access the settings
          # @return [SettingsContext] SettingsContext
          def settings
            return SettingsContext.new(@version, )
          end

          ##
          # Access the bulk_country_updates
          # @return [BulkCountryUpdateList]
          # @return [BulkCountryUpdateContext]
          def bulk_country_updates
            @bulk_country_updates ||= BulkCountryUpdateList.new(@version, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Voice.V1.DialingPermissionsList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class DialingPermissionsPage < Page
          ##
          # Initialize the DialingPermissionsPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [DialingPermissionsPage] DialingPermissionsPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of DialingPermissionsInstance
          # @param [Hash] payload Payload response from the API
          # @return [DialingPermissionsInstance] DialingPermissionsInstance
          def get_instance(payload)
            DialingPermissionsInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Voice.V1.DialingPermissionsPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class DialingPermissionsInstance < InstanceResource
          ##
          # Initialize the DialingPermissionsInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [DialingPermissionsInstance] DialingPermissionsInstance
          def initialize(version, payload)
            super(version)
          end

          ##
          # Provide a user friendly representation
          def to_s
            "<Twilio.Voice.V1.DialingPermissionsInstance>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            "<Twilio.Voice.V1.DialingPermissionsInstance>"
          end
        end
      end
    end
  end
end