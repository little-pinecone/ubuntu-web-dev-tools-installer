echo "$success Docker has been installed in the following version: $reset_colour"
echo " $(docker --version)"
echo " Visit: $info https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user $reset_colour to make sure the installation was successful."
if [ "$test" != true ]; then
  echo " Would you like to run test docker container?: y/n (n)"
  read -r decision
  if [ "$decision" = y ]; then
    echo "$(docker run hello-world)"
  fi
fi
