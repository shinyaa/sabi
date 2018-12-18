class ArtistsController < ApplicationController
   # 初期表示
   def index
     @artist = Artist.all
   end
   # データを閲覧する画面を表示するためのAction
   def show
     @artist = Artist.find(params[:id])
   end
   # データを作成する画面を表示するためのAction
   def new
     @artist = Artist.new
   end
   # データを更新する画面を表示するためのAction
   def edit
     @artist = Artist.find(params[:id])
   end
   # データを作成するためのAction
   def create
     @artist = Artist.new(artist_params)
     @artist.save
     redirect_to @artist
     if
      flash[:success] = "アーティストを登録しました"
     else
      flash[:danger] = "アーティストの登録に失敗しました"
     end
   end
   # データを更新するためのAction
   def update
     @artist = Artist.find(params[:id])
     @artist.update_attributes(artist_params) 
     redirect_to @artist 
   end
   # データを削除するためのAction
   def destroy
     @artist = Artist.find(params[:id]) 
     @artist.destroy 
     redirect_to artists_path
   end
   def artist_params
    params.require(:artist).permit(:name,:image)
   end
end
