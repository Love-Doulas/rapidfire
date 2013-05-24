module Rapidfire
  class AnswerGroupsController < ApplicationController
    before_filter :find_question_group!

    def new
      @answer_group_builder = AnswerGroupBuilder.new(@question_group)
    end

    def create
      @answer_group_builder =
        AnswerGroupBuilder.new(@question_group, answer_group_params)

      if @answer_group_builder.save
        redirect_to question_groups_path
      else
        render :new
      end
    end

    private
    def find_question_group!
      @question_group = QuestionGroup.find(params[:question_group_id])
    end

    def answer_group_params
      params.require(:answer_group)
    end
  end
end
