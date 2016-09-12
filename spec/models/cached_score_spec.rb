require "rails_helper"

describe CachedScore do 
  
  it "remembers score" do 
    CachedScore.create(:term => "microsoft", :score => 7.5)
    expect(CachedScore.for_term("microsoft")).to eq(7.5)
  end

  it "raise exception if terms is not cached" do 
    expect(CachedScore.for_term("microsoft")).to raise(CachedScore::NoScore)
  end
  
  it "saves NoScores as nil" do 
    CachedScore.save_score("microsoft", RockScore::NoScore)
    expect(CachedScore.for_term("microsoft")).to eq(nil)
  end
  
end
