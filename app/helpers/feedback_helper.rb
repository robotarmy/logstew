module FeedbackHelper
  def feedback_link
    link_to('Give us Feedback','#',
            :class => 'feedback_link',
            :'action-toggle' => '.feedback')
  end
  def feedback_page_url_in(field)
    field.hidden_field 'page_url', :value => request.fullpath
  end

  
  def feedback_questions_in(field)
    out = []
    #
    # I would not encourage the use of _tag 
    # but since there is not a form helper that has
    # been designed with mongoids ablitity to use
    # alternatived datatypes like array i am recording
    # the dom in a manner that accords with a determisitic
    # structure
    Feedback.questions.each_with_index do |question|
      out << label_tag(%%feedback[answer][q]%, question)
      out << text_field_tag(%%feedback[answers][#{question}]%, '')
    end
    out.join.html_safe
  end
  def feedback_comment_in(field)
    field.text_area 'comment', :value => ''
  end
end
