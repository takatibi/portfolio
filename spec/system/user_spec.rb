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
	    end
	end

	describe 'edit画面のテスト' do
		context '画面の表示' do
			it 'User詳細の表示' do
				visit edit_user_path(user)
				expect(page).to have_content "User編集"
			end
		end
	end
end