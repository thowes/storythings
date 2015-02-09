require 'spec_helper'

describe "experiences/index" do
  before(:each) do
    assign(:experiences, [
      stub_model(Experience),
      stub_model(Experience)
    ])
  end

  it "renders a list of experiences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
