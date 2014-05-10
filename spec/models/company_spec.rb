require 'spec_helper'

describe Company do
  describe :name do
    context '入力値=MAXの場合、正常' do
      subject{ build(:company_1) }
      its(:valid?){ should be_true }
    end

    context '入力値=MAX+1の場合、異常' do
      subject{ build(:company_1, name: 'あ' * (100 + 1)) }
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、異常' do
      subject{ build(:company_1, name: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :adress do
    context '入力値=MAXの場合、正常' do
      let(:company){ build(:company_1) }
      subject{ build(:company_1) }
      its(:valid?){ should be_true}
    end

    context '入力値=MAX+1の場合、異常' do
      subject{ build(:company_1, adress: 'あ' * (18 + 1)) }
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、異常' do
      subject{ build(:company_1, adress: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :tel do
    context '入力値=MAXの場合、正常' do
      subject{ build(:company_1) }
      its(:valid?){ should be_true }
    end

    context 'フォーマットエラー(0-0-0)の場合、異常' do
      subject{ build(:company_1, tel: '0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0)の場合、異常' do
      subject{ build(:company_1, tel: '0-0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0)の場合、異常' do
      subject{ build(:company_1, tel: '0-0-0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0-0)の場合、異常' do
      subject{ build(:company_1, tel: '0-0-0-0' )}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(00000-00-0000)の場合、異常' do
      subject{ build(:company_1, tel: '00000-00-0000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-000)の場合、異常' do
      subject{ build(:company_1, tel: '000-00000-000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0000-00-00)の場合、異常' do
      subject{ build(:company_1, tel: '0000-00-00')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-00000)の場合、異常' do
      subject{ build(:company_1, tel: '000-00000-00000')}
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、正常' do
      subject{ build(:company_1, tel: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :fax do
    context '入力値=MAXの場合、正常' do
      subject{ build(:company_1) }
      its(:valid?){ should be_true }
    end

    context 'フォーマットエラー(0-0-0)の場合、異常' do
      subject{ build(:company_1, fax: '0')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0)の場合、異常' do
      subject{ build(:company_1, fax: '0-0')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0)の場合、異常' do
      subject{ build(:company_1, fax: '0-0-0')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0-0-0-0)の場合、異常' do
      subject{ build(:company_1, fax: '0-0-0-0')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(00000-00-0000)の場合、異常' do
      subject{ build(:company_1, fax: '00000-00-0000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-000)の場合、異常' do
      subject{ build(:company_1, fax: '000-00000-000')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(0000-00-00)の場合、異常' do
      subject{ build(:company_1, fax: '0000-00-00')}
      its(:valid?){ should be_false }
    end

    context 'フォーマットエラー(000-00000-00000)の場合、異常' do
      subject{ build(:company_1, fax: '000-00000-00000')}
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、正常' do
      subject{ build(:company_1, fax: nil) }
      its(:valid?){ should be_false }
    end
  end

  describe :url do
    context '入力値=MAXの場合、正常' do
      subject{ build(:company_1, url: "http://8901234567890123123456.jp") }
      its(:valid?){ should be_true }
    end

    context '入力値=MAX+1の場合、異常' do
      subject{ build(:company_1, url: "http://89012345678901231234567.jp") }
      its(:valid?){ should be_false }
    end

    context '入力値=空文字の場合、正常' do
      subject{ build(:company_1, url: " ") }
      its(:valid?){ should be_false }
    end

    context '入力値=nilの場合、正常' do
      subject{ build(:company_1, url: nil) }
      its(:valid?){ should be_false }
    end
  end

end
