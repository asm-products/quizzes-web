log () {
  echo -e "\n\e[35m-----> $1\n"
}

log "Updating Aptitude"
apt-get update

log "Installing python-software-properties"
apt-get install curl python-software-properties -y

log "Installing Gems"
cd /vagrant
bundle install
cd ..

log "Creating environment"
cp .env.example .env -n

log "Setting up your database"
cp config/database.yml.example config/database.yml &&
su vagrant -lc "cd /vagrant && bundle exec rake db:create"
su vagrant -lc "cd /vagrant && bundle exec rake db:migrate"
su vagrant -lc "cd /vagrant && bundle exec rake db:seed"


log "Starting the app"
su vagrant -lc "cd /vagrant && sudo foreman export upstart /etc/init \
  --app quizzes \
  --user vagrant \

if ! restart quizzes 2> /dev/null ; then
   start quizzes;
fi

cat <<EOF
-------------------------------------------------------------------------------
Quizzes

The installation was successful!
Open up http://localhost:8080 to get started.

-------------------------------------------------------------------------------
EOF