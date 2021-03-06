require "rails_helper"

RSpec.describe League, { type: :model } do
  describe "populate_from_league_template" do
    let(:league_template) { LeagueTemplate.find_by!({ title: "Bad Celebrity" }) }

    it "copies all the info from the template" do
      league = League.create!({ league_template: league_template })
      league.populate_from_league_template!
      expect(league.league_point_categories.size).to eq(league_template.point_categories.size)
    end

    it "is idempotent" do
      league = League.create!({ league_template: league_template })
      league.populate_from_league_template!
      league.populate_from_league_template!
      league.populate_from_league_template!
      expect(league.league_point_categories.size).to eq(league_template.point_categories.size)
    end

    it "does not delete extra point categories" do
      league = League.create!({ league_template: league_template })
      league.league_point_categories.create!({ title: "Foobar meebar", group: "Legal", value: 20 })
      league.populate_from_league_template!

      expect(league.league_point_categories.size).to eq(league_template.point_categories.size + 1)
    end

    it "does not clobber point overrides" do
      league = League.create!({ league_template: league_template })
      league.populate_from_league_template!
      league.league_point_categories[0].update({ value: 100 })

      expect(league.league_point_categories[0].value).to eq(100)
    end
  end

  describe "populate_from_league_template" do
    let(:league_template) { LeagueTemplate.find_by!({ title: "Bad Celebrity" }) }

    it "copies all the info from the template" do
      league = League.create!({ league_template: league_template })
      league.populate_from_league_template!
      expect(league.positions.size).to eq(league_template.positions.size)
    end

    it "is idempotent" do
      league = League.create!({ league_template: league_template })
      league.populate_from_league_template!
      league.populate_from_league_template!
      league.populate_from_league_template!
      expect(league.positions.size).to eq(league_template.positions.size)
    end

    it "does not delete extra point categories" do
      league = League.create!({ league_template: league_template })
      league.positions.create!({ title: "Foobar meebar", count: 2 })
      league.populate_from_league_template!

      expect(league.positions.size).to eq(league_template.positions.size + 1)
    end

    it "does not clobber point overrides" do
      league = League.create!({ league_template: league_template })
      league.populate_from_league_template!
      league.positions[0].update({ count: 10 })

      expect(league.positions[0].count).to eq(10)
    end
  end

  describe "populate_from_league_template" do
    let(:league_template) { LeagueTemplate.find_by!({ title: "Bad Celebrity" }) }

    it "copies all the info from the template" do
      league = League.create!({ league_template: league_template })
      league.populate_from_league_template!
      league.populate_from_league_template!
      expect(league.players.size).to eq(league_template.players.size)
      expect(league.players.map(&:player_id).sort).to eq(league_template.players.map(&:id).sort)
    end

    it "is idempotent" do
      league = League.create!({ league_template: league_template })
      league.populate_from_league_template!
      league.populate_from_league_template!
      league.populate_from_league_template!
      expect(league.players.size).to eq(league_template.players.size)
    end

    it "does not delete extra point categories" do
      league = League.create!({ league_template: league_template })
      league.players.create!({ name: "Foobar meebar" })
      league.populate_from_league_template!

      expect(league.players.size).to eq(league_template.players.size + 1)
    end

    it "does not clobber point overrides" do
      league = League.create!({ league_template: league_template })
      league.populate_from_league_template!
      league.players[0].update({ name: "Foobar meebar" })

      expect(league.players[0].name).to eq("Foobar meebar")
    end
  end
end
