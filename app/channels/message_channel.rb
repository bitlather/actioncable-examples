class MessageChannel < ApplicationCable::Channel
  def subscribed
    puts "Subcsribed to MessageChannel; streaming from #{channel_name}"
    stream_from channel_name
    MessageJob.perform_later(channel_name, controller, action, params, *identifiers.flatten)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def received
    ActionCable.server.broadcast('messages', {hello: 'world'})
  end

  def send_message(args)
  	ActionCable.server.broadcast('messages', args)
  end

  private
  def route
    params[:route]
  end

  def controller
    (route.split("#").first + "_cable").camelize
  end

  def action
    route.split("#").last
  end

  def identifiers
    connection.identifiers.collect do |key|
      [key.to_s, send(key)]
    end
  end

  def channel_name
    "messages:#{route}_#{params[:action]}"
  end
end
