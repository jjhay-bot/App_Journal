require 'rails_helper'

RSpec.feature "CreateTasks", type: :feature do
  # system do
  let(:category) { Category }
  before :each do
    category.create!(category:'This is the category name', content: 'This is the category content')
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
        category = Category.order(id: :desc).last
        visit "/categories/#{category.id}"
        expect(page).to have_current_path category_path(id: category.id)
        expect(page).to have_content('This is the category name')
        expect(page).to have_content('This is the category content')
      end
      scenario 'successfully creates a new task' do
        category = Category.order(id: :desc).last
        visit "/categories/#{category.id}"
        expect(page).to have_content('Tasks')
          within 'form' do
            fill_in 'name', with: 'This is the task name'
            fill_in 'description', with: 'This is the task description'
            click_on 'Create Task'
          end
      end
      scenario 'displays resulting task' do
        within 'body' do
          expect(page).to have_content('This is the task name')
          expect(page).to have_content('This is the task description')
        end
      end
      scenario 'confirms task was saved to database' do
        task = Task.order("id").last
        expect(task.name).to eq('This is the task name')
        expect(task.description).to eq('This is the task description')
      end
    end
  # end
end