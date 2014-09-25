require 'spec_helper_acceptance'

describe 'dummy' do
  it 'applies cleanly' do
    apply_manifest "include dummy", :catch_failures => true
  end
end
