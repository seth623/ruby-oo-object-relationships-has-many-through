class Waiter

    @@all = []
    attr_accessor :name, :years_of_experience

    def initialize(name, years_of_experience)
        @name = name 
        @years_of_experience = years_of_experience
        @@all << self 
    end

    def best_tipper
        
        best_tipped_meal = self.meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip  
        end
        
        best_tipped_meal.customer 

    end 

    def meals 
        Meal.all.select{ |meal| meal.waiter == self }
    end 

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def self.all 
        @@all 
    end 

end