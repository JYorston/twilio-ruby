##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Flex
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FlexApi < FlexApiBase
            class V1 < Version
                class InsightsConversationsList < ListResource
                    ##
                    # Initialize the InsightsConversationsList
                    # @param [Version] version Version that contains the resource
                    # @return [InsightsConversationsList] InsightsConversationsList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Insights/Conversations"
                        
                    end
                
                    ##
                    # Lists InsightsConversationsInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] token The Token HTTP request header
                    # @param [String] segment_id Unique Id of the segment for which conversation details needs to be fetched
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(token: :unset, segment_id: :unset, limit: nil, page_size: nil)
                        self.stream(
                            token: token,
                            segment_id: segment_id,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] token The Token HTTP request header
                    # @param [String] segment_id Unique Id of the segment for which conversation details needs to be fetched
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(token: :unset, segment_id: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            token: token,
                            segment_id: segment_id,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields InsightsConversationsInstance records from the API.
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
                    # Retrieve a single page of InsightsConversationsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] token The Token HTTP request header
                    # @param [String] segment_id Unique Id of the segment for which conversation details needs to be fetched
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of InsightsConversationsInstance
                    def page(token: :unset, segment_id: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'Token' => token,
                            
                            'SegmentId' => segment_id,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        InsightsConversationsPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of InsightsConversationsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of InsightsConversationsInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    InsightsConversationsPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InsightsConversationsList>'
                    end
                end

                class InsightsConversationsPage < Page
                    ##
                    # Initialize the InsightsConversationsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InsightsConversationsPage] InsightsConversationsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InsightsConversationsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InsightsConversationsInstance] InsightsConversationsInstance
                    def get_instance(payload)
                        InsightsConversationsInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InsightsConversationsPage>'
                    end
                end
                class InsightsConversationsInstance < InstanceResource
                    ##
                    # Initialize the InsightsConversationsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InsightsConversations
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InsightsConversationsInstance] InsightsConversationsInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_id' => payload['account_id'],
                            'conversation_id' => payload['conversation_id'],
                            'segment_count' => payload['segment_count'] == nil ? payload['segment_count'] : payload['segment_count'].to_i,
                            'segments' => payload['segments'],
                        }
                    end

                    
                    ##
                    # @return [String] The id of the account.
                    def account_id
                        @properties['account_id']
                    end
                    
                    ##
                    # @return [String] The unique id of the conversation
                    def conversation_id
                        @properties['conversation_id']
                    end
                    
                    ##
                    # @return [String] The count of segments for a conversation
                    def segment_count
                        @properties['segment_count']
                    end
                    
                    ##
                    # @return [Array<Hash>] The Segments of a conversation
                    def segments
                        @properties['segments']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.FlexApi.V1.InsightsConversationsInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.FlexApi.V1.InsightsConversationsInstance>"
                    end
                end

            end
        end
    end
end
