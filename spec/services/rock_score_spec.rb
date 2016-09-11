require_relative "../../app/services/rock_score" 
require_relative "../../app/services/search_engine" 

describe RockScore do 
  it "computes score for search terms "do 
            
  end
    
  it "return 0 for unpopular terms " do 
    search_engine = class_double("SearchEngine")
    allow(SearchEngine).to receive(:count_results).with("apple rocks").and_return(0)
    allow(SearchEngine).to receive(:count_results).with("apple sucks").and_return(1)
    expect(RockScore.for_term("apple")).to eq(0.0)
  end

  it "returns 10 for popular terms" do 
    # search_engine = double(:search_engine)
    allow(SearchEngine).to receive(:count_results).with("apple rocks").and_return(1)
    allow(SearchEngine).to receive(:count_results).with("apple sucks").and_return(0)
    expect(RockScore.for_term("apple")).to eq(10.0)
  end

  it "returns mediocre results from mediocre terms" do 
    allow(SearchEngine).to receive(:count_results).with("apple rocks").and_return(9)
    allow(SearchEngine).to receive(:count_results).with("apple sucks").and_return(11)
    expect(RockScore.for_term("apple")).to eq(4.5)
  end

  it "does not divide by zero" do 
    allow(SearchEngine).to receive(:count_results).with("apple rocks").and_return(0)
    allow(SearchEngine).to receive(:count_results).with("apple sucks").and_return(0)
    expect(RockScore.for_term("apple")).to eq(nil)
  end

end