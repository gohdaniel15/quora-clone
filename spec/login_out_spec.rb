require 'spec_helper'

describe 'Signing up' do
  before do
    ensure_on index_path
    click_on 'Sign Up'
  end

  it 'lets the user signup' do
    fill_in 'user[first_name]', with: 'Ding Dong'
    fill_in 'user[last_name]', with: 'Bell'
    fill_in 'user[email_address]', with: 'dingdong@bell.com'
    fill_in 'user[password]', with: 'pancakes'
    fill_in 'user[password_confirmation]', with: 'pancakes'

    click_on 'Sign Up!'

    expect().to have_content("Welcome")
  end
end
