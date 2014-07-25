require 'spec_helper'

describe GroupsController do

    let(:company) { FactoryGirl.create(:company_1) }
    let(:group) { company.groups.new }

  # viewの検証までする
  # render_views
  describe " GET :index" do
    subject { get :index, company_id: company.id }
    it { should be_success }
  end

  describe " GET :new" do
    subject { get :new, company_id: company.id }
    it { should be_success }
  end

  describe " POST :create" do
    context '保存に成功した場合' do
      subject { post :create, company_id: company.id, group: { "name" => "foobar"}}
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to change(group, :count).by(1) }
      it { should be_redirect }
    end

    context 'validation errorになった場合' do
      subject { post :create, group: { name: "foobar"} }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to_not change(Group, :count) }
      # it { should render_template(:new) }でも可能
      it { should render_template("new") }
    end
  end

  describe " GET :show" do
    subject { get :show, company_id: company.id, id: 1 }
    it {

      # Post.should_receive(:find).with('1').and_return(Post.new(title: "hoge", body: "body"))
      # 以下の２行は上の行でも書ける
      obj = Group.new name: "foobar"
      Group.should_receive(:find).with("1").and_return(obj)

      should be_success
    }
  end
end
