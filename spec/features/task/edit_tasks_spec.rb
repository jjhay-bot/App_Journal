require 'rails_helper'

RSpec.describe "EditingCategoryTaks" do
  # system do
  let(:task) { Task }

  before :each do
    category = Category.create!(category:'Sample category name', content: 'Sample category content')
    category.tasks.create!(name:'Sample task', description: 'Sample task description')
  end

  it 'edits task and displays index page' do
    category_last = Category.order(id: :desc).last
    task_last = category_last.tasks.order(id: :desc).last

    visit "/categories/#{category_last.id}/tasks/#{task_last.id}/edit"

    fill_in "Name",	with: "Edited name" 
    fill_in 'Description', with: 'Edited Description'
    # fill_in "Description",	with: "Edited description" 

    click_on 'Update Task'

    expect(page).to  have_content('Edited name')
    expect(page).to  have_content('Edited Description')
    
    expect(task.last.name).to  have_content('Edited name')
    expect(task.last.description).to  have_content('Edited Description')

  end
end
