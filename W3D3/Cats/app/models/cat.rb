class Cat < ActiveRecord::Base
  def house
    House.find(self.house_id)
  end
end
