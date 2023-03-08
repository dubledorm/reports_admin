# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Report
    can :read, ReportDecorator
    can :read, ReportFile
    can %i[read stop_send], ReportExecution
    can %i[read stop_send], ReportExecutionDecorator

    can :manage, Report if user.reports_admin
    can :manage, AdminUser if user.users_admin
  end
end
