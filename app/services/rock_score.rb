require 'pry'
require_relative "../../app/services/search_engine"
class RockScore 

  class NoScore < RuntimeError
    
  end

  def initialize(printer)
    @printer = printer
  end

  def self.for_term(term)
    positive = SearchEngine.count_results("#{term} rocks").to_f
    negative = SearchEngine.count_results("#{term} sucks").to_f
    score = 10 * positive / (positive + negative)
    score.nan? ? nil : score
  end

end