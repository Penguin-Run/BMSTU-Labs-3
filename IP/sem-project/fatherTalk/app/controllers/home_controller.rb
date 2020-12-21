class HomeController < ApplicationController
  before_action :current_user
  before_action :authenticate, only: [:add_question]

  def index
  	@questions = Question.all
  end

  # TODO: сделать валидацию текста на запретные слова
  # TODO: сделать регистрацию с указанием типа пользователя
  # TODO: добавить юнит тесты
  # TODO: добавить интернационализацию
  # TODO: сделать более православный дизайн

  def add_question
  	# если пришел запрос с самой формы
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

  def question_page
  	qid = params[:qid]
  	@question = Question.find_by(id: qid)

  	# если запрос пришел с формы добавления ответа
  	if !request.get?
  		text = params[:text].first
  		if validate_text(text)
  			answer = Answer.new
  			answer.text = text
  			answer.user_id = current_user.id
  			answer.question_id = qid
  			answer.save
  		else
  			@error_message = "Сполна опиши свою проблему и ни в коем случае не допускай сквернословия!\nСписок сквернословий: " + bad_words.join(', ')
  		end
  	end
  	
  	if (@answers = Answer.where(question_id: qid)).empty?
  		@answers = "К сожалению, на эту исповедь еще нет ответов"
  	end
  end


  def validate_text(text)
  	# TODO: сделать валидацию на наличие запретных слов в тексте !!!
  	return false if text.empty?

  	words = text.split
  	bad_wordss = bad_words()
  	words.each do |word|
  		bad_wordss.each do |bad_word|
  			return false if word == bad_word
  		end
	end
  	
  end

  def bad_words()
  	return ['бес', 'дьявол', 'Навальный']
  end


end
