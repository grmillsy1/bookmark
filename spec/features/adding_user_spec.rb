

feature 'add user'  do
  scenario 'so a user can sign up' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Hello, a@a.com')
    expect(User.first.email).to eq('a@a.com')
  end

end
