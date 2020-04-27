
require 'rails_helper'

RSpec.describe SearchController, type: :controller do

    describe '検索機能' do
        context '画面の表示' do
            it '検索画面の表示' do
                get :search
                expect(response).to have_content "検索画面"
            end
        end


        context 'blog検索' do
            it 'blogの検索結果の表示' do
            end
        end

        context 'user検索' do
            it '1 + 1 は 2 になる' do
            end
        end
    end

end