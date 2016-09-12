require 'rails_helper'

feature "Signing in" do 

  scenario "user search for a term" do |term|
   @scores ||= {}
   @scores[term] = RockScore.for_term(term)
  end

  scenario "apple should have higher score than microsoft" do 
    apple_score = RockScore.for_term("apple")
    microsoft_score = RockScore.for_term("microsoft")
    expect(apple_score).to be > microsoft_score
  end

  scenario "user search for apple" do 
    
  end

end
