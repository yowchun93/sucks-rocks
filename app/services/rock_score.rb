require 'pry'
class RockScore 

  def initialize(printer)
    @printer = printer
  end

  def self.for_term(term)
    positive = SearchEngine.count_results("#{term} rocks").to_f
    negative = SearchEngine.count_results("#{term} sucks").to_f
    10 * positive / (positive + negative)
  end

end