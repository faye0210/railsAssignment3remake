module PostingPagesHelper
  def choose_new_or_edit
    if action_name == 'new'
      confirm_posting_pages_path
    elsif action_name == 'edit'
      posting_page_path
    end
  end
end
