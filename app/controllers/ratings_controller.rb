class RatingsController < ApplicationController
    
    def update
        @rating = Rating.find(params[:id])
        @review = @rating.review
        if @rating.update_attributes(score: params[:score])
            respond_to do |format|
                format.js
            end
        end
    end
   
end