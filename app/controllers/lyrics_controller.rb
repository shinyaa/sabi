class LyricsController < ApplicationController
  #初期
  def index
    @lyrics = Lyric.all
    if params[:title].present?
    @lyrics = @lyrics.get_by_title params[:title]
    end
    @artists = Artist.all
  end
  #データの閲覧画面の表示
  def show
    @lyric = Lyric.find(params[:id])
  end
  #データの作成画面の表示
  def new
    @lyric = Lyric.new
  end
  #データの更新画面の表示
  def edit
    @lyric = Lyric.find(params[:id])
  end
  #データの作成
  def create
    @lyric = Lyric.new(lyric_params)
    
    if @lyric.save
      flash[:success] = "歌詞を登録しました"
      redirect_to @lyric
    else
      flash[:danger] = "歌詞の登録に失敗しました"
    end
  end
  #データの更新
  def update
    @lyric = Lyric.find(params[:id]) 
    @lyric.update_attributes(lyric_params) 
    redirect_to @lyric  
  end
  #データの削除
  def destroy
    @lyric = Lyric.find(params[:id])
    @lyric.destroy
    redirect_to lyrics_path
  end

  def lyric_params
    params.require(:lyric).permit(:title,:artist_id,:text,:image,:url)
  end
end
