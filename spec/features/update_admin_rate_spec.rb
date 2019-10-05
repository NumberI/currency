require "rails_helper"

feature "update rate" do
  scenario "allows acess to update page" do
    visit admin_path

    expect(page).to have_content 'Значение курса'
  end

  scenario "allows to create admin rate" do
    visit admin_path
    fill_in :rate_val, with: 38
    fill_in :rate_fixed_till, with: 2.days.after

    click_button 'commit'
    
    expect(page).to have_content '38.0'
  end
end