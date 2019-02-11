require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#title" do
     it "should not be valid if shorter than 5 caracters" do
       bad_event = Event.create(title: "Doe", price: "1000", description: "Grosse reception soirée: fondu, tartiflette, raclette" )
       expect(bad_event).not_to be_valid
       # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name.
       expect(bad_event.errors.include?(:title)).to eq(false)
     end
   end

   describe "#price" do
      it "should not be valid without the other attributes" do
        bad_event = Event.create(price: "10000")
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:price)).to eq(true)
      end
    end


end
