require_relative "../../app/services/rock_score"
require_relative "../../app/services/score_cache"

describe ScoreCache do 

  it "returns cached results if they exist" do 
    allow(CachedScore).to receive(:for_term).with("microsoft").and_return(5.5)
    expect(ScoreCache.for_term("microsoft")).to eq(5.5)
  end

  it "recomputes results if they dont exists" do 
    allow(RockScore).to receive(:for_term).with("microsoft").and_return(5.5)
    allow(CachedScore).to receive(:for_term).with("microsoft")
    .and_raise(CachedScore::NoScore)
    allow(CachedScore).to receive(:save_score)
    expect(ScoreCache.for_term("microsoft")).to eq(5.5)
  end

  ## needs mock as its a destructive operation
  it "stores new score in the database" do 
    allow(RockScore).to receive(:for_term).with("microsoft").and_return(5.5)
    allow(CachedScore).to receive(:for_term).with("microsoft")
    .and_raise(CachedScore::NoScore)
    expect(CachedScore).to receive(:save_score).with("microsoft",5.5)
    # expect(ScoreCache.for_term("microsoft"))
    ScoreCache.for_term("microsoft")
  end

end