require 'spec_helper'

describe "licenses/show" do
  before(:each) do
    @license = assign(:license, stub_model(License,
      :name => "Name",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
  end
end
