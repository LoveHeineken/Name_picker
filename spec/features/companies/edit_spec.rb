require 'spec_helper'
require 'capybara/rails'

feature 'edit company' do

  background do

    ログインしているユーザとそのグループやトピックを生成する

    @user1 = create(:user_taro, tenant_id: tenant.id, main_group_id: group.id, admin: false)
    @user2 = create(:user_taro, tenant_id: tenant.id, main_group_id: group.id, admin: true)
    @company = create(:company, tenant_id: tenant.id, device_id: device.id, marker_id: marker.id, out_marker_id: marker.id)
    @company2 = create(:company, tenant_id: tenant.id, zipcode: "111-1111", prefecture_id: 13, city: "新宿区2", street: "西新宿８ー17ー１2", device_id: device.id, marker_id: marker.id, out_marker_id: marker.id)
    @company1 = create(:company, tenant_id: tenant.id)
    @company2 = create(:company, tenant_id: tenant.id, company_id: @company.id)
    @company3 = create(:company, tenant_id: tenant.id, company_id: @company.id)
  end

  # 管理権限なし
  scenario 'visit device#edit not admin' do
    page.set_rack_session(user_id: @user1.id)
    page.visit '/login'

    fill_in 'user_email', with: @user1.email
    fill_in 'user_password', with: 'yamadayamada'
    click_button 'loginbtn'


    visit "/admin/companys/#{@company.id}/companys/#{@company1.id}/edit"


    expect(page.status_code).to eq(404)
  end


  # 管理権限有り
  scenario 'visit company#edit admin' do
    page.set_rack_session(user_id: @user2.id)


    page.visit '/login'
    fill_in 'user_email', with: @user2.email
    fill_in 'user_password', with: 'yamadayamada'
    click_button 'loginbtn'


    visit "/admin/companys/#{@company.id}/companys/#{@company2.id}/edit"


    expect(page.status_code).to eq(200)

    expect(page).to have_content('姓')
    expect(page).to have_content('名')
    expect(page).to have_content('姓カナ')
    expect(page).to have_content('名カナ')
    expect(page).to have_content('住所')
    expect(page).to have_content('都道府県')
    expect(page).to have_content('市区町村')
    expect(page).to have_content('番地')
    expect(page).to have_content('生年月日')
    expect(page).to have_content('性別')
    expect(page).to have_content('男性')
    expect(page).to have_content('女性')
    expect(page).to have_content('無回答')
    expect(page).to have_content('電話番号')
    click_button('更新する')
    expect(page).to have_content('避難者情報を更新しました。')
  end
  scenario 'visit company#edit admin' do

    page.visit '/login'
    fill_in 'user_email', with: @user2.email
    fill_in 'user_password', with: 'yamadayamada'
    click_button 'loginbtn'
    visit "/admin/companys/#{@company2.id}/companys/#{@company3.id}/edit"
    expect(page.status_code).to eq(200)
    fill_in('company_last_name', with: 'ユーザ')
    fill_in('company_first_name', with: '太郎')
    fill_in('company_last_name_kana', with: 'ユーザ')
    fill_in('company_first_name_kana', with: 'タロウ')
    #TODO 無回答以外も選択できるようにする
    select('無回答', from: 'company_company_attributes_prefecture_id')
    fill_in('company_company_attributes_zipcode', with: '000-0000')
    fill_in('company_birthday', with: '1980-1-1')
    choose('男性')
    fill_in('company_phone_number', with: '00-0000-0000')
    click_button('更新する')
    expect(page).to have_content('避難者情報を更新しました。')
  end
end
