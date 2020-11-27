class ApplicationController < ActionController::Base
  #basic認証用コード
  #before_action :basic_auth

  #private

  #basic認証用コード
  #def basic_auth
    #authenticate_or_request_with_http_basic do |username, password|
      #1.↓これを先にターミナルで読み込む
      #username == 'moriatsu' && password == '1111'
      #2.↓次にこれを読み込んで、環境変数を読み込む記述に変更する
      #username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  
    #end
  #end
end
