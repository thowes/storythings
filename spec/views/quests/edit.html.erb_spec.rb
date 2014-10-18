require 'spec_helper'

describe "quests/edit" do
  before(:each) do
    @quest = assign(:quest, stub_model(Quest,
      :name => "MyString",
      :type => "",
      :mother => 1,
      :next => 1,
      :prev => 1
    ))
  end

  it "renders the edit quest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quest_path(@quest), "post" do
      assert_select "input#quest_name[name=?]", "quest[name]"
      assert_select "input#quest_type[name=?]", "quest[type]"
      assert_select "input#quest_mother[name=?]", "quest[mother]"
      assert_select "input#quest_next[name=?]", "quest[next]"
      assert_select "input#quest_prev[name=?]", "quest[prev]"
    end
  end
end
