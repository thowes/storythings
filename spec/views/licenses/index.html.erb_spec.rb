require 'spec_helper'

describe "licenses/index" do
  before(:each) do
    assign(:licenses, [
      stub_model(License,
        :name => "Name",
        :price => "9.99"
      ),
      stub_model(License,
        :name => "Name",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of licenses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
