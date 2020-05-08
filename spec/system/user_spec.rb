require 'rails_helper'

describe 'userのテスト' do
	let(:user) { FactoryBot.create(:user)}
	# FactoryBotテストで使うテストデータを扱える。createとすることによってデータを作成できる。

	before { sign_in user }

	describe 'show画面のテスト' do
	    context '画面の表示' do
	        it 'マイページの表示' do
	            visit user_path(user)
	            expect(page).to have_content "マイページ"
	        end
	        it '編集ボタンのテスト' do
	        	visit user_path(user)
	        	expect(page).to have_content "プロフィール編集"
	        end
	        it 'フォローボタンの表示' do
	        	visit user_path(user)
	        	expect(page).to have_link "フォロー数"
	        end
	        it 'フォロワー数の表示' do
	        	visit user_path(user)
	        	expect(page).to have_link "フォロワー数"
	        end
	    end
	end

	describe 'edit画面のテスト' do
		context '画面の表示' do
			it 'User詳細の表示' do
				visit edit_user_path(user)
				expect(page).to have_content "User編集"
			end
			it 'フォームの表示' do
				visit edit_user_path(user)
				expect(page).to have_field "user[name]"
			end
			it 'フォームの表示' do
				visit edit_user_path(user)
				expect(page).to have_field "user[introduction]"
			end
			it '送信ボタンの表示' do
				visit edit_user_path(user)
				expect(page).to have_button "Update"
			end
		end
	end
end