##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Verify < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class AccessTokenList < ListResource
            ##
            # Initialize the AccessTokenList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Verify Service.
            # @return [AccessTokenList] AccessTokenList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/AccessTokens"
            end

            ##
            # Create the AccessTokenInstance
            # @param [String] identity The unique external identifier for the Entity of the
            #   Service. This identifier should be immutable, not PII, and generated by your
            #   external system, such as your user's UUID, GUID, or SID.
            # @param [access_token.FactorTypes] factor_type The Type of this Factor. Eg.
            #   `push`
            # @param [String] factor_friendly_name The friendly name of the factor that is
            #   going to be created with this access token
            # @param [String] ttl How long, in seconds, the access token is valid. Can be an
            #   integer between 60 and 300. Default is 60.
            # @return [AccessTokenInstance] Created AccessTokenInstance
            def create(identity: nil, factor_type: nil, factor_friendly_name: :unset, ttl: :unset)
              data = Twilio::Values.of({
                  'Identity' => identity,
                  'FactorType' => factor_type,
                  'FactorFriendlyName' => factor_friendly_name,
                  'Ttl' => ttl,
              })

              payload = @version.create('POST', @uri, data: data)

              AccessTokenInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Verify.V2.AccessTokenList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class AccessTokenPage < Page
            ##
            # Initialize the AccessTokenPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [AccessTokenPage] AccessTokenPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of AccessTokenInstance
            # @param [Hash] payload Payload response from the API
            # @return [AccessTokenInstance] AccessTokenInstance
            def get_instance(payload)
              AccessTokenInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Verify.V2.AccessTokenPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class AccessTokenContext < InstanceContext
            ##
            # Initialize the AccessTokenContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @param [String] sid A 34 character string that uniquely identifies this Access
            #   Token.
            # @return [AccessTokenContext] AccessTokenContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/AccessTokens/#{@solution[:sid]}"
            end

            ##
            # Fetch the AccessTokenInstance
            # @return [AccessTokenInstance] Fetched AccessTokenInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              AccessTokenInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Verify.V2.AccessTokenContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Verify.V2.AccessTokenContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class AccessTokenInstance < InstanceResource
            ##
            # Initialize the AccessTokenInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The unique SID identifier of the Verify Service.
            # @param [String] sid A 34 character string that uniquely identifies this Access
            #   Token.
            # @return [AccessTokenInstance] AccessTokenInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'entity_identity' => payload['entity_identity'],
                  'factor_type' => payload['factor_type'],
                  'factor_friendly_name' => payload['factor_friendly_name'],
                  'token' => payload['token'],
                  'url' => payload['url'],
                  'ttl' => payload['ttl'] == nil ? payload['ttl'] : payload['ttl'].to_i,
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [AccessTokenContext] AccessTokenContext for this AccessTokenInstance
            def context
              unless @instance_context
                @instance_context = AccessTokenContext.new(@version, @params['service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] A string that uniquely identifies this Access Token.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Account Sid.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] Verify Service Sid.
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] Unique external identifier of the Entity
            def entity_identity
              @properties['entity_identity']
            end

            ##
            # @return [access_token.FactorTypes] The Type of the Factor
            def factor_type
              @properties['factor_type']
            end

            ##
            # @return [String] A human readable description of this factor.
            def factor_friendly_name
              @properties['factor_friendly_name']
            end

            ##
            # @return [String] Generated access token.
            def token
              @properties['token']
            end

            ##
            # @return [String] The URL of this resource.
            def url
              @properties['url']
            end

            ##
            # @return [String] How long, in seconds, the access token is valid.
            def ttl
              @properties['ttl']
            end

            ##
            # @return [Time] The date this access token was created
            def date_created
              @properties['date_created']
            end

            ##
            # Fetch the AccessTokenInstance
            # @return [AccessTokenInstance] Fetched AccessTokenInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Verify.V2.AccessTokenInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Verify.V2.AccessTokenInstance #{values}>"
            end
          end
        end
      end
    end
  end
end