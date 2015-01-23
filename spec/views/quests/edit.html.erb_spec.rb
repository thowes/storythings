require 'spec_helper'

describe "quests/edit" do
  before(:each) do
    @quest = assign(:quest, stub_model(Quest,
      :name => "MyString",
      :qtype => "",
      :mother => 1,
      :next_quest => 1,
      :prev_quest => 1
    ))
  end

  it "renders the edit quest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quest_path(@quest), "post" do
      assert_select "input#quest_name[name=?]", "quest[name]"
      assert_select "input#quest_qtype[name=?]", "quest[qtype]"
      assert_select "input#quest_mother[name=?]", "quest[mother]"
      assert_select "input#quest_next_quest[name=?]", "quest[next_quest]"
      assert_select "input#quest_prev_quest[name=?]", "quest[prev_quest]"
    end
  end
end
