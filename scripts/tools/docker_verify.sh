echo "$light_green Docker has been installed in the following version: $reset_colour"
echo " $(docker --version)"
echo " Docker status:"
echo " $(sudo systemctl is-active docker)"
if [ "$test" != true ]; then
  echo " Would you like to run test docker container?: y/n"
  read -r decision
  if [ "$decision" = y ]; then
    echo "$(sudo docker run hello-world)"
  fi
fi
