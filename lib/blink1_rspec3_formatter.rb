# require "blink1_rspec_formatter/version"
require 'pp'
require 'blink1'

class Blink1Rspec3Formatter

  BLINK_TIMES = 7
  COLOR_SUCCESS = [0, 255, 35]
  COLOR_PENDING = [255, 200, 0]
  COLOR_FAIL = [255, 10, 30]

  RSpec::Core::Formatters.register self, :close, :dump_failures, :dump_pending

  def initialize(output)
    @output = output
    @status = {failure: 0, pending: 0}
  end

  def dump_failures(notification)
    unless notification.failure_notifications.empty?
      @status[:failure] = notification.failed_examples.size
    end
  end

  def dump_pending(notification)
    unless notification.pending_examples.empty?
      @status[:pending] = notification.pending_examples.size
    end
  end

  def close(notification)

    blink1 = Blink1.new
    blink1.open

    blink_color_and_count = get_color_and_blink_count
    color = blink_color_and_count[:color]
    count = blink_color_and_count[:count]

    if count > 0
      blink1.blink(color[0], color[1], color[2], count)
    end

    blink1.set_rgb(color[0], color[1], color[2])

    sleep(BLINK_TIMES)

    blink1.off
    blink1.close
  end

  private

  def get_color_and_blink_count
    if @status[:failure] > 0
      {count: @status[:failure], color: COLOR_FAIL}
    elsif @status[:pending] > 0
      {count: @status[:pending], color: COLOR_PENDING}
    else
      {count: 0, color: COLOR_SUCCESS}
    end
  end
end
