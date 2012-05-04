
require "spec_helper"

describe ApplicationHelper do
  describe "compare_for_nil" do
    it "returns true" do
      helper.compare_for_nil(0).should be_true
    end
    it "returns false" do
      helper.compare_for_nil(1).should be_false
    end
  end
end