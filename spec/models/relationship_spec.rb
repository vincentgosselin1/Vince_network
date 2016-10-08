require 'spec_helper'

describe Relationship do

  let(:friend) { FactoryGirl.create(:user) }
  let(:friends_with) { FactoryGirl.create(:user) }
  let(:relationship) { friend.relationships.build(friends_with_id: friends_with.id) }

  subject { relationship }

  it { should be_valid }

  describe "friend methods" do
    it { should respond_to(:friend) }
    it { should respond_to(:friends_with) }
    its(:friend) { should eq friend }
    its(:friends_with) { should eq friends_with }
  end

   describe "when friends_with id is not present" do
    before { relationship.friends_with_id = nil }
    it { should_not be_valid }
  end

  describe "when friend id is not present" do
    before { relationship.friend_id = nil }
    it { should_not be_valid }
  end

end
