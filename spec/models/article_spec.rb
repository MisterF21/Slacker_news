require 'spec_helper'

  describe Article do
    it 'can create a new article posting' do
      click_button 'New'
      visit new_article_path
      page.should have_content 'New'
    end
  end
