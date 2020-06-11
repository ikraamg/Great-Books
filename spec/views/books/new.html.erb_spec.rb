require 'rails_helper'

RSpec.describe 'books/new', type: :view do
  before(:each) do
    assign(:book, Book.new(
                    author_id: 1,
                    title: 'MyString',
                    text: 'MyText',
                    image: 'MyString'
                  ))
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', books_path, 'post' do
      assert_select 'input[name=?]', 'book[author_id]'

      assert_select 'input[name=?]', 'book[title]'

      assert_select 'textarea[name=?]', 'book[text]'

      assert_select 'input[name=?]', 'book[image]'
    end
  end
end
