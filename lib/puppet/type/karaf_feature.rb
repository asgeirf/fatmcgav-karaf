Puppet::Type.newtype(:karaf_feature) do
  @doc = "Manage Karaf features"
  
  ensurable
  
  newparam(:name) do
    desc "Karaf feature name"
    isnamevar
  end
  
  newparam(:version) do
    desc "Karaf feature vesion"
  end
  
  newparam(:repository) do
    desc "Karaf repository to install feature from"
  end
  
  #
  ## Common params
  #
  newparam(:host) do 
    desc "Karaf host"
  end
  
  newparam(:port) do
    desc "Karaf admin port"
    defaultto '8101'

    validate do |value|
      raise ArgumentError, "%s is not a valid port." % value unless value =~ /^\d{4,5}$/
    end

    munge do |value|
      case value
      when String
        if value =~ /^[-0-9]+$/
          value = Integer(value)
        end
      end

      return value
    end
  end
  
  newparam(:karaf_user) do
    desc "Karaf admin username"
    defaultto 'karaf'

    validate do |value|
      unless value =~ /^[\w-]+$/
         raise ArgumentError, "%s is not a valid karaf admin username." % value
      end
    end
  end
  
  newparam(:user) do
    desc "Linux user to run command as"
    defaultto 'karaf'

    validate do |value|
      unless value =~ /^[\w-]+$/
         raise ArgumentError, "%s is not a valid user name." % value
      end
    end
  end
  
end