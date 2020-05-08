
require 'rails_helper'

describe '検索機能' do
    context '画面の表示' do
        it '検索画面の表示' do
        	visit search_path
            expect(page).to have_content "検索画面"
        end
        it 'フォームが表示される' do
        	visit search_path
            expect(page).to have_field 'seach_content'
        end
    end
end