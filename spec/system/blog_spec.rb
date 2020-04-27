require 'rails_helper'

	describe '一覧画面のテスト' do
		context '画面の表示' do
			it 'Blog一覧ページと表示させる' do
				visit blogs_path
				expect(page).to have_content "Blog一覧ページ"
			end
		end
	end

	describe '詳細画面のテスト' do
		context '画面の表示' do
			it 'Blog一覧ページと表示させる' do
				visit blog_path(blog)
				expect(page).to have_content "詳細ページ"
			end
		end
	end

	describe '編集画面のテスト' do
		context '画面の表示' do
			it '編集ページと表示させる' do
				visit edit_blog_path(blog)
				expect(page).to have_content "編集ページ"
			end
		end
	end

	describe '投稿画面のテスト' do
		context '画面の表示' do
			it 'Blog投稿ページと表示させる' do
				visit new_blog_path
				expect(page).to have_content "Blog投稿ページ"
			end
		end
	end





# describe 'Blog機能' do
# 	context 'ブログ一覧画面の確認' do
# 		it '画面の表示' do
# 			visit blogs_path
# 			expect(page).to have_content "Blog一覧ページ"
# 		end
# 	end
# 	context 'ブログ詳細画面の確認' do
# 		it '画面の表示' do
# 			visit blog_path(blog)
# 			expect(page).to have_content "詳細ページ"
# 		end
# 	end
# 	context 'ブログ編集画面の確認' do
# 		it '画面の表示' do
# 			visit edit_blog_path(blog)
# 			expect(page).to have_content "編集ページ"
# 		end
# 	end
# 	context 'ブログ投稿画面' do
# 		it '画面の表示' do
# 		 	visit new_blog_path
# 		 	expect(page).to have_content "Blog投稿ページ"
# 		end
# 	end
# end