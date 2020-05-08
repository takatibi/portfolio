require 'rails_helper'

describe 'Top画面のテスト' do
	let(:user) { FactoryBot.create(:user)}

	describe 'Top画面の表示テスト' do
		    context '画面の表示' do
		        it '文字の表示テスト' do
		        	visit root_path
		        	expect(page).to have_content "TRAVEL DIARY"
		        end
		        it '文字の表示テスト' do
		        	visit root_path
		        	expect(page).to have_content "You only live once"
		        end
			    it 'リンクの確認' do
			    	visit root_path
			    	expect(page).to have_link 'ブログ一覧'
			    end
			    it 'リンクの確認' do
			    	visit root_path
			    	expect(page).to have_link 'ログイン'
			    end
			    it 'リンクの確認' do
			    	visit root_path
			    	expect(page).to have_link '新規登録'
			    end
			end
	end
end