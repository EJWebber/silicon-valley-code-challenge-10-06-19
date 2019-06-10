class VentureCapitalist
    attr_accessor :name, :worth
    @@all = []

    def initialize(name, worth)
        @name = name
        @worth = worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select{|invester| investor.worth > 999999999}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|round| round.venture_capitalist == self}
    end
    
    def portfolio
    rounds = funding_rounds.map{|round| round.startup}
    rounds.uniq
    end

    # def biggest_investment

    # end

    def invested(thedomain)
       rounds = FundingRound.all.select{|round| round.startup.domain == thedomain}
       round2 = rounds.map {|round| round.investment}
       round2.inject(0, :+)
    end
end
