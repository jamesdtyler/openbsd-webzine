# openbsd-webzine

Repository of the OpenBSD Webzine

# Worflow

Everything related to writing a new issue is in `issues`.

## New issue

- Copy `_template` directory under a name like `issue-XXXX` with `XXXX` being the issue number.
- Delete the symlink `current` and make it with the new issue as a target.
- Edit the file 00_METADATA.html

## Edit an issue

- cd into `issues/current/` and edit files as you need.  Categories that are empty should be commented out using html comments.
- when you recreate the issues with `make`, the one in development is generated in `../dev/`.
