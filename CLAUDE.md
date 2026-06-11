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

`.github/workflows/bump.yml` runs daily and uses `dawidd6/action-homebrew-bump-formula` to detect new upstream releases and push version bumps automatically.

It requires a repo secret named `GH_PAT` — a fine-grained PAT with **Contents: Read and write** on this repo. `GITHUB_TOKEN` does not work because the action calls the `/user` API endpoint, which requires a user-level token.

## Tap structure

```
Formula/   # one .rb file per formula
```

Casks would go in `Casks/` if added in future.
