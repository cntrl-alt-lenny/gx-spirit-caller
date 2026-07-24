# Publishing gx-spirit-caller to decomp.dev

This is a step-by-step checklist for the repo owner to get the project's
progress charts live on [decomp.dev](https://decomp.dev). It uses the
**private build-image** pattern (the same one zeldaret/ph and zeldaret/st
use): a Docker image that has the copyrighted ROM data baked in stays
**private**, the git repo stays clean (no ROMs), and CI builds the per-region
`report.json` inside that image.

You only do steps **1–4** once. Step **5** is optional.

> **Status of the shipped files:** the Dockerfile
> (`docker/decomp-dev-build.Dockerfile`) and workflow
> (`.github/workflows/decomp-report.yml`) are **v1, untested** — they were
> written without a Docker daemon or ROM available. **Build the image locally
> first (step 1) and confirm it succeeds before pushing.** The most likely
> things to need a tweak are listed at the bottom under
> [Likely failure points](#likely-failure-points).

---

## Prerequisites

- You are an **admin** of `github.com/cntrl-alt-lenny/gx-spirit-caller`.
- The repository is (or will be made) **public** — decomp.dev only lists
  public repos. The ROM never goes in the repo; only the private *image* has it.
- You have **Docker** installed on the machine that has the real
  `orig/baserom_*.nds` and `extract/` (i.e. your normal dev machine).
- You can log in to the GitHub Container Registry (GHCR) with a token that has
  the `write:packages` scope.

---

## Step 1 — Build the private image locally (and TEST it)

Run everything from the **repo root** (the build needs to read `orig/` and
`extract/`, which only exist on your machine):

```bash
cd /path/to/gx-spirit-caller

docker build \
  --platform linux/amd64 \
  -f docker/decomp-dev-build.Dockerfile \
  -t ghcr.io/cntrl-alt-lenny/gx-spirit-caller-build:main \
  .
```

- `--platform linux/amd64` matters if you're on an Apple-Silicon Mac: the
  GitHub runners are x86_64, and `wibo` + the `mwcc*.exe` compilers are 32-bit
  Win32 binaries that wibo runs as an x86_64 Linux process. Building for
  `linux/amd64` keeps the image runnable on the runner. (On an Intel Mac or a
  Linux x86_64 box you can drop the flag.)
- The build needs **internet access** (it downloads dsd, objdiff-cli, mwccarm
  and wibo). The resulting image then runs fully offline.

The Dockerfile has `test -f ...` guards, so if a ROM, an `extract/` tree, or
the compiler is missing, the build **fails loudly** with a clear message
rather than producing a broken image.

### TEST the image before pushing

Confirm a region actually configures + reports **inside** the image:

```bash
docker run --rm -t \
  ghcr.io/cntrl-alt-lenny/gx-spirit-caller-build:main \
  bash -lc '
    set -euxo pipefail
    git clone --depth 1 https://github.com/cntrl-alt-lenny/gx-spirit-caller.git /repo
    cd /repo
    mkdir -p orig extract
    cp -a /rom-data/orig/.    orig/
    cp -a /rom-data/extract/. extract/
    ln -sf /usr/local/bin/objdiff-cli ./objdiff-cli
    python3.13 tools/configure.py eur -w wibo --compiler /mwccarm --dsd /usr/local/bin/dsd --no-extract
    ninja report
    ls -la build/eur/report.json
  '
```

If that prints `build/eur/report.json` at the end, the image is good. (This
clones the public repo fresh inside the container, exactly mimicking what CI
does — so a pass here is strong evidence CI will pass.)

> If `git clone` inside the container is awkward (e.g. the repo isn't public
> yet), substitute a bind-mount of your local checkout for `/repo`:
> `docker run --rm -t -v "$PWD":/repo -w /repo ...` and skip the clone line.
> Just remember CI uses a **fresh** checkout with empty `orig/`+`extract/`,
> so don't let a bind-mounted, already-populated tree hide a staging bug.

---

## Step 2 — Push the image to GHCR (and keep it PRIVATE)

Log in to GHCR with a Personal Access Token (classic) that has
`write:packages` (and `read:packages`):

```bash
# Replace <YOUR_PAT> with a token that has write:packages.
echo <YOUR_PAT> | docker login ghcr.io -u cntrl-alt-lenny --password-stdin

docker push ghcr.io/cntrl-alt-lenny/gx-spirit-caller-build:main
```

> Create the PAT at **GitHub → Settings → Developer settings → Personal access
> tokens → Tokens (classic)**, with scopes `write:packages` + `read:packages`.

---

## Step 3 — Set the package PRIVATE + grant the repo pull access

The image contains copyrighted ROM data, so it **must not be public**.

1. Go to your GHCR package:
   `https://github.com/users/cntrl-alt-lenny/packages/container/package/gx-spirit-caller-build`
   (or **GitHub profile → Packages → `gx-spirit-caller-build`**).
2. **Package settings → Danger Zone → Change visibility → Private.**
   (A brand-new package pushed from a personal account is private by default —
   confirm it says **Private**.)
3. Still in **Package settings → Manage Actions access**:
   - Click **Add repository**, choose **`gx-spirit-caller`**, and give it
     **Read** access.
   - This is what lets the workflow's automatic `GITHUB_TOKEN` pull the private
     image. Without it, the CI job fails at the "pull image" stage with a
     `denied` / `unauthorized` error.

> The workflow already requests `packages: read`; this step is the other half
> (the package granting the repo access). Both are required.

---

## Step 4 — Merge the workflow and let it run once on `main`

The workflow file `.github/workflows/decomp-report.yml` is already in the repo
(the brain will review + merge it). Once it's on `main`:

- Every push to `main` runs it; it builds `eur`, `usa`, and `jpn` reports in
  parallel and uploads them as artifacts **`eur_report` / `usa_report` /
  `jpn_report`** (each containing that region's `report.json`).
- You can also trigger it by hand: **Actions tab → "decomp.dev report" →
  Run workflow**.

Confirm a run **on the `main` branch** finished green and produced the three
`*_report` artifacts (visible at the bottom of the run page). decomp.dev reads
the artifact from a push run on the **default branch**, so a green `main` run
must exist **before** step 5.

---

## Step 5 — Register the project on decomp.dev

1. Make sure the repo is **public** (decomp.dev only lists public repos) and
   that you're an **admin** of it.
2. Make sure a **green `main` run with the `*_report` artifacts exists**
   (step 4) — decomp.dev looks for them when you add the project.
3. Go to **<https://decomp.dev/manage/new>**, log in with GitHub, authorize
   decomp.dev to see your repos, and select **`gx-spirit-caller`**.
4. decomp.dev will pick up the three regions from the `eur_report` /
   `usa_report` / `jpn_report` artifacts and start charting progress on each
   push to `main`.

---

## (Optional) Step 6 — PR progress comments

Install the **decomp.dev GitHub App** (<https://github.com/apps/decomp-dev>)
on the repository to get automatic progress-delta comments on pull requests.
This is purely cosmetic and independent of the report pipeline above.

---

## How the pieces fit (one-paragraph mental model)

`configure.py` verifies the region's baserom SHA-1 and writes a **single-region
`build.ninja`** (so CI runs it once per region via a matrix). The report comes
from `dsd delink` (needs the extracted ROM data) → compile every `src/**` `.o`
→ `dsd objdiff` → `objdiff-cli report generate` → `build/<ver>/report.json`.
The copyrighted inputs (`orig/baserom_*.nds`, `extract/`) live only in the
**private image** under `/rom-data`; the workflow copies them into the fresh
checkout, builds the report, and uploads it. The public repo never sees a ROM.

---

## Maintaining the image over time

You need to **rebuild and re-push** the image (steps 1–2) only when one of the
baked-in things changes:

- a pinned tool version bumps in `tools/configure.py`
  (`DSD_VERSION`, `OBJDIFF_VERSION`) or `WIBO_VERSION`;
- the `extract/` trees change (a re-extract from a new dsd, new overlays);
- you move to a different mwccarm bundle.

Day-to-day source changes (`src/**`, `config/**`) need **no** image rebuild —
the workflow checks out the latest source each run and only the *ROM data +
toolchain* come from the image.

---

## Likely failure points

These are the spots most likely to need a one-line fix; the shipped files are
**v1 and untested** (no Docker/ROM was available when they were written):

1. **`python3.13` on the PATH.** The image is built `FROM python:3.13-slim`,
   so `python3.13` and `python3`/`python` all resolve to 3.13. If you change
   the base image, make sure the interpreter is ≥ 3.10 (configure.py and
   `tools/get_platform.py` use `match`; Python 3.9 will crash). The workflow
   calls `python3.13` explicitly.

2. **wibo / mwccarm fetch at image-build time.** `wibo` is pulled from a GitHub
   release and `mwccarm.zip` from `decomp.aetias.com`. If either URL is down or
   the mwccarm bundle layout changes, the image build's `test -f
   /mwccarm/2.0/sp1p5/mwccarm.exe` guard will fail. Re-run, or update the path
   in the Dockerfile to match the new bundle layout.

3. **Architecture.** wibo + the `mwcc*.exe` compilers are x86_64/Win32. Build
   the image for `linux/amd64` (step 1) so it runs on GitHub's x86_64 runners.
   An arm64 image will fail to run the compilers under wibo.

4. **The baserom SHA-1 check at configure time.** The workflow stages
   `orig/baserom_<ver>.nds` from the image so the check passes honestly. If you
   ever build an image **without** baking `orig/`, the configure step will fail
   with "baserom not found"; in that case add `--skip-sha1` to the
   `configure.py` line in the workflow (the project discourages this, so prefer
   baking the ROMs).

5. **The per-region configure model.** `configure.py` writes one
   `build.ninja` per run, so the matrix runs it once per region — correct here,
   but if you add a region, add it to the `matrix.version` list.

6. **`objdiff-cli` at the repo-root path.** `configure.py` hardcodes
   `./objdiff-cli` (there is no `--objdiff` flag), so the workflow symlinks the
   baked binary to `./objdiff-cli`. dsd is passed via `--dsd`, mwccarm via
   `--compiler`, wibo via `-w` — those don't need the symlink, only objdiff
   does. If you see "objdiff-cli: not found", that symlink step is the suspect.

7. **`ninja report` pulling in a download rule.** Because dsd/mwccarm/wibo are
   provided via flags and objdiff-cli is symlinked to the expected path, none
   of configure.py's `download_tool` ninja rules should fire (they'd need
   network the offline container doesn't have). If a build log shows a
   "Downloading ..." line followed by a network error, a tool path didn't line
   up — check the flags/symlink against the file the rule was trying to
   produce.

8. **Image pull auth in CI.** If the job fails before any build step with an
   image `denied`/`unauthorized` error, re-check step 3 (package set Private +
   repo granted Read access) and that the workflow kept `permissions:
   packages: read`.
