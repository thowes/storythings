require 'spec_helper'

describe "Quests" do
	before do
		@quest = Quest.new(name: "Example Quest", qtype: "QA")
	end
	subject { @quest }

  describe "GET /quests" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get quests_path
      response.status.should be(200)
    end
  end
end