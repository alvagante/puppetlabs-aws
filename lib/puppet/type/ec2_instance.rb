Puppet::Type.newtype(:ec2_instance) do
  @doc = 'type representing an EC2 instance'

  ensurable

  newparam(:name, namevar: true) do
    desc 'the name of the instance'
    validate do |value|
      fail Puppet::Error, 'Should not contains spaces' if value =~ /\s/
      fail Puppet::Error, 'Empty values are not allowed' if value == ''
    end
  end

  newparam(:security_groups) do
    desc 'the security groups to associate the instance'
  end

  newparam(:image_id) do
    desc 'the image id to use for the instance'
    validate do |value|
      fail Puppet::Error, 'Should not contains spaces' if value =~ /\s/
      fail Puppet::Error, 'Empty values are not allowed' if value == ''
    end
  end
end