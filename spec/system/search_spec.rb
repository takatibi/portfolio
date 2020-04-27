
require 'rails_helper'

describe '検索機能' do
    context '画面の表示' do
    	before { visit search_path }
        it '検索画面の表示' do
            expect(page).to have_content "検索画面"
        end
        it 'フォームが表示される' do
            expect(page).to have_field 'seach_content'
        end
    end
end