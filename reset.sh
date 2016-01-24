if [ $# -eq 0 ] ; then
  echo 'preparing development database'
  rake db:drop
  rake db:create
  rake db:migrate
  rake db:seed
  echo " development environment are ready $(echo $'\xF0\x9F\x8D\xBA')"
elif [ $1 == "test" ]; then
  echo 'preparing test database'
  RAILS_ENV=test rake db:drop
  RAILS_ENV=test rake db:create
  RAILS_ENV=test rake db:migrate
  echo " testing environment are ready $(echo $'\xF0\x9F\x8D\xBA')"
elif [ $1 == "all" ]; then
  echo 'preparing development and test database'
  rake db:drop; rake db:create; rake db:migrate; rake db:seed &
  RAILS_ENV=test rake db:drop; RAILS_ENV=test rake db:create; RAILS_ENV=test rake db:migrate
  wait
  echo "both development and testing environment are ready $(echo $'\xF0\x9F\x8D\xBA')"
fi
