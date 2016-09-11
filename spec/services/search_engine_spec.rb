require 'rails_helper'

# require_relative "../../app/services/search_engine" 
describe SearchEngine do 
  it "counts result" do 
    VCR.use_cassette("windows-vs-beos") do 
      windows = SearchEngine.count_results("windows")
      beos = SearchEngine.count_results("beos")
      expect(windows).to be > beos
    end
  end
end