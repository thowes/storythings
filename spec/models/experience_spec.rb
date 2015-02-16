require 'spec_helper'

describe Experience do
	before do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@quest = Quest.new(name: "Example Quest", qtype: "QA")
		@experience = Experience.new(name: "Test Experience 1", description: "This is testing the experience class model,", user_id: @user, quest_id: @quest)
	end

	subject { @experience }
	it { should respond_to(:name) }
	it { should respond_to(:description) }
	it { should respond_to(:user_id) }
	it { should respond_to(:quest_id) }

	describe "with name blank" do
		before { @experience.name = " " }
		it { should_not be_valid }
	end
	describe "with name that is too long" do
		before { @experience.name = "a" * 101 }
		it { should_not be_valid }
	end

	describe "when user_id is not present" do
		before { @experience.user_id = nil }
		it { should_not be_valid }
	end

end
