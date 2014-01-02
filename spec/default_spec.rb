require 'spec_helper'

describe 'statsd::default' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
    runner.converge(described_recipe)
  end

  it 'should include the statsd recipe' do
    expect(chef_run).to include_recipe('statsd')
  end
end
