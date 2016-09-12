require "rails_helper"

describe CachedScore do 
  
  it "saves score" do 
    CachedScore.save_score("microsoft", 7.5)
    expect(CachedScore.for_term("microsoft")).to eq(7.5)
  end

  it "remembers score" do 
    CachedScore.create(:term => "microsoft", :score => 7.5)
    expect(CachedScore.for_term("microsoft")).to eq(7.5)
  end
  it "raise exception if terms is not cached" do 
    expect(CachedScore.for_term("microsoft")).to raise(CachedScore::NoScore)
  end
  
  it "stores to database" do 

  end

end
