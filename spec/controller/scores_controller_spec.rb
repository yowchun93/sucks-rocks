require 'spec_helper'

describe ScoresController do 
  it "returns score for terms" do 
    allow(ScoreCache).to receive(:for_term).and_return(7.5)
    expect(response.body).to eq({:term => "microsoft", :score => 8.5}.to_json) 
  end
end