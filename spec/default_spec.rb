require 'spec_helper'

describe 'statsd::default' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
    runner.converge(described_recipe)
  end

  it 'should include the git recipe' do
    expect(chef_run).to include_recipe('git')
  end

  it 'should include the nodejs recipe' do
    expect(chef_run).to include_recipe('nodejs')
  end

  it 'should include the supervisor recipe' do
    expect(chef_run).to include_recipe('supervisor')
  end

  it('should create /opt/statsd directory') do
    expect(chef_run).to create_directory('/opt/statsd')
  end

  it('should create /opt/statsd/config.js') do
    expect(chef_run).to render_file('/opt/statsd/config.js')
  end
end
