class Waiter
    @@all = []

    attr_accessor :name, :years_of_experience

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience

        @@all << self   
    end

    def self.all
        @@all
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def best_tipper
        best_tip = 0
        best_tipper = nil

        Meal.all.each do |meal|
            if meal.tip > best_tip
                best_tip = meal.tip
                best_tipper = meal.customer
            end
        end
        best_tipper
    end

end