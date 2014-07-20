require 'spec_helper'

describe UsersController do
  # viewの検証までする
    render_views
  describe " GET :index" do
    subject { get :index }
    it { should be_success }
  end 

  describe " GET :new" do
    subject { get :new }
    it { should be_success }
  end 

  describe " POST :create" do
    context '保存に成功した場合' do
      subject { post :create, user: { name: "foobar", mail: "foobar1@example.com", tel: "03-1111-1111"} }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to change(User, :count).by(1) }
      it { should be_redirect }
    end 

    context 'validation errorになった場合' do
      subject { post :create, user: { name: "foobar", tel: "03-1111-1111"} }
      # 件数が増えているかどうか確認する
      it { expect{ subject }.to_not change(User, :count) }
      # it { should render_template(:new) }でも可能
      it { should render_template("new") }
    end 
  end 

  describe " GET :show" do
    subject { get :show, id: 1 } 
    it {

      # Post.should_receive(:find).with('1').and_return(Post.new(title: "hoge", body: "body"))
      # 以下の２行は上の行でも書ける
      obj = User.new name: "foobar", tel: "03-1111-1111"
      User.should_receive(:find).with("1").and_return(obj)

      should be_success
    }  
  end
end
