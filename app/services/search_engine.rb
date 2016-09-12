require 'vcr'
require 'google_custom_search_api'

class SearchEngine
  def self.count_results(query)
    results = GoogleCustomSearchApi.search(query).queries.request[0]["totalResults"]
  end
end