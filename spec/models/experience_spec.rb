require 'spec_helper'

describe Experience do
	before do
		@experience = Experience.new(title: "Xp 1", description: "Testing")
	end
	subject { @experience }

	it { should respond_to(:title) }
	it { should respond_to(:description) }
	it { should respond_to(:user_id) }
	it { should respond_to(:quest_id) }
end
