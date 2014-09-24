describe Subscription do
  it { should belong_to :user }
  it { should belong_to :nonprofit }
  it { should belong_to :plan }
end
