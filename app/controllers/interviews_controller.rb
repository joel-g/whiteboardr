class InterviewsController < ApplicationController

def new
  @interview = Interview.new
end

def create
  
end


def show
 @interview = Interview.find(params[:id])
end


end
