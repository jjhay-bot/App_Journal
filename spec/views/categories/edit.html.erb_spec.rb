require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      category: "MyString",
      content: "MyText"
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input[name=?]", "category[category]"

      assert_select "textarea[name=?]", "category[content]"
    end
  end
end
