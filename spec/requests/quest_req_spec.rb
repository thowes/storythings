require 'spec_helper'

describe "Quests" do
  subject { page }
  let(:user) { FactoryGirl.create(:user, name: "Mr. Admin") }
  let(:wrong) { FactoryGirl.create(:user, name: "Mr. Wrong") }
  let!(:quest) { FactoryGirl.create(:quest, name: "The Testing Quest") }
  let!(:other_quest) { FactoryGirl.create(:quest, name: "The Other Quest") }
  let!(:u_xp) { FactoryGirl.create(:experience, name: "The Correct Experience", user: user, quest: quest) }
  let!(:o_xp) { FactoryGirl.create(:experience, name: "The Other Experience", user: user, quest: other_quest) }
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
    describe "new page" do
      before { visit new_quest_path }
      let(:page_title) { 'New Quest' }
      it_should_behave_like "pages before login"
    end
    describe "edit page" do
      before { visit edit_quest_path(quest) }
      let(:page_title) { 'Edit Quest' }
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
      it { should have_link(quest.name, href: quest_path(quest)) }
    end
    describe "show page" do
      before { visit quest_path(quest) }
      let(:page_title) { quest.name }
      it_should_behave_like "pages after login"
      it { should have_content(quest.name) }
      it { should have_content(u_xp.name) }
      it { should_not have_content(o_xp.name) }
      it { should_not have_content(w_xp.name) }
    end
    describe "new page" do
      before { visit new_quest_path }
      let(:page_title) { 'New Quest' }
      it_should_behave_like "pages after login"
    end
    describe "edit page" do
      before { visit edit_quest_path(quest) }
      let(:page_title) { 'Edit Quest' }
      it_should_behave_like "pages after login"
      #it { should have_content(quest.name) }
    end
  end

  describe "Quests not admin" do
    before { sign_in wrong }
    describe "new page" do
      before { visit new_quest_path }
      let(:page_title) { 'New Quest' }
      #it_should_behave_like "pages before login"
    end
    describe "edit page" do
      before { visit edit_quest_path(quest) }
      let(:page_title) { 'Edit Quest' }
      #it_should_behave_like "pages before login"
    end
  end

end
