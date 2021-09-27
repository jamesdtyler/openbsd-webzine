# openbsd-webzine

Repository of the OpenBSD Webzine

# Worflow

Everything related to writing a new issue is in `issues`.

## New issue

- Copy `_template` directory under a name like `issue-X` with `X` being the new issue number.
- Delete the symlink `current` and make it with the new issue as a target.

## Edit an issue

- cd into `issues/current/` and edit files as you need.  Categories that are empty should be commented out using html comments.
- when you recreate the issues with `make`, the one in development is generated in `../dev/`.
- use `make test` to automatically copy the current issue in `~/Downloads` and open it in a web browser

# Contributing

Anyone can contribute by doing this:

- English proofreading
- Translation into other languages
- Content contribution

There are many methods for contributing, here is the list by order of preference (more easier to handle):

1. make an account on tildegit, fork the project, create a new branch with changes and send us Merge Requests (it's easy once you get how this work).
2. make a local commit from a freshly updated cloned repository and use `git format-patch` to send an email to a contributor (currently solene) so your commit can be merged into the repository easily.
3. send a simple diff to a contributor.
4. open an issue.
5. speak on IRC / XMPP / mail.

# What content?

For each issue we will try to write about these topics:

- jobs offers related to OpenBSD (if any)
- big changes landing in current
- syspatch and digest of packages updates in -stable
- developer or professionals using OpenBSD interviews (if any)
- tips about shell or OpenBSD
- comments from readers
- links to OpenBSD content
- one piece of artwork
- a few interesting links to social medias

