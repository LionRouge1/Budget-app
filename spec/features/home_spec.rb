require 'rails_helper'

RSpec.describe 'Home page test for guest', type: :feature do
  describe 'index page' do
    it 'check home#index path' do
      visit '/'
      expect(current_path).to eq('/')
      expect(page).to have_text('BudgetApp')
    end

    it 'Should have Login link' do
      visit '/'
      click_link 'Log in'
      expect(current_path).to eq(new_user_session_path)
    end

    it 'Should have Sign up link' do
      visit '/'
      click_link 'Sign up'
      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
