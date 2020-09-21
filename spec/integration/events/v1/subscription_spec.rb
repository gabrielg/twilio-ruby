##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Subscription' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.events.v1.subscriptions.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://events.twilio.com/v1/Subscriptions',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "subscriptions": [],
          "meta": {
              "page": 0,
              "page_size": 10,
              "first_page_url": "https://events.twilio.com/v1/Subscriptions?PageSize=10&Page=0",
              "previous_page_url": null,
              "url": "https://events.twilio.com/v1/Subscriptions?PageSize=10&Page=0",
              "next_page_url": null,
              "key": "subscriptions"
          }
      }
      ]
    ))

    actual = @client.events.v1.subscriptions.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_results responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "subscriptions": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:01:33Z",
                  "sid": "DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sink_sid": "DGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "description": "A subscription",
                  "url": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "subscribed_events": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SubscribedEvents"
                  }
              },
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:01:33Z",
                  "sid": "DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",
                  "sink_sid": "DGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "description": "Another subscription",
                  "url": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",
                  "links": {
                      "subscribed_events": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab/SubscribedEvents"
                  }
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 20,
              "first_page_url": "https://events.twilio.com/v1/Subscriptions?PageSize=20&Page=0",
              "previous_page_url": null,
              "url": "https://events.twilio.com/v1/Subscriptions?PageSize=20&Page=0",
              "next_page_url": null,
              "key": "subscriptions"
          }
      }
      ]
    ))

    actual = @client.events.v1.subscriptions.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.events.v1.subscriptions('DFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://events.twilio.com/v1/Subscriptions/DFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:01:33Z",
          "sid": "DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sink_sid": "DGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "description": "A subscription",
          "url": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "subscribed_events": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SubscribedEvents"
          }
      }
      ]
    ))

    actual = @client.events.v1.subscriptions('DFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.events.v1.subscriptions.create(description: 'description', sink_sid: 'DGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', types: [{}])
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'Description' => 'description',
        'SinkSid' => 'DGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        'Types' => Twilio.serialize_list([{}]) { |e| Twilio.serialize_object(e) },
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://events.twilio.com/v1/Subscriptions',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:01:33Z",
          "sid": "DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sink_sid": "DGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "description": "A subscription",
          "url": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "subscribed_events": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SubscribedEvents"
          }
      }
      ]
    ))

    actual = @client.events.v1.subscriptions.create(description: 'description', sink_sid: 'DGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', types: [{}])

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.events.v1.subscriptions('DFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://events.twilio.com/v1/Subscriptions/DFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2020-07-30T20:01:33Z",
          "sid": "DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sink_sid": "DGaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",
          "description": "Updated description",
          "url": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "subscribed_events": "https://events.twilio.com/v1/Subscriptions/DFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SubscribedEvents"
          }
      }
      ]
    ))

    actual = @client.events.v1.subscriptions('DFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.events.v1.subscriptions('DFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://events.twilio.com/v1/Subscriptions/DFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.events.v1.subscriptions('DFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end
end