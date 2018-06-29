RailsAdmin.config do |config|

  ### Popular gems integration

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Product do
    edit do
      # For RailsAdmin >= 0.5.0
      configure :description, :ck_editor
      configure :description do
        label "Mô tả cho sản phẩm"
      end
      configure :image_url do
        hide
      end
    end
  end

  config.navigation_static_links = {
    "Report" => "/chart/index", #or whatever you used to mount RailsAdmin in your routes file
    "Home" => "/",
  }
end
