RailsAdmin.config do |config|
  config.asset_source = :sprockets
  #ヘッダーの「Myapp Admin」を「よちよち管理画面」に翻訳する設定
  config.main_app_name = Proc.new { |controller| [I18n.t('admin.header.app_name'), ''] }

  config.authenticate_with do
    #sorceryのメソッド
    require_login
    if !current_user.admin?
      redirect_to new_admin_session_path, alert: 'Admin access only.'
    end
  end
  config.current_user_method(&:current_user)

  config.parent_controller = 'ApplicationController' #追記



  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan# コメントアウトを外した


  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

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
end
