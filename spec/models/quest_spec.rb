require 'spec_helper'

describe Quest do
	before do
		@quest = Quest.new(name: "Example Quest")
	end
	subject { @quest }

	it { should respond_to(:name) }
	it { should respond_to(:type) }
	it { should respond_to(:mother) }
	it { should respond_to(:next) }
	it { should respond_to(:prev) }
end
