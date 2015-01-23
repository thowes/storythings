require 'spec_helper'

describe "quests/new" do
  before(:each) do
    assign(:quest, stub_model(Quest,
      :name => "MyString",
      :type => "",
      :mother => 1,
      :next_quest => 1,
      :prev_quest => 1
    ).as_new_record)
  end

  it "renders new quest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quests_path, "post" do
      assert_select "input#quest_name[name=?]", "quest[name]"
      assert_select "input#quest_qtype[name=?]", "quest[qtype]"
      assert_select "input#quest_mother[name=?]", "quest[mother]"
      assert_select "input#quest_next_quest[name=?]", "quest[next_quest]"
      assert_select "input#quest_prev_quest[name=?]", "quest[prev_quest]"
    end
  end
end
