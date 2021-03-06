class SignupController < ApplicationController
  def new
    if session[:signup_err].nil?
      @err_flag = nil
    else
      @err_flag = 1
      @msg = session[:signup_err]
    end
    session[:signup_err] = nil
    @user = User.new
    @region_arraty = [
            ["北海道",1],["青森県",2], ["岩手県",3], ["宮城県",4], ["秋田県",5],
            ["山形県",6], ["福島県",7], ["茨城県",8], ["栃木県",9], ["群馬県",10],
            ["埼玉県",11], ["千葉県",12], ["東京都",13], ["神奈川県",14], ["新潟県",15],
            ["富山県",16], ["石川県",17], ["福井県",18], ["山梨県",19], ["長野県",20], ["岐阜県",21],
            ["静岡県",22], ["愛知県",23], ["三重県",24], ["滋賀県",25], ["京都府",26], ["大阪府",27],
            ["兵庫県",28], ["奈良県",29], ["和歌山県",30], ["鳥取県",31], ["島根県",32], ["岡山県",33],
            ["広島県",34], ["山口県",35], ["徳島県",36], ["香川県",37], ["愛媛県",38], ["高知県",39],
            ["福岡県",40], ["佐賀県",41], ["長崎県",42], ["熊本県",43], ["大分県",44], ["宮崎県",45],
            ["鹿児島県",46], ["沖縄県",47]
                      ]
  end

  def create
   session[:signup_err] = nil
   to_cont = "signup"
   to_act = "new"
 
    params[:user].each_value do |v|
      puts v
      if v.length == 0
       session[:signup_err] = "全項目入力くしてください"
      end
    end 
   

    if params[:user][:password] == params[:user][:password_confirmation] && session[:signup_err].nil?
      @user = User.new(user_params)
      begin 
        @user.save
        to_cont = "timeline"
        to_act = "index"
        session[:user_name] = params[:user][:name]
        session[:user_id] = params[:user][:user_id]
      rescue ActiveRecord::RecordNotUnique => e
        session[:signup_err] = "※このIDはすでに使用されています※"
        to_cont = "signup"
        to_act = "new"
      end
    elsif session[:signup_err].nil?
      session[:signup_err] = "※パスワードと確認パスワードが一致しません※"
      to_cont = "signup"
      to_act = "new"
    end

    redirect_to(:controller => to_cont,:action => to_act)
  end

  private
  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation,:region,:user_id,:email)
  end
end
