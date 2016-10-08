require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Vince'" do
      visit '/'
      expect(page).to have_content('Vince')
    end
  end


end

