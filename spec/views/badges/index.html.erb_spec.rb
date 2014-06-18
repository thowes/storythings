require 'spec_helper'

describe "badges/index" do
  before(:each) do
    assign(:badges, [
      stub_model(Badge,
        :name => "Name",
        :picture => "Picture"
      ),
      stub_model(Badge,
        :name => "Name",
        :picture => "Picture"
      )
    ])
  end

  it "renders a list of badges" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
