require 'spec_helper'

describe "reserervations/index" do
  before(:each) do
    assign(:reserervations, [
      stub_model(Reserervation),
      stub_model(Reserervation)
    ])
  end

  it "renders a list of reserervations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
