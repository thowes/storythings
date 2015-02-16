require 'spec_helper'

describe "Quests" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  let(:wrong) { FactoryGirl.create(:user, name: "Mr. Wrong") }
  let!(:quest) { FactoryGirl.create(:quest, name: "The Testing Quest") }
  let!(:u_xp) { FactoryGirl.create(:experience, name: "The Correct Experience", user: user, quest: quest) }
  let!(:w_xp) { FactoryGirl.create(:experience, name: "The Wrong Experience", user: wrong, quest: quest) }

  describe "Quests before login" do
    describe "index page" do
      before { visit quests_path }
      let(:page_title) { 'Quests' }
      it_should_behave_like "pages before login"
      it { should_not have_content(quest.name) }
    end
    describe "show page" do
      before { visit quest_path(quest) }
      let(:page_title) { quest.name }
      it_should_behave_like "pages before login"
      it { should_not have_content(quest.name) }
    end
  end

  describe "Quests after login" do
    before { sign_in user }
    describe "index page" do
      before { visit quests_path }
      let(:page_title) { 'Quests' }
      it_should_behave_like "pages after login"
      it { should have_content(quest.name) }
      #it { should have_link(quest.name, href: quest_path(quest)) }
    end
    describe "show page" do
      before { visit quest_path(quest) }
      let(:page_title) { quest.name }
      it_should_behave_like "pages after login"
      it { should have_content(quest.name) }
      #it { should have_content(u_xp.name) }
      #it { should_not have_content(w_xp.name) }
    end
  end

end
