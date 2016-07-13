module CellsHelper

  def render_question(question)
    content = question.to_html
    render 'cells/question', content: content, question: question
  end
end
