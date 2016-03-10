Org.delete_all
Client.delete_all
# Prosess.delete_all
# Communication.delete_all
# Stage.delete_all
# Realm.delete_all
# Praxi.delete_all
# Label.delete_all
# Event.delete_all

require 'factory_girl'

10.times do |n|
  org = FactoryGirl.create(:org)

  puts "Created org: #{org.name}"

  5.times do |m|
    client = FactoryGirl.create(:client, org: org)

    # 2.times do
    #   FactoryGirl.create(:communication, client: client, org: org)
    # end
  end
end

# 5.times do
#   FactoryGirl.create(:prosess)
#   FactoryGirl.create(:stage)
#   FactoryGirl.create(:realm)
#   FactoryGirl.create(:praxi)
#   FactoryGirl.create(:label)
#   FactoryGirl.create(:milestone)
# end
