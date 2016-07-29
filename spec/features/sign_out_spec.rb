feature 'Sign out' do
  before(:each) do
    User.create(email: 'mali@mali.com',
                password: 'imaloser',
                password_confirmation: 'imaloser')
  end

  scenario 'User signs out' do
    sign_in(email: 'mali@mali.com', password: 'imaloser')
    click_button 'Sign out'
    expect(page).to have_content('Smell ya later!')
    expect(page).not_to have_content('Hello, mali@mali.com')
  end
end
