class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

protected

  def last_modified(*objects)
    last_modified_for_object([last_modified_objects, objects])
  end

  def last_modified_objects
    [current_user, deployment_time]
  end

  def last_modified_for_object(object)
    case object
    when Time, ActiveSupport::TimeWithZone
      object
    when ActiveRecord::Relation
      object.limit(nil).maximum(:updated_at)
    when Array
      object.map { |o| last_modified_for_object(o) }.max
    else
      if object.respond_to? :updated_at
        object.updated_at
      else
        raise "Unsupported type in last_modified_for_object: #{object.class}"
      end
    end
  end

  def deployment_time
    Time.rfc2822(ENV['DEPLOYMENT_TIME'])
  end
end
