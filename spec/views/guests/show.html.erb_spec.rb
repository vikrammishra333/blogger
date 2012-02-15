require 'spec_helper'

describe "guests/show" do
  before(:each) do
    @guest = assign(:guest, stub_model(Guest,
      :name => "Name",
      :email => "Email",
      :homepage_url => "Homepage Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Homepage Url/)
  end
end
