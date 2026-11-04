# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A [Homebrew tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap) for personal formulae. Users install it with:

```
brew tap cytsai1008/tap
```

## Formula development

All formulae live in `Formula/`. Each file is a Ruby class inheriting from `Formula`.

**Audit a formula** (style + correctness checks):
```sh
brew audit --strict --new Formula/<name>.rb
```

**Install locally for testing:**
```sh
brew install --build-from-source Formula/<name>.rb
```

**Run the formula's `test do` block:**
```sh
brew test <name>
```

**Uninstall after testing:**
```sh
brew uninstall <name>
```

## Formula conventions

- `url` points to a versioned archive (tag tarball); `sha256` must match exactly.
- `version` is only needed when it can't be inferred from the URL.
- Build-only dependencies use `=> :build` (e.g. `depends_on "rust" => :build`).
- The `test do` block should invoke the binary and assert on output — keep it minimal but meaningful.
- After bumping a version, regenerate the sha256 with:
  ```sh
  curl -L <url> | shasum -a 256
  ```

## CI — auto-bump workflow

`.github/workflows/bump.yml` runs daily, uses `brew livecheck` to detect new upstream releases, updates the prebuilt archive checksums, and pushes the version bump directly to `main`.

It pushes with the built-in `github.token` (the job has `permissions: contents: write`), so no repo secret is needed.

## Tap structure

```
Formula/   # one .rb file per formula
Casks/     # one .rb file per cask (prebuilt .app downloads)
```

The bump workflow also updates `Casks/mibuds-for-mac.rb` (version + sha256 of `MiBuds.zip`).
A new cask needs its own step there; until then, bump it by hand (`curl -L <url> | shasum -a 256`)
and check it with `brew style Casks/<name>.rb`.
