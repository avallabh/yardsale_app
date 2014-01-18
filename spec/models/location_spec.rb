require 'spec_helper'


describe Location do
  it { should have_valid(:city).when('Boston') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('Massachusetts') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:zip_code).when('Massachusetts') }
  it { should_not have_valid(:zip_code).when(nil, '') }

end
