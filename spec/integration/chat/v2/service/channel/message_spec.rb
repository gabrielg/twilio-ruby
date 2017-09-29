##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Message' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .messages("IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-03-24T20:37:57Z",
          "date_updated": "2016-03-24T20:37:57Z",
          "last_updated_by": null,
          "was_edited": false,
          "from": "system",
          "attributes": "{}",
          "body": "Hello",
          "index": 0,
          "type": "text",
          "media": null,
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .messages("IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "receives fetch_media responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2016-03-24T20:37:57Z",
          "date_updated": "2016-03-24T20:37:57Z",
          "last_updated_by": null,
          "was_edited": false,
          "from": "system",
          "attributes": "{}",
          "body": "Hello",
          "index": 0,
          "type": "media",
          "media": {
              "sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              "size": 99999999999999,
              "content_type": "application/pdf",
              "filename": "hello.pdf"
          },
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .messages("IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .messages.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": null,
          "date_created": "2016-03-24T20:37:57Z",
          "date_updated": "2016-03-24T20:37:57Z",
          "last_updated_by": "system",
          "was_edited": false,
          "from": "system",
          "body": "Hello",
          "index": 0,
          "type": "text",
          "media": null,
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .messages.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_with_all responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "last_updated_by": "username",
          "was_edited": true,
          "from": "system",
          "attributes": "{\\"test\\": \\"test\\"}",
          "body": "Hello",
          "index": 0,
          "type": "text",
          "media": null,
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .messages.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_media responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": null,
          "date_created": "2016-03-24T20:37:57Z",
          "date_updated": "2016-03-24T20:37:57Z",
          "last_updated_by": "system",
          "was_edited": false,
          "from": "system",
          "body": "Hello",
          "index": 0,
          "type": "text",
          "media": {
              "sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
              "size": 99999999999999,
              "content_type": "application/pdf",
              "filename": "hello.pdf"
          },
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .messages.create()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .messages.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "messages"
          },
          "messages": [
              {
                  "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "to": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-03-24T20:37:57Z",
                  "date_updated": "2016-03-24T20:37:57Z",
                  "last_updated_by": null,
                  "was_edited": false,
                  "from": "system",
                  "attributes": "{}",
                  "body": "Hello",
                  "index": 0,
                  "type": "text",
                  "media": null,
                  "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              },
              {
                  "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "to": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2016-03-24T20:37:57Z",
                  "date_updated": "2016-03-24T20:37:57Z",
                  "last_updated_by": null,
                  "was_edited": false,
                  "from": "system",
                  "attributes": "{}",
                  "body": "Hello",
                  "index": 0,
                  "type": "media",
                  "media": {
                      "sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "size": 99999999999999,
                      "content_type": "application/pdf",
                      "filename": "hello.pdf"
                  },
                  "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .messages.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "messages"
          },
          "messages": []
      }
      ]
    ))

    actual = @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .messages.list()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .messages("IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .messages("IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()

    expect(actual).to eq(true)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                     .messages("IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "channel_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": "{ \\"foo\\": \\"bar\\" }",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "last_updated_by": "username",
          "was_edited": true,
          "from": "system",
          "body": "Hello",
          "index": 0,
          "type": "text",
          "media": null,
          "url": "https://chat.twilio.com/v2/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Channels/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.chat.v2.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .channels("CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .messages("IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()

    expect(actual).to_not eq(nil)
  end
end