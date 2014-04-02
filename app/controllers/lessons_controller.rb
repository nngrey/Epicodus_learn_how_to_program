class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @lesson = Lesson.new
    render('lessons/index.html.erb')
  end

  def show
    @lesson = Lesson.find_by(:number => params[:number])
    render('lessons/show.html.erb')
  end

  def create
    @lesson = Lesson.new( :number => params[:number],
                          :name => params[:name],
                          :content => params[:content])
    if @lesson.save
      redirect_to("/lessons/#{@lesson.number}")
    else
      @lessons = Lesson.all
      render('lessons/index.html.erb')
    end
  end

  def edit
    @lesson = Lesson.find_by(:number => params[:number])
    render('lessons/edit.html.erb')
  end

  def update
    @lesson = Lesson.find_by(:number => params[:number])
    if @lesson.update(:number => params[:number],
                      :name => params[:name],
                      :content => params[:content])
      redirect_to("/lessons/#{@lesson.number}")
    else
      render('lessons/edit.html.erb')
    end
  end

  def destroy
    @lesson = Lesson.find_by(:number => params[:number])
    @lesson.destroy
    redirect_to('/lessons')
  end
end
