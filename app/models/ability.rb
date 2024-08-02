# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    # return unless user && user&.admin? # 管理者じゃなかったらこのメソッドを抜ける

    # can :access, :rails_admin # 管理者画面のアクセス許可
    # can :manage, :all # 管理権限許可
    #
    user ||= User.new # 未ログインユーザーの処理

    if user.admin?
      can :manage, :all # 管理者はすべての操作が可能
      can :access, :rails_admin
    else
      can :read, :all # 一般ユーザーは読み取りのみ
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
