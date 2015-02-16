require 'spec_helper'

describe "Experience pages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  let(:wrong) { FactoryGirl.create(:user, name: "Mr. Wrong") }
  let!(:quest) { FactoryGirl.create(:quest, name: "The Testing Quest") }
  let!(:other_quest) { FactoryGirl.create(:quest, name: "The Other Quest") }
  let!(:u_xp) { FactoryGirl.create(:experience, name: "The Correct Experience", user: user, quest: quest) }
  let!(:w_xp) { FactoryGirl.create(:experience, name: "The Wrong Experience", user: wrong, quest: quest) }

  describe "Experiences before login" do
    describe "index page" do
      before { visit experiences_path }
      let(:page_title) { 'Experiences' }
      it_should_behave_like "pages before login"
      it { should_not have_content(u_xp.name) }
      it { should_not have_content(w_xp.name) }
    end
    describe "show page" do
      before { visit experience_path(u_xp) }
      let(:page_title) { u_xp.name }
      it_should_behave_like "pages before login"
      it { should_not have_content(u_xp.name) }
    end
  end

  describe "Experiences after login" do
    before { sign_in user }
    describe "index page" do
      before { visit experiences_path }
      let(:page_title) { 'Experiences' }
      it_should_behave_like "pages after login"
      it { should have_content(u_xp.name) }
      it { should have_link(u_xp.name, href: experience_path(u_xp)) }
      it { should_not have_content(w_xp.name) }
    end
    describe "show page" do
      before { visit experience_path(u_xp) }
      let(:page_title) { u_xp.name }
      it_should_behave_like "pages after login"
      it { should have_content(u_xp.name) }
    end
  end

end
