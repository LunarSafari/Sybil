module CellsHelper

  def render_prompt(prompt)
    content = prompt.to_html
    render 'cells/prompt', content: content, prompt: prompt
  end
end
