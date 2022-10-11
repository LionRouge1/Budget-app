require 'rails_helper'

RSpec.describe 'Category page test', type: :feature do
  describe 'index page' do
    before :each do
      @user = User.create(fullname: 'Matchoudi', email: 'matchoudi@test.com', password: '123456789')
      @group = @user.groups.create(name: 'Beef', icon: 'http//image.com/toto.png')
      @entity1 = @user.entities.create(name: 'Transaction 1', amount: 5)
      @entity2 = @user.entities.create(name: 'Transaction 2', amount: 5)
      @group_entity1 = EntitiesGroup.create(group_id: @group.id, entity_id: @entity1.id)
      @group_entity2 = EntitiesGroup.create(group_id: @group.id, entity_id: @entity2.id)

      visit new_user_session_path
      fill_in 'Email', with: 'matchoudi@test.com'
      fill_in 'Password', with: '123456789'
      click_on 'Log in'
    end

    it 'check categories#index path' do
      visit '/'
      expect(current_path).to eq('/')
      expect(page).to have_text('Categories')
      expect(page).to have_content('Beef')
    end

    it 'Should contain the sum of entities amounts' do
      visit '/'
      expect(page).to have_content('$10')
    end

    it "Should navigate to category's new page" do
      visit '/'
      click_link 'Add a new category'
      expect(current_path).to eq(new_category_path)
    end
  end
end
