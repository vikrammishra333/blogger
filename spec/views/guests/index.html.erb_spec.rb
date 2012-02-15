require 'spec_helper'

describe "guests/index" do
  before(:each) do
    assign(:guests, [
      stub_model(Guest,
        :name => "Name",
        :email => "Email",
        :homepage_url => "Homepage Url"
      ),
      stub_model(Guest,
        :name => "Name",
        :email => "Email",
        :homepage_url => "Homepage Url"
      )
    ])
  end

  it "renders a list of guests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Homepage Url".to_s, :count => 2
  end
end
