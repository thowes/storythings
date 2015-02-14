require 'spec_helper'

describe "Experience pages" do
	before do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@quest = Quest.new(name: "Example Quest", qtype: "QA")
		@experience = Experience.new(title: "Test Experience 1", description: "This is testing the experience class model,", user_id: @user, quest_id: @quest)
	end
  subject { @experience }

  describe "before login" do
    describe "Experiences index page" do
      #before { visit experiences_path }
      #let(:page_title) { 'Experiences' }
      #it_should_behave_like "pages before login"
      #it { should have_content("Test Experience 1") }
    end
	end

end
