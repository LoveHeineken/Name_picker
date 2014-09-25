require 'spec_helper'

describe GroupsController do

  before(:each) do
    @company = FactoryGirl.create(:company_1)
    @group = @company.groups
  end

  # viewの検証までする
  # render_views
  describe " GET :index" do
    subject { get :index, company_id: @company.id }
    it { should be_success }
  end

  describe " GET :new" do
    subject { get :new, company_id: @company.id }
    it { should be_success }
  end

  describe " POST :create" do
    context '保存に成功した場合' do
      subject { post :create, :group => {"name" => "hoge"}, :company_id => @company.id }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to change(@group, :count).by(1) }
#      it { should be_redirect }
    end

    context 'validation errorになった場合' do
      subject { post :create, :group => {"name" => ""}, :company_id => @company.id }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to_not change(@group, :count) }
      it { should render_template(:new) }
    end
  end
  describe " GET :show" do
    subject { get :show, id: 1, company_id: @company.id }
    it {

      # Post.should_receive(:find).with('1').and_return(Post.new(title: "hoge", body: "body"))
      # 以下の２行は上の行でも書ける
      obj = FactoryGirl.create(:group_1)
      obj.id = 1
      Group.should_receive(:find).with("1").and_return(obj)

      should be_success
    }
  end
end
