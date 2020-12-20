class HomeController < ApplicationController
  before_action :current_user
  before_action :authenticate, only: [:add_question]

  def index
  	@questions = Question.all
  end

#TODO: проверка на аутентификацию !
  def add_question
  	# если пришел запрос с самой формы
  	console
  	if !request.get?
  		title = params[:title]
  		text = params[:text].first

  		# Добавляем вопрос в БД предварительно валидируя поля
  		if validate_text(title) && validate_text(text)
  			question = Question.new
  			p question.title = title
  			p question.text = text
  			question.user_id = @current_user.id
  			question.save
  			index()
  			render :index
  		else 
  			@error_message = "Сполна опиши проблему прежде чем покаяться!"
		end
    end
  end


  def validate_text(text)
  	!text.empty?
  end


end
