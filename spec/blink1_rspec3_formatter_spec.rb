require 'spec_helper'
require 'blink1'

describe Blink1Rspec3Formatter do

  let(:blink1_mock){double('Blink1')}

  before do
    expect_any_instance_of(Kernel).to receive(:sleep).with(Blink1Rspec3Formatter::BLINK_TIMES)
    expect(Blink1).to receive(:new).and_return(blink1_mock)
    expect(blink1_mock).to receive(:open)
    expect(blink1_mock).to receive(:off)
    expect(blink1_mock).to receive(:close)
  end

  it 'execute success spec is blink SUCCESS.' do
    expect(blink1_mock).to receive(:set_rgb).with(
                               Blink1Rspec3Formatter::COLOR_SUCCESS[0],
                               Blink1Rspec3Formatter::COLOR_SUCCESS[1],
                               Blink1Rspec3Formatter::COLOR_SUCCESS[2]
                           )

    output = 'dummy'
    formatter = Blink1Rspec3Formatter.new(output)

    dump_failures_notification = double('dump_failures_notification')
    expect(dump_failures_notification).to receive(:failure_notifications).and_return([])
    formatter.dump_failures(dump_failures_notification)

    dump_pending_notification = double('dump_pending_notification')
    expect(dump_pending_notification).to receive(:pending_examples).and_return([])
    formatter.dump_pending(dump_pending_notification)

    close_notification = double('close_notification')
    expect(formatter.close(close_notification))
  end

  it 'execute error spec is blink ERROR.' do

    expect(blink1_mock).to receive(:blink).with(
                               Blink1Rspec3Formatter::COLOR_FAIL[0],
                               Blink1Rspec3Formatter::COLOR_FAIL[1],
                               Blink1Rspec3Formatter::COLOR_FAIL[2],
                               3
                           )

    expect(blink1_mock).to receive(:set_rgb).with(
                               Blink1Rspec3Formatter::COLOR_FAIL[0],
                               Blink1Rspec3Formatter::COLOR_FAIL[1],
                               Blink1Rspec3Formatter::COLOR_FAIL[2]
                           )

    output = 'dummy'
    formatter = Blink1Rspec3Formatter.new(output)

    dump_failures_notification = double('dump_failures_notification')
    expect(dump_failures_notification).to receive(:failure_notifications).and_return([1,2,3])
    expect(dump_failures_notification).to receive(:failed_examples).and_return([1,2,3])
    formatter.dump_failures(dump_failures_notification)

    dump_pending_notification = double('dump_pending_notification')
    expect(dump_pending_notification).to receive(:pending_examples).and_return([])
    formatter.dump_pending(dump_pending_notification)

    close_notification = double('close_notification')
    expect(formatter.close(close_notification))
  end

  it 'execute pending spec is blink PENDING.' do

    expect(blink1_mock).to receive(:blink).with(
                               Blink1Rspec3Formatter::COLOR_PENDING[0],
                               Blink1Rspec3Formatter::COLOR_PENDING[1],
                               Blink1Rspec3Formatter::COLOR_PENDING[2],
                               3
                           )

    expect(blink1_mock).to receive(:set_rgb).with(
                               Blink1Rspec3Formatter::COLOR_PENDING[0],
                               Blink1Rspec3Formatter::COLOR_PENDING[1],
                               Blink1Rspec3Formatter::COLOR_PENDING[2]
                           )

    output = 'dummy'
    formatter = Blink1Rspec3Formatter.new(output)

    dump_failures_notification = double('dump_failures_notification')
    expect(dump_failures_notification).to receive(:failure_notifications).and_return([])
    formatter.dump_failures(dump_failures_notification)

    dump_pending_notification = double('dump_pending_notification')
    expect(dump_pending_notification).to receive(:pending_examples).and_return([1,2,3])
    expect(dump_pending_notification).to receive(:pending_examples).and_return([1,2,3])
    formatter.dump_pending(dump_pending_notification)

    close_notification = double('close_notification')
    expect(formatter.close(close_notification))
  end
end