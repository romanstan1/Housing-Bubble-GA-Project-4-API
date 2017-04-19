class ZooplaController < ApplicationController
  def search_properties
    repsonse = HTTParty.get("http://api.zoopla.co.uk/api/v1/property_listings.json", {
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
  end
end
