# openbsd-webzine

Repository of the OpenBSD Webzine

# Workflow

Everything related to writing a new issue is under `issues` directory.

## New issue

- copy `_template` directory under a name like `issue-X` with `X` being the new issue number
- delete the symlink `current` and recreate it with the new issue as the target

I.e.

```
$ cd issues
$ cp -r _template issue-3
$ ln -fs issue-3 current
```

## Edit an issue

- cd into `issues/current/` and edit files as needed
- categories that are empty should be commented out using HTML comments
- when you recreate the issues with `make`, the one in development is generated in `../dev/`
- use `make test` to automatically copy the current issue to `/tmp/openbsd-webzine` directory and open it in a web browser

# Contributing

Anyone can contribute by doing the following:

- English proofreading
- translation into other languages
- content contribution

There are many ways to contribute - here is a list by order of preference (easier to handle):

1. make an account on tildegit, fork the project, create a new branch with changes, and send us Pull Requests (it's easy once you get how this work - see "Git usage" below)
2. make a local commit from a freshly updated cloned repository and use `git format-patch` to send an email to a contributor (currently _solene_) so your commit can be merged into the repository easily
3. send a simple diff to a contributor
4. open an issue
5. speak on IRC / XMPP / email

# What content?

For each issue we will try to write about these topics:

- job offers related to OpenBSD (if any)
- big changes landing in _-current_
- syspatch and digest of package updates in _-stable_
- interviews with developers or professionals using OpenBSD (if any)
- tips about shell or OpenBSD
- comments from readers
- links to OpenBSD content
- a piece of artwork
- a few interesting links to social media

## Git usage

Fork this project and clone your own fork, then add the upstream repo.

```
$ git clone git@tildegit.org:foo/openbsd-webzine.git
$ cd openbsd-webzine
$ git remote add upstream https://tildegit.org/solene/openbsd-webzine.git
```

Keep your fork sync with upstream.

```
$ git pull upstream main
```

You can now edit files.

At last, add modified files and commit:

```
$ git add issue-*/
$ git commit -m "message"
$ git push
```

You can now ask for your Pull Request to get merged.
