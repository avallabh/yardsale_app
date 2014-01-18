require 'spec_helper'

describe Item do
  let(:blanks) { [nil, ''] }

  it { should have_valid(:name).when('phone') }
  it { should_not have_valid(:name).when(*blanks) }

  it { should have_valid(:description).when('Brand new iphone') }
  it { should_not have_valid(:description).when(*blanks) }

  it { should have_valid(:price).when('300000') }
  it { should_not have_valid(:price).when(*blanks) }

  # it { should have_valid(:sold).when(true) }
  # it { should_not have_valid(:sold).when(nil, '') }

  it { should have_valid(:user_id).when(1) }
  it { should_not have_valid(:user_id).when(*blanks) }

  it { should have_valid(:latitude).when(1.02) }
  it { should_not have_valid(:latitude).when(*blanks) }

  it { should have_valid(:longitude).when(2.03) }
  it { should_not have_valid(:longitude).when(*blanks) }

  it { should have_valid(:location_id).when(1) }
  it { should_not have_valid(:location_id).when(*blanks) }

end
