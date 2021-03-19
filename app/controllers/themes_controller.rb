class ThemesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @themes = Theme.where(sql_query, query: "%#{params[:query]}%")
      @tagline = "Choisi la vidéo qui t’attire"
    else
    @themes = Theme.all
    @tagline = "découvre les dernière tendances"
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @quizzes = @theme.quizzes
  end
end
