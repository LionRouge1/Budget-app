require 'rails_helper'

RSpec.describe 'Transaction page test', type: :feature do
  describe 'New page' do
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

    it 'check transaction#index path' do
      visit "/categories/#{@group.id}"
      expect(current_path).to eq(category_path(@group.id))
      expect(page).to have_text('Transaction')
    end

    it "Should have transaction's names" do
      visit "/categories/#{@group.id}"
      expect(page).to have_content('Transaction 1')
      expect(page).to have_content('Transaction 2')
    end

    it "Should contain transaction's amounts" do
      visit "/categories/#{@group.id}"
      expect(page).to have_content('$5')
    end

    it "Should navigate to transaction's new page" do
      visit "/categories/#{@group.id}"
      click_link 'Add new transaction'
      expect(current_path).to eq(new_category_transaction_path(@group.id))
    end
  end
end
