
class UnbootJob < ApplicationJob

  # dynamically add job to correct queue (e.g. subnet, instance, cloud, etc.)
  queue_as do
    self.arguments.first.class.to_s.downcase
  end

  def perform(entity, opts)
    entity.unboot(opts)
  end

end
