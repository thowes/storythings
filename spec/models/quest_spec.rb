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
end
