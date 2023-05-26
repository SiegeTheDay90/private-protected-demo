class Person
    
    attr_reader :siblings, :name

    def initialize(name)
        @siblings = []
        @name = name
    end

    def relate(person)
        # add person to my siblings array, unless they're already there
        @siblings.push(person) unless @siblings.include?(person)

        # add myself to person's siblings array, unless I'm already there
        person.relate(self) unless person.siblings.include?(self)
    end

    def inspect
        return "#{@name}\nSiblings: #{@siblings.map(&:name)}"
    end


    def speech
        self.say("My name is #{@name}.")
        self.say("Welcome to my TED talk!")
    end

    def feed(person, food)
        puts "#{@name} is feeding #{person.name}."
        person.eat(food)
    end

    def sibling_say(person, phrase)
        person.say(phrase)
    end 
    # Private methods cannot be called on other instances; only on self
    # Private methods cannot be called outside of the class definition

    # Protected methods cannot be called outside of the class
    # Protected methods can be called on self or other instances of the class

    # Public methods can be called anywhere

    private  

    def say(phrase)
        puts "#{@name} says, \"#{phrase}\""
    end



    protected

    def eat(food)
        puts "#{@name} eats #{food}."
    end
end

