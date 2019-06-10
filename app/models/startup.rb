class Startup
    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find{|startup| startup.founder.name == founder_name}
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
      rounds =  FundingRound.all.select{|round| round.startup == self}
      rounds.count
    end

    def total_funds
        rounds = FundingRound.all.select{|round| round.startup == self}
        round2 = rounds.map{|round| round.amount}
        round2.inject(0, :+)
    end

    def investors
        rounds = FundingRound.all.select{|round| round.startup == self}
        rounds.map {|round| round.venture_capitalist}
        rounds.uniq
    end

end
