Set of scripts and utilities to init, build, update and source O2 software.
This includes also QualityControl.

For the first time user:
- Run from the directory `./setup_new_dir.sh`
  and give the script the installation directory you want the O2 software in

- Main files:
 - `o2suite_config.sh`: Config file
 - `init.sh`: init script to run before building
 - `build.sh`: build script to build sw
 - `enter.sh`: source script to enter the O2 environment
 - `update.sh`: update script to update the local sw
- Minor files:
 - `list.sh`: listing software
 - `pipupdate.sh`: utility script to update alibuild
 - `clean.sh`: clean script
 - `check_doctor.sh`: checks the requirements for aliDorcor

