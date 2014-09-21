require 'spec_helper'


feature 'edit company' do

  background do

    # ログインしているユーザとそのグループやトピックを生成する


    @user1 = create(:user_taro, tenant_id: tenant.id, main_group_id: group.id, admin: false)
    @user2 = create(:user_taro, tenant_id: tenant.id, main_group_id: group.id, admin: true)

    @company = create(:company, tenant_id: tenant.id, marker_id: @marker.id)

    company = create(:company, tenant_id: tenant.id, marker_id: @marker.id)

  end


  # 管理権限なし

  scenario 'visit company#index not admin' do
    page.set_rack_session(user_id: @user1.id)
    page.visit '/login'


    fill_in 'user_email', with: @user1.email
    fill_in 'user_password', with: ''
    click_button 'loginbtn'

    visit "/admin/companys/"

    expect(page.status_code).to eq(404)
  end


  # 管理権限有り

  scenario 'visit company#index admin' do
    page.set_rack_session(user_id: @user2.id)

    page.visit '/login'
    fill_in 'user_email', with: @user2.email
    fill_in 'user_password', with: ''
    click_button 'loginbtn'


    visit "/admin/companys/"

    expect(page.status_code).to eq(200)

    expect(page).to have_content('避難者検索')

    expect(page).to have_content('避難者一覧')

    expect(page).to have_content('避難所')

    expect(page).to have_content('氏名')


    expect(page).to have_content(@company.last_name)

    expect(page).to have_content(@company.first_name)

    expect(page).to have_content(@company.sex)

    expect(page).to have_content(@company.marker.name)

  end


  scenario 'search company by shelter#index admin', js: true do


    page.set_rack_session(user_id: @user2.id)


    page.visit '/login'

    fill_in 'user_email', with: @user2.email

    fill_in 'user_password', with: 'yamadayamada'

    click_button 'loginbtn'


    visit "/companies/"


    expect(page.status_code).to eq(200)


    # TODO referencesメソッドを調べる

    EvacuatedHousehold.includes(:companys).where("company.last_name = @company2.last_name").references(:companys)

    select("戸山公園一帯", from: 'shelter_id')

    fill_in 'company_name', with: "ユーザ太郎"

    page.find("input[alt='検索']").click


    # TODO 名前で検索できるようにする

    expect(page).to have_content(@company.sex)

  end

end
