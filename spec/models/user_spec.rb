require 'spec_helper'

describe User do
  context "relationship" do
    it { should have_many(:posts)}
  end
end
