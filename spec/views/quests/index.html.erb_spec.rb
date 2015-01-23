require 'spec_helper'

describe "quests/index" do
  before(:each) do
    assign(:quests, [
      stub_model(Quest,
        :name => "Name",
        :qtype => "Type",
        :mother => 1,
        :next_quest => 2,
        :prev_quest => 3
      ),
      stub_model(Quest,
        :name => "Name",
        :qtype => "Type",
        :mother => 1,
        :next_quest => 2,
        :prev_quest => 3
      )
    ])
  end

  it "renders a list of quests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
