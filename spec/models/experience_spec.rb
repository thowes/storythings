require 'spec_helper'

describe Experience do
	before do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@quest = Quest.new(name: "Example Quest", qtype: "QA")
		@experience = Experience.new(title: "Test Experience 1", description: "This is testing the experience class model,", user_id: @user, quest_id: @quest)
	end

	subject { @experience }
	it { should respond_to(:title) }
	it { should respond_to(:description) }
	it { should respond_to(:user_id) }
	it { should respond_to(:quest_id) }

	describe "with title blank" do
		before { @experience.title = " " }
		it { should_not be_valid }
	end
	describe "with title that is too long" do
		before { @experience.title = "a" * 101 }
		it { should_not be_valid }
	end

end
