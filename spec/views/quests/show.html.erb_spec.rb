require 'spec_helper'

describe "quests/show" do
  before(:each) do
    @quest = assign(:quest, stub_model(Quest,
      :name => "Name",
      :type => "Type",
      :mother => 1,
      :next => 2,
      :prev => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Type/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
