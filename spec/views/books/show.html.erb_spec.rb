require 'rails_helper'

RSpec.describe 'books/show', type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
                            author_id: 2,
                            title: 'Title',
                            text: 'MyText'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
