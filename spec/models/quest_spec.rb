require 'spec_helper'

describe Quest do
	before do
		@quest = Quest.new(name: "Example Quest", qtype: "QA")
	end
	subject { @quest }

	it { should respond_to(:name) }
	it { should respond_to(:qtype) }
	it { should respond_to(:mother) }
	it { should respond_to(:next_quest) }
	it { should respond_to(:prev_quest) }

	describe "with name blank" do
		before { @quest.name = " " }
		it { should_not be_valid }
	end
	describe "with name that is too long" do
		before { @quest.name = "a" * 81 }
		it { should_not be_valid }
	end

	describe "with blank type" do
		before { @quest.qtype = " " }
		it { should_not be_valid }
	end
	describe "with type too long" do
		before { @quest.qtype = "a" * 81 }
		it { should_not be_valid }
	end
end
