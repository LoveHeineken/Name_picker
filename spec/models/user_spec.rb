require 'spec_helper'

describe User do
  describe :name do
    context '入力値=MAXの場合、正常' do
      subject{ build(:user_1) }
      its(:valid?){ should be_truthy }
    end 

    context '入力値=MAX+1の場合、異常' do
      subject{ build(:user_1, name: 'あ' * (100 + 1)) }
      its(:valid?){ should be_falsey }
    end 

    context '入力値=nilの場合、異常' do
      subject{ build(:user_1, name: nil) }
      its(:valid?){ should be_falsey }
    end 
  end 

  describe :tel do
    context '入力値=MAXの場合、正常' do
      subject{ build(:user_1) }
      its(:valid?){ should be_truthy }
    end 

    context 'フォーマットエラー(0-0-0)の場合、異常' do
      subject{ build(:user_1, tel: '0' )}
      its(:valid?){ should be_falsey }
    end

    context 'フォーマットエラー(0-0)の場合、異常' do
      subject{ build(:user_1, tel: '0-0' )}
      its(:valid?){ should be_falsey }
    end

    context 'フォーマットエラー(0-0-0)の場合、異常' do
      subject{ build(:user_1, tel: '0-0-0' )}
      its(:valid?){ should be_falsey }
    end

    context 'フォーマットエラー(0-0-0-0)の場合、異常' do
      subject{ build(:user_1, tel: '0-0-0-0' )}
      its(:valid?){ should be_falsey }
    end

    context 'フォーマットエラー(00000-00-0000)の場合、異常' do
      subject{ build(:user_1, tel: '00000-00-0000')}
      its(:valid?){ should be_falsey }
    end

    context 'フォーマットエラー(000-00000-000)の場合、異常' do
      subject{ build(:user_1, tel: '000-00000-000')}
      its(:valid?){ should be_falsey }
    end

    context 'フォーマットエラー(0000-00-00)の場合、異常' do
      subject{ build(:user_1, tel: '0000-00-00')}
      its(:valid?){ should be_falsey }
    end

    context 'フォーマットエラー(000-00000-00000)の場合、異常' do
      subject{ build(:user_1, tel: '000-00000-00000')}
      its(:valid?){ should be_falsey }
    end

    context '入力値=nilの場合、異常' do
      subject{ build(:user_1, tel: nil) }
      its(:valid?){ should be_falsey }
    end
  end

  describe :mail do
    context 'メアドの入力値がMAXの場合、正常' do
      subject{ build(:user_1) }
      its(:valid?){ should be_truthy }
    end 

    context 'メアドの入力値がMAX+1の場合、異常' do
      subject{ build(:user_1, mail: 'あ' * (100 + 1)) }
      its(:valid?){ should be_falsey }
    end 
    
    context 'メアドが重複している場合、異常' do
      skip
    #  pending '一意かどうかをチェックするため、重複していないかどうかというspecを追加していく' do
        # let(:user){ create(:user_1)} 
        # subject{ build(:user_1, mail: user.mail) }
        # its(:valid?){ should be_falsey }
    #  end
    end

    context '入力値が13文字未満の場合、異常' do
      subject{ build(:user_1, mail: "example.com") }
      its(:valid?){ should be_falsey }
    end

    context '入力値=空文字の場合、異常' do
      subject{ build(:user_1, mail: " ") }
      its(:valid?){ should be_falsey }
    end

    context '入力値=nilの場合、異常' do
      subject{ build(:user_1, mail: nil) }
      its(:valid?){ should be_falsey }
    end

    context 'メアドのドメイン名がおかしい場合' do
      subject{ build(:user_1, mail: "@forinstance") }
      its(:valid?){ should be_truthy }
    end  

   # pending('メアドがおかしい場合を思いついたら追加していく') do
   # end  

  end
end
