describe Nonprofit do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  it { should have_many :donations }
  it { should have_many :subscriptions }
  it { should have_many :transfers }

end
