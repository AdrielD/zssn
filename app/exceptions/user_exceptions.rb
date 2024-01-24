module UserExceptions
  class ItemUnavailable < StandardError
    def message
      "Requested item is not present in this user's inventory"
    end
  end

  class NotEnoughItems < StandardError
    def message
      "User doesn't have enough of the requested item"
    end
  end

  class InfectedCantTrade < StandardError
    def message
      "Infected users can't trade"
    end
  end

  class InfectedCantNotify < StandardError
    def message
      "Infected users can't notify other users"
    end
  end

  class DuplicatedInfectionNotification < StandardError
    def message
      "This user's infection was already notified by this agent"
    end
  end
end
