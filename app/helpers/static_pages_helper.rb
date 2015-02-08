module StaticPagesHelper

  def render_banner
    if controller_name == 'static_pages'
      render 'layouts/banner'
    else
      render 'layouts/parents/parent_banner'
    end
  end

  def render_footer
    if controller_name == 'static_pages'
      render 'layouts/footer'
    else
      render 'layouts/parents/parent_footer'
    end
  end

end
