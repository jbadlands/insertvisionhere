require 'test_helper'

class DebateTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_debate_should_not_save_without_proposition
    debate = Debate.new
	assert !debate.save, "Debate saved without a Proposition"
  end
  
  def test_debate_should_not_save_without_current_user_id
   debate = Debate.new
   assert !debate.save
  end
end
