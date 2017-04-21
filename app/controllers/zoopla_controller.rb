class ZooplaController < ApplicationController

  class KitchenParty
    include HTTParty
    disable_rails_query_string_format
  end

  def search_properties
    repsonse = KitchenParty.get("http://api.zoopla.co.uk/api/v1/property_listings.json", {
      query: {
        api_key: ENV["ZOOPLA_API_KEY"],
        area: params[:location],
        listing_status: 'sale',
        keywords: 'residential',
        page_size: 100,
        minimum_beds: 1,
      },
      headers: { 'Accept' => 'application/json' }
    })

    render json: repsonse, status: :ok if repsonse
  end

  def user_properties
    p params[:listing_ids].split(',')
    repsonse = KitchenParty.get("http://api.zoopla.co.uk/api/v1/property_listings.json", {
      query: {
        # listing_id: :listing_id,
        # listing_id: `#{params[:array]}`,
        listing_id: params[:listing_ids].split(','),
        # listing_id: [:array],
        # listing_id: clean(params[:listing_id]),
        # listing_id: [35940943, 43307305],
        # listing_id: [35940943, 43307305],
        page_size: 50,
        api_key: ENV["ZOOPLA_API_KEY"],

      },
      headers: { 'Accept' => 'application/json' }
    })
    render json: repsonse, status: :ok if repsonse
  end

  # def clean(up)
  #   up
  #
  # end
end
