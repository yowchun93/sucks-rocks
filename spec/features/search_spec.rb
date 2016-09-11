require 'rails_helper'

feature "Signing in" do 

  scenario "user search for a term" do |term|
   @scores ||= {}
   @scores[term] = RockScore.for_term(term)
  end

  scenario "user search for microsoft" do 
    
  end

  scenario "user search for apple" do 

  end

end
