require 'rails_helper'

RSpec.feature "CreateTasks", type: :feature do
  let(:category) { Category }
  let(:task) { Task }
  before :each do
    @category = Category.create!(category:'This is the category name', content: 'This is the category content')
  end
    describe 'Creates new task' do
      scenario 'redirects to show category page' do
        visit categories_path
        expect(page).to have_current_path categories_path
        expect(page).to have_content('This is the category name')
        expect(page).to have_content('Show')
        click_link 'Show'
      end
      scenario 'displays category details' do
        visit "/categories/#{@category.id}"
        expect(page).to have_current_path category_path(@category.id)
        expect(page).to have_content('This is the category name')
        expect(page).to have_content('This is the category content')
      end
      scenario 'goes to add new task page' do
        visit "/categories/#{@category.id}"
        expect(page).to have_content('Tasks')
        click_on 'Add new task'
      end
      scenario 'successfully creates a new task and displays resulting task' do
        visit "/categories/#{@category.id}/tasks/new"
        expect(page).to have_current_path new_category_task_path(@category.id)
        within 'form' do
          fill_in 'name', with: 'This is the task name'
          fill_in 'description', with: 'This is the task description'
          click_on 'Add Task'
        end
        expect(page).to have_current_path category_path(@category.id)
        expect(page).to have_content('Tasks')
        expect(page).to have_content('This is the task name')
        expect(page).to have_content('This is the task description')
      end
    end
end