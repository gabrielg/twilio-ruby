##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Conversations < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class ConversationList < ListResource
            ##
            # Initialize the ConversationList
            # @param [Version] version Version that contains the resource
            # @param [String] chat_service_sid The unique ID of the [Conversation
            #   Service](https://www.twilio.com/docs/conversations/api/service-resource) this
            #   conversation belongs to.
            # @return [ConversationList] ConversationList
            def initialize(version, chat_service_sid: nil)
              super(version)

              # Path Solution
              @solution = {chat_service_sid: chat_service_sid}
              @uri = "/Services/#{@solution[:chat_service_sid]}/Conversations"
            end

            ##
            # Create the ConversationInstance
            # @param [String] friendly_name The human-readable name of this conversation,
            #   limited to 256 characters. Optional.
            # @param [String] unique_name An application-defined string that uniquely
            #   identifies the resource. It can be used to address the resource in place of the
            #   resource's `sid` in the URL.
            # @param [String] attributes An optional string metadata field you can use to
            #   store any data you wish. The string value must contain structurally valid JSON
            #   if specified.  **Note** that if the attributes are not set "{}" will be
            #   returned.
            # @param [String] messaging_service_sid The unique ID of the [Messaging
            #   Service](https://www.twilio.com/docs/sms/services/api) this conversation belongs
            #   to.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated.
            # @param [conversation.State] state Current state of this conversation. Can be
            #   either `active`, `inactive` or `closed` and defaults to `active`
            # @param [String] timers_inactive ISO8601 duration when conversation will be
            #   switched to `inactive` state. Minimum value for this timer is 1 minute.
            # @param [String] timers_closed ISO8601 duration when conversation will be
            #   switched to `closed` state. Minimum value for this timer is 10 minutes.
            # @param [conversation.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [ConversationInstance] Created ConversationInstance
            def create(friendly_name: :unset, unique_name: :unset, attributes: :unset, messaging_service_sid: :unset, date_created: :unset, date_updated: :unset, state: :unset, timers_inactive: :unset, timers_closed: :unset, x_twilio_webhook_enabled: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'UniqueName' => unique_name,
                  'Attributes' => attributes,
                  'MessagingServiceSid' => messaging_service_sid,
                  'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                  'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                  'State' => state,
                  'Timers.Inactive' => timers_inactive,
                  'Timers.Closed' => timers_closed,
              })
              headers = Twilio::Values.of({'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })

              payload = @version.create('POST', @uri, data: data, headers: headers)

              ConversationInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid], )
            end

            ##
            # Lists ConversationInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams ConversationInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ConversationInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of ConversationInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ConversationInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              ConversationPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ConversationInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ConversationInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ConversationPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Conversations.V1.ConversationList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class ConversationPage < Page
            ##
            # Initialize the ConversationPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ConversationPage] ConversationPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ConversationInstance
            # @param [Hash] payload Payload response from the API
            # @return [ConversationInstance] ConversationInstance
            def get_instance(payload)
              ConversationInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Conversations.V1.ConversationPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class ConversationContext < InstanceContext
            ##
            # Initialize the ConversationContext
            # @param [Version] version Version that contains the resource
            # @param [String] chat_service_sid The chat_service_sid
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource. Can also be the `unique_name` of the Conversation.
            # @return [ConversationContext] ConversationContext
            def initialize(version, chat_service_sid, sid)
              super(version)

              # Path Solution
              @solution = {chat_service_sid: chat_service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:chat_service_sid]}/Conversations/#{@solution[:sid]}"

              # Dependents
              @participants = nil
              @messages = nil
              @webhooks = nil
            end

            ##
            # Update the ConversationInstance
            # @param [String] friendly_name The human-readable name of this conversation,
            #   limited to 256 characters. Optional.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated.
            # @param [String] attributes An optional string metadata field you can use to
            #   store any data you wish. The string value must contain structurally valid JSON
            #   if specified.  **Note** that if the attributes are not set "{}" will be
            #   returned.
            # @param [String] messaging_service_sid The unique ID of the [Messaging
            #   Service](https://www.twilio.com/docs/sms/services/api) this conversation belongs
            #   to.
            # @param [conversation.State] state Current state of this conversation. Can be
            #   either `active`, `inactive` or `closed` and defaults to `active`
            # @param [String] timers_inactive ISO8601 duration when conversation will be
            #   switched to `inactive` state. Minimum value for this timer is 1 minute.
            # @param [String] timers_closed ISO8601 duration when conversation will be
            #   switched to `closed` state. Minimum value for this timer is 10 minutes.
            # @param [conversation.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [ConversationInstance] Updated ConversationInstance
            def update(friendly_name: :unset, date_created: :unset, date_updated: :unset, attributes: :unset, messaging_service_sid: :unset, state: :unset, timers_inactive: :unset, timers_closed: :unset, x_twilio_webhook_enabled: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                  'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                  'Attributes' => attributes,
                  'MessagingServiceSid' => messaging_service_sid,
                  'State' => state,
                  'Timers.Inactive' => timers_inactive,
                  'Timers.Closed' => timers_closed,
              })
              headers = Twilio::Values.of({'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })

              payload = @version.update('POST', @uri, data: data, headers: headers)

              ConversationInstance.new(
                  @version,
                  payload,
                  chat_service_sid: @solution[:chat_service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Delete the ConversationInstance
            # @param [conversation.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete(x_twilio_webhook_enabled: :unset)
              headers = Twilio::Values.of({'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })

               @version.delete('DELETE', @uri, headers: headers)
            end

            ##
            # Fetch the ConversationInstance
            # @return [ConversationInstance] Fetched ConversationInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              ConversationInstance.new(
                  @version,
                  payload,
                  chat_service_sid: @solution[:chat_service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Access the participants
            # @return [ParticipantList]
            # @return [ParticipantContext] if sid was passed.
            def participants(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return ParticipantContext.new(@version, @solution[:chat_service_sid], @solution[:sid], sid, )
              end

              unless @participants
                @participants = ParticipantList.new(
                    @version,
                    chat_service_sid: @solution[:chat_service_sid],
                    conversation_sid: @solution[:sid],
                )
              end

              @participants
            end

            ##
            # Access the messages
            # @return [MessageList]
            # @return [MessageContext] if sid was passed.
            def messages(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return MessageContext.new(@version, @solution[:chat_service_sid], @solution[:sid], sid, )
              end

              unless @messages
                @messages = MessageList.new(
                    @version,
                    chat_service_sid: @solution[:chat_service_sid],
                    conversation_sid: @solution[:sid],
                )
              end

              @messages
            end

            ##
            # Access the webhooks
            # @return [WebhookList]
            # @return [WebhookContext] if sid was passed.
            def webhooks(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return WebhookContext.new(@version, @solution[:chat_service_sid], @solution[:sid], sid, )
              end

              unless @webhooks
                @webhooks = WebhookList.new(
                    @version,
                    chat_service_sid: @solution[:chat_service_sid],
                    conversation_sid: @solution[:sid],
                )
              end

              @webhooks
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.ConversationContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.ConversationContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class ConversationInstance < InstanceResource
            ##
            # Initialize the ConversationInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] chat_service_sid The unique ID of the [Conversation
            #   Service](https://www.twilio.com/docs/conversations/api/service-resource) this
            #   conversation belongs to.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource. Can also be the `unique_name` of the Conversation.
            # @return [ConversationInstance] ConversationInstance
            def initialize(version, payload, chat_service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'chat_service_sid' => payload['chat_service_sid'],
                  'messaging_service_sid' => payload['messaging_service_sid'],
                  'sid' => payload['sid'],
                  'friendly_name' => payload['friendly_name'],
                  'unique_name' => payload['unique_name'],
                  'attributes' => payload['attributes'],
                  'state' => payload['state'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'timers' => payload['timers'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'chat_service_sid' => chat_service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ConversationContext] ConversationContext for this ConversationInstance
            def context
              unless @instance_context
                @instance_context = ConversationContext.new(@version, @params['chat_service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique ID of the Account responsible for this conversation.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The unique ID of the Conversation Service this conversation belongs to.
            def chat_service_sid
              @properties['chat_service_sid']
            end

            ##
            # @return [String] The unique ID of the Messaging Service this conversation belongs to.
            def messaging_service_sid
              @properties['messaging_service_sid']
            end

            ##
            # @return [String] A 34 character string that uniquely identifies this resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The human-readable name of this conversation.
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] An application-defined string that uniquely identifies the resource
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] An optional string metadata field you can use to store any data you wish.
            def attributes
              @properties['attributes']
            end

            ##
            # @return [conversation.State] Current state of this conversation.
            def state
              @properties['state']
            end

            ##
            # @return [Time] The date that this resource was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this resource was last updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [Hash] Timer date values for this conversation.
            def timers
              @properties['timers']
            end

            ##
            # @return [String] An absolute URL for this conversation.
            def url
              @properties['url']
            end

            ##
            # @return [String] Absolute URLs to access the Participants, Messages and Webhooks of this Conversation.
            def links
              @properties['links']
            end

            ##
            # Update the ConversationInstance
            # @param [String] friendly_name The human-readable name of this conversation,
            #   limited to 256 characters. Optional.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated.
            # @param [String] attributes An optional string metadata field you can use to
            #   store any data you wish. The string value must contain structurally valid JSON
            #   if specified.  **Note** that if the attributes are not set "{}" will be
            #   returned.
            # @param [String] messaging_service_sid The unique ID of the [Messaging
            #   Service](https://www.twilio.com/docs/sms/services/api) this conversation belongs
            #   to.
            # @param [conversation.State] state Current state of this conversation. Can be
            #   either `active`, `inactive` or `closed` and defaults to `active`
            # @param [String] timers_inactive ISO8601 duration when conversation will be
            #   switched to `inactive` state. Minimum value for this timer is 1 minute.
            # @param [String] timers_closed ISO8601 duration when conversation will be
            #   switched to `closed` state. Minimum value for this timer is 10 minutes.
            # @param [conversation.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [ConversationInstance] Updated ConversationInstance
            def update(friendly_name: :unset, date_created: :unset, date_updated: :unset, attributes: :unset, messaging_service_sid: :unset, state: :unset, timers_inactive: :unset, timers_closed: :unset, x_twilio_webhook_enabled: :unset)
              context.update(
                  friendly_name: friendly_name,
                  date_created: date_created,
                  date_updated: date_updated,
                  attributes: attributes,
                  messaging_service_sid: messaging_service_sid,
                  state: state,
                  timers_inactive: timers_inactive,
                  timers_closed: timers_closed,
                  x_twilio_webhook_enabled: x_twilio_webhook_enabled,
              )
            end

            ##
            # Delete the ConversationInstance
            # @param [conversation.WebhookEnabledType] x_twilio_webhook_enabled The
            #   X-Twilio-Webhook-Enabled HTTP request header
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete(x_twilio_webhook_enabled: :unset)
              context.delete(x_twilio_webhook_enabled: x_twilio_webhook_enabled, )
            end

            ##
            # Fetch the ConversationInstance
            # @return [ConversationInstance] Fetched ConversationInstance
            def fetch
              context.fetch
            end

            ##
            # Access the participants
            # @return [participants] participants
            def participants
              context.participants
            end

            ##
            # Access the messages
            # @return [messages] messages
            def messages
              context.messages
            end

            ##
            # Access the webhooks
            # @return [webhooks] webhooks
            def webhooks
              context.webhooks
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.ConversationInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.ConversationInstance #{values}>"
            end
          end
        end
      end
    end
  end
end