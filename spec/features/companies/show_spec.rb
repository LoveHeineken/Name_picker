require 'spec_helper'
require 'capybara/rails'

feature 'edit company' do

  background do

    ログインしているユーザとそのグループやトピックを生成する

    @user1 = create(:user_taro, tenant_id: tenant.id, main_group_id: group.id, admin: false)
    @user2 = create(:user_taro, tenant_id: tenant.id, main_group_id: group.id, admin: true)


    @company1 = create(:company, tenant_id: tenant.id)
    @company2 = create(:company, tenant_id: tenant.id, marker_id: @marker.id, device_data_id: 2, out_marker_id: 4)
    @company = create(:company, tenant_id: tenant.id)

  end


  # 管理権限なし

  scenario 'visit evacuated_househods#show not admin' do

    page.set_rack_session(user_id: @user1.id)

    page.visit '/login'


    fill_in 'user_email', with: @user1.email

    fill_in 'user_password', with: 'yamadayamada'

    click_button 'loginbtn'


    visit "/admin/companys/#{@company1.id}"


    # 画面が表示されないこと

    expect(page.status_code).to eq(404)

  end


  # 管理権限有り

  scenario 'visit companys#show admin' do

    page.set_rack_session(user_id: @user2.id)


    page.visit '/login'

    fill_in 'user_email', with: @user2.email

    fill_in 'user_password', with: 'yamadayamada'

    click_button 'loginbtn'


    visit "/admin/companys/#{@company2.id}"


    # 画面が表示されること

    expect(page.status_code).to eq(200)

    expect(page).to have_content('避難所名')

    expect(page).to have_content('住所')

    expect(page).to have_content('電話番号')

    expect(page).to have_content('世帯主')

    expect(page).to have_content('家族')

    expect(page).to have_content('設問')

    expect(page).to have_content('転出先 避難所名')

    expect(page).to have_content('転出先 住所')

    expect(page).to have_content('転出先 電話番号')

    expect(page).to have_content('転出年月日')

    expect(page).to have_content('備考')

    click_button('更新する')


    # 一覧画面での確認

    expect(page).to have_content('転出先の情報を更新しました。')

  end


  # 管理権限有り

  scenario 'visit companys#show admin' do

    page.set_rack_session(user_id: @user2.id)


    page.visit '/login'

    fill_in 'user_email', with: @user2.email

    fill_in 'user_password', with: 'yamadayamada'

    click_button 'loginbtn'


    visit "/admin/companys/#{@company2.id}"


    select('1', from: 'company_out_marker_id')

    fill_in('company_out_zipcode', with: '111-1111')

    fill_in('company_out_city', with: '神奈川県川崎市')

    fill_in('company_out_street', with: '川崎2-11-1')

    fill_in('company_out_phone_number', with: '00-0000-0000')

    select '2014', from: 'company_out_at_1i'

    select '9', from: 'company_out_at_2i'

    select '12', from: 'company_out_at_3i'

    fill_in('company_note', with: '特に無し')

    click_button('更新する')


    # 一覧画面での確認

    expect(page).to have_content('転出先の情報を更新しました。')

  end

end
