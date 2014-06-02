class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :index

    can :manage, Flight do |flight|
      flight && flight.user == user
    end

    can :manage, Contact do |contact|
      contact && contact.user == user
    end
  end
end
