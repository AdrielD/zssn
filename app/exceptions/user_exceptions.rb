module UserExceptions
  class ItemToInfected < StandardError
    def message
      "An infected person can't receive items"
    end
  end

  class ItemFromInfected < StandardError
    def message
      "An infected person can't give items"
    end
  end

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
end