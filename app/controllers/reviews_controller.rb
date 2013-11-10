class ReviewsController < ApplicationController
    
    before_action :signed_in_user, only: [:create, :search, :destroy]
    before_action :correct_user,   only: [:destroy, :update]
    def index
        if params[:budgetck] == nil
            params[:budget] = ''
        else
            params[:budget] = params[:budgetck].map{ |i| i.to_i }.inject{|sum, x| sum + x}
        end
        @users = User.paginate(page: params[:page])
        case params[:sort_order]
            when "Upload date (oldest first)"
            @sort_order = 'created_at ASC'
            when "Upload date (newest first)"
            @sort_order = 'created_at DESC'
            when "Rating (highest first)"
            @sort_order = 'average_rating DESC'
            when "Rating (lowest first)"
            @sort_order = 'average_rating ASC'
        end
        @reviewtest = Review.paginate(page: params[:page]).search(params[:days], params[:location_search], params[:season], params[:content]).search_budget(params[:budget]).search_timestamp(params[:timestamp])
        
        if params[:category]==nil
           @reviewcompile = @reviewtest.search_category(params[:category])
        else
            @reviewcompile = @reviewtest
            params[:category].each do |cats|
                @merger = @reviewtest.search_category(cats)
                @reviewcompile = @reviewcompile.merge(@merger)
            end
        end
        
       
        
        if @reviewcompile == []
            @reviews = 1
        else
            @reviews = @reviewcompile.all(:order => @sort_order)
            
        end
        end
    def destroy
        @review.destroy
        redirect_to current_user
    end

    def review
        @reviewpassed = Review.find_by(id: params[:id])
        @hash = Gmaps4rails.build_markers(@reviewpassed) do |user, marker|
            marker.lat user.lat
            marker.lng user.lng
        end
        impressionist(@reviewpassed)
        if signed_in? && @reviewpassed.user_id != current_user.id
        if Rating.exists?(review_id: @reviewpassed.id, user_id: @current_user.id)
        @rating = Rating.where(review_id: @reviewpassed.id, user_id: @current_user.id).first
        else
        @rating = Rating.create(review_id: @reviewpassed.id, user_id: @current_user.id, score: 0)
        end
        end
    end
    def edit
        @reviewedit = Review.find_by(id: params[:id])
    end
    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to current_user
            else
            redirect_to current_user
            end
    end
    def update
        @reviewedit = Review.find_by(id: params[:id])
        if @reviewedit.update_attributes(review_params)
            flash[:success] = "Review updated"
            redirect_to current_user
            else
            redirect_to current_user
        end
    end
    private
    def correct_user
        @review = current_user.reviews.find_by(id: params[:id])
        redirect_to current_user if @review.nil?
    end
    def review_params
        params.require(:review).permit(:content, :days, :viewcount, :city, :budget, :season, :location_search, :country, :district, :address, :location_name, :postcode, :phone_number, :lat, :lng, :summary, :image, :category => [])
    end
end