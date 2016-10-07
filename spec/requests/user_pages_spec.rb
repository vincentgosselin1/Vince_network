require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit "users/#{user.id}" }#Ugly, but I got stuck hard and I must moove.

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit '/signup' }#same here.

    it { should have_content('Sign up') }
    it { should have_title('Sign up') }
  end
end

