feature 'user signs in' do

  let!(:user) do
    User.create(email: 'mali@mali.com',
                password: 'imaloser',
                password_confirmation: 'imaloser')
  end

  scenario 'I can sign in with my username and password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Hello, #{user.email}"
  end


end
