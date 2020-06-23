require 'rails_helper'
require 'spec_helper'
Capybara.ignore_hidden_elements = false

# rubocop:disable Metrics/BlockLength
feature 'Admin Features' do
  before(:example) do
    FactoryBot.create(:user, name: 'admin', email: 'admin@admin.com', password: '123456')
    visit '/users/sign_in'
    fill_in 'user_email', with: 'admin@admin.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'
  end

  scenario 'redirects to user page after signup' do
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Does not give error of user not existing' do
    expect(page).not_to have_content 'Invalid Email or password.'
  end

  scenario 'Can create a category' do
    visit '/categories'
    fill_in 'category_name', with: 'Test'
    fill_in 'category_priority', with: '1'
    click_on 'Create Category'
    expect(page).to have_content 'Category successfully created'
  end

  scenario 'update a category' do
    FactoryBot.create(:category)
    visit '/categories'
    first('#category_name').set('Test2')
    first('#category_priority').set('2')
    click_on 'Update Category'
    expect(page).to have_content 'Category was successfully updated'
    expect(page).to have_content 'Test2'
  end

  scenario 'delete a category' do
    visit '/categories'
    FactoryBot.create(:category)
    click_on 'Create Category'
    click_on 'Delete'
    expect(page).to have_content 'Category was successfully deleted'
    expect(page).to_not have_content '1'
  end
end
# rubocop:enable Metrics/BlockLength
