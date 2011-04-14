module FeedbackHelper
  def feedback_link
    link_to('Give us Feedback','#',
            :class => 'feedback_link',
            :'action-toggle' => '.feedback')
  end

  def feedback_steward_email_in(field)
    capture_if_current_steward_is(current_steward) do
      field.hidden_field :steward_email, :value => current_steward.email
    end
  end

  def feedback_page_url_in(field)
    field.hidden_field :page_url, :value => request.fullpath
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
      out << label_tag(%%feedback[answers][q]%, question)
      out << text_area_tag(%%feedback[answers][#{question}]%, '')
    end
    out.join.html_safe
  end
  def feedback_comment_in(field)
    out = []
    out << field.label(:comment, "Comments")
    out << field.text_area(:comment, :value => '')
    out.join.html_safe
  end
  def answers_for(feedback)
    out = []
    feedback.answers.each do |q, a|
      out << render(:partial => "question_answer", :locals => {:question => q, :answer => a})
    end
    out.join.html_safe
  end
end
