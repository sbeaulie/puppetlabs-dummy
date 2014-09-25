require 'spec_helper'

describe 'dummy', type: :class do
  let(:facts) { {id: 'root'} }
  it { is_expected.to contain_notify( 'Hello World' ) }
end
