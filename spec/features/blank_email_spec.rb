feature 'Sign up' do
  scenario 'user signs up with a blank email' do
    expect{sign_up(email: '')}.not_to change(User, :count)
  end
  scenario 'user signs up with invalid email' do
    expect{sign_up(email: 'mali')}.not_to change(User, :count)
  end
end
