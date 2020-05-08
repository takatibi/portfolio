require 'rails_helper'

describe 'Blogのテスト' do
	let(:blog) {FactoryBot.create(:blog, user: user)}
	let(:user) {FactoryBot.create(:user)}
	# FactoryBotでテストで使うテストデータを扱える。createとすることによってデータを作成できる。

	describe '一覧画面のテスト' do
		before do
			blog = FactoryBot.create(:blog, title: "title", body: 'body', user_id: user.id, category: rand(0..5), map: "map")
			# 「blog」という変数が宣言されて初めて４行目が評価されてしまう。shoe画面のリンクのみ「blog」の変数が必要の為、生成。
		end
		context '画面の表示' do
			it 'ブログの記事を見るボタンが表示される' do
				visit blogs_path
				expect(page).to have_link 'ブログの記事を見る'
			end
			it 'カテゴリーのリンクの表示' do
				visit blogs_path
				expect(page).to have_link "アジア"
			end
			it 'カテゴリーのリンクの表示' do
				visit blogs_path
				expect(page).to have_link "アフリカ"
			end
			it 'カテゴリーのリンクの表示' do
				visit blogs_path
				expect(page).to have_link "ヨーロッパ"
			end
			it 'カテゴリーのリンクの表示' do
				visit blogs_path
				expect(page).to have_link "北アメリカ"
			end
			it 'カテゴリーのリンクの表示' do
				visit blogs_path
				expect(page).to have_link "南アメリカ"
			end
			it 'カテゴリーのリンクの表示' do
				visit blogs_path
				expect(page).to have_link "オセアニア"
			end
			it 'ランキングのリンクの表示' do
				visit blogs_path
				expect(page).to have_link "いいねランキング"
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
		before { sign_in user }

		context '画面の表示' do
			it '編集ページと表示させる' do
				visit edit_blog_path(blog)
				expect(page).to have_content "編集ページ"
			end
			it 'フォームの表示' do
				visit edit_blog_path(blog)
				expect(page).to have_field "blog[title]"
			end
			it 'フォームの表示' do
				visit edit_blog_path(blog)
				expect(page).to have_field "blog[body]"
			end
			it 'フォームの表示' do
				visit edit_blog_path(blog)
				expect(page).to have_field "blog[map]"
			end
			it 'フォームの表示' do
				visit edit_blog_path(blog)
				expect(page).to have_field "blog[category]"
			end
		end
	end

	describe '投稿画面のテスト' do
		before { sign_in user }

		context '画面の表示' do

			it 'Blog投稿ページと表示させる' do
				visit new_blog_path
				expect(page).to have_content "Blog投稿ページ"
			end
			it 'フォームの表示' do
				visit edit_blog_path(blog)
				expect(page).to have_field "blog[title]"
			end
			it 'フォームの表示' do
				visit edit_blog_path(blog)
				expect(page).to have_field "blog[body]"
			end
			it 'フォームの表示' do
				visit edit_blog_path(blog)
				expect(page).to have_field "blog[map]"
			end
			it 'フォームの表示' do
				visit edit_blog_path(blog)
				expect(page).to have_field "blog[category]"
			end
		end
	end
end

















