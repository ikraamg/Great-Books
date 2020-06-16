require 'rails_helper'

feature 'Book actions' do
  before(:each) do
    FactoryBot.create(:user)
    FactoryBot.create(:category)
    visit '/users/sign_in'
    fill_in 'user_email', with: 'apple@gmail.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'
    click_on 'Write a Story'
    page.check('book[category_ids][]')
    fill_in 'book[title]', with: 'New Book'
    fill_in 'book[text]', with: 'Lorem Ipsum'
    find('form input[type="file"]').set('app/assets/images/favicon.png')
    click_on 'Create Book'
  end

  scenario 'write new book' do
    expect(page).to have_content 'Lorem Ipsum'
  end

  scenario 'delete a created book' do
    click_on 'Delete'
    expect(page).not_to have_content 'Vote!'
    expect(page).not_to have_content 'Lorem Ipsum'
  end

   scenario 'edit a created book' do
    click_on 'Edit'
    expect(page).to have_content 'Editing Story'
    fill_in 'book[text]', with: 'Changed text of story'
    click_on 'Update Book'
    expect(page).to have_content 'Changed text of story'
    expect(page).to have_button 'Vote!'
    
  end

  scenario 'Vote and downvote on a post' do
    expect(page).to have_button 'Vote!'
    click_on 'Vote!'
    expect(page).to have_button 'Unvote!'
    click_on 'Unvote!'
    expect(page).to have_button 'Vote!'
  end
end
