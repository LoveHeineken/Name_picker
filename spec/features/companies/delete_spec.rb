require 'spec_helper'
require 'capybara/rails'

feature 'delete company' do
  background do
    # ログインを実装したらここら辺もやる
    #@user1 = create(:user_taro, )
    #@user2 = create(:user_taro, )

  end


  # 管理権限なし
  scenario 'visit company#delete not admin' do
    page.set_rack_session(user_id: @user1.id)
    page.visit '/login'
    
    fill_in 'user_email', with: @user1.email
    fill_in 'user_password', with: ''
    click_button 'loginbtn'


    visit '/admin/devices'
    # 画面が表示されないこと
    expect(page.status_code).to eq(404)
  end


  # 管理権限有り（端末情報削除）
  scenario 'visit company#delete admin' do

    page.set_rack_session(user_id: @user2.id)

    page.visit '/login'


    fill_in 'user_email', with: @user2.email
    fill_in 'user_password', with: ''
    click_button 'loginbtn'


    visit '/admin/devices'
    # 画面が表示されること

    expect(page.status_code).to eq(200)
    expect(page).to have_content(@device.name)
    # 削除ボタン

    all(:link, '削除する')[0].click
    expect(page).to have_content("「#{@foo.name}」を削除しました。")
  end
end
