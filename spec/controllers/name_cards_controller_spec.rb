require 'spec_helper'

describe NameCardsController do
  before(:each) do
    @company = FactoryGirl.create(:company_1)
    @group = FactoryGirl.create(:group_1)
    @group.company_id = @company.id
    @user = FactoryGirl.create(:user_1)
    @user.group_id = @group.id
    @name_card = @user.name_cards.new
  end

  # viewの検証までする
  render_views
  describe " GET :index" do
    subject { get :index ,:company_id => @company.id,:group_id => @group.id, :user_id => @user.id }
    it { should be_success }
  end

  describe " GET :new" do
    subject { get :new, :company_id => @company.id,:group_id => @group.id, :user_id => @user.id}
    it { should be_success }
  end

  describe " POST :create" do
    context '保存に成功した場合' do
      subject { post :create, :name_card => {"name" => "hoge", "adress" => "千葉県匝瑳市高253-19", "tel" => "1111-222-3333", "fax" => "1111-222-3333", "url" => "http://hogehoge.com"}, :company_id => @company.id,:group_id => @group.id, :user_id => @user.id }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to change(NameCard, :count).by(1) }
      it { should be_redirect }
    end

    context 'validation errorになった場合' do
      subject { post :create, :name_card => {"name" => "", "adress" => "", "tel" => "000-111-2222", "fax" => "2222-1113333", "url" => "http://hogehoge.com"},:company_id => @company.id,:group_id => @group.id, :user_id => @user.id}
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to_not change(NameCard, :count) }
      # it { should render_template(:new) }でも可能
      it { should render_template(:new) }
    end
  end

  describe " GET :show" do
    subject { get :show, id: 1 ,:company_id => @company.id,:group_id => @group.id, :user_id => @user.id }
    it {

      # Post.should_receive(:find).with('1').and_return(Post.new(title: "hoge", body: "body"))
      # 以下の２行は上の行でも書ける
      obj = FactoryGirl.create(:name_card_1)
      obj.id = 1
      NameCard.should_receive(:find).with("1").and_return(obj)

      should be_success
    }
  end
end
