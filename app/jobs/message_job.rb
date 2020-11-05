class MessageJob < ApplicationJob
  queue_as :default

  def perform(message_job_id, klass_name, method, params, *identifiers)
    klass_name.constantize.new(message_job_id, params, Hash[*identifiers]).send(method)
  end
end
