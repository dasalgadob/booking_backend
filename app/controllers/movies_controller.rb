class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  has_scope :by_date
  # GET /movies
  def index
    @movies = apply_scopes(Movie).all

    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  def count
    @count = Movie.where("start_date <= ? and end_date >= ? and movie_id = ?", :by_date, :by_date, @movie.id)
    render json: {count: @count}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit(:name, :description, :image_url, :start_date, :end_date, :by_date)
    end
end
