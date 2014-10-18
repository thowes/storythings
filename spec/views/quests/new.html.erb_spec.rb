require 'spec_helper'

describe "quests/new" do
  before(:each) do
    assign(:quest, stub_model(Quest,
      :name => "MyString",
      :type => "",
      :mother => 1,
      :next => 1,
      :prev => 1
    ).as_new_record)
  end

  it "renders new quest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quests_path, "post" do
      assert_select "input#quest_name[name=?]", "quest[name]"
      assert_select "input#quest_type[name=?]", "quest[type]"
      assert_select "input#quest_mother[name=?]", "quest[mother]"
      assert_select "input#quest_next[name=?]", "quest[next]"
      assert_select "input#quest_prev[name=?]", "quest[prev]"
    end
  end
end
