# ===========================================================================
# gx-spirit-caller — PRIVATE build image for decomp.dev progress reports
# ===========================================================================
#
# WHAT THIS IS
#   A self-contained container image that bakes in the copyrighted ROM data
#   (orig/baserom_{eur,usa,jpn}.nds + the dsd `extract/` trees) plus the whole
#   offline toolchain, so that inside the container:
#
#       python3.13 tools/configure.py <ver> -w wibo --compiler /mwccarm \
#           --dsd /usr/local/bin/dsd --no-extract
#       ninja report
#
#   runs FULLY OFFLINE and produces build/<ver>/report.json for decomp.dev.
#
#   The public git repo NEVER contains the ROM. This image is PRIVATE
#   (GHCR package visibility = private). The CI workflow pulls it with the
#   repo's GITHUB_TOKEN.
#
# WHY A BAKED IMAGE
#   decomp.dev ingests a `report.json` produced by `objdiff-cli report
#   generate`. Generating it requires `dsd delink` of the original ROM's
#   modules, which requires the (copyrighted) extracted data. We cannot ship
#   that in the public repo, so we bake it into a private image instead —
#   the exact pattern zeldaret/ph and zeldaret/st use (ghcr.io/zeldaret/
#   ph-build). See docs/decomp-dev-setup.md for the owner workflow.
#
# HOW TO BUILD  (run LOCALLY, where orig/ + extract/ exist — they are
#                gitignored, so they only exist on the owner's machine):
#
#       # from the repo root (build context = repo root, NOT docker/):
#       docker build \
#         -f docker/decomp-dev-build.Dockerfile \
#         -t ghcr.io/cntrl-alt-lenny/gx-spirit-caller-build:main \
#         .
#
#   Build context MUST be the repo root so the COPY lines below can read
#   orig/ and extract/. (docker build needs network access AT BUILD TIME to
#   fetch the toolchain; the resulting image then runs offline.)
#
# STATUS: v1, UNTESTED. No docker daemon or ROM was available where this
#   file was authored. Verify `docker build` succeeds locally before
#   pushing. See docs/decomp-dev-setup.md § "Likely failure points".
# ===========================================================================

# Slim Debian base. Debian "bookworm" (12) ships in the python:3.13 images and
# has apt packages for git/ninja/binutils. We pin python:3.13 because
# tools/get_platform.py uses a `match` statement (Python 3.10+) and the project
# standard is 3.13 (Apple's system python3 is 3.9 and lacks `match`; CLAUDE.md
# "Platform notes"). The -slim variant keeps the image small; we add only what
# the build needs.
FROM python:3.13-slim-bookworm

# Non-interactive apt so the image build never blocks on a prompt.
ENV DEBIAN_FRONTEND=noninteractive

# ---------------------------------------------------------------------------
# OS packages
# ---------------------------------------------------------------------------
#   git          actions/checkout uses the container's git; also handy for
#                debugging. (GitHub's checkout action requires git >= 2.18 in
#                the container or it falls back to the REST tarball download.)
#   ninja-build  the build driver (`ninja report`).
#   ca-certificates  HTTPS trust store — needed AT BUILD TIME for the tool
#                downloads below (dsd/objdiff from github, mwccarm from
#                decomp.aetias.com). Not needed at runtime (offline).
#   xxd / binutils  small footprint utilities some build-chain python tools
#                shell out to; harmless if unused. (binutils gives `objcopy`
#                etc.; the project's own arm-none-eabi binutils are a SEPARATE
#                lane not needed for `ninja report`.)
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        git \
        ninja-build \
        ca-certificates \
        binutils \
        xxd \
 && rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------------------------
# wibo — the Win32 runner that executes mwccarm.exe / mwldarm.exe / mwasmarm.exe
# on Linux (CLAUDE.md: "Linux: wibo is auto-downloaded and runs the Win32
# compiler"). We fetch the SAME pinned version configure.py uses
# (WIBO_VERSION = 0.6.16) and put it on PATH so `configure.py ... -w wibo`
# resolves it by bare name (matching the ph/st workflow's `-w wibo`).
#
# NOTE: wibo releases are published as a bare `wibo` ELF (no archive) — see
# tools/download_tool.py wibo_url(). The image's host arch must be x86_64
# (wibo + the mwcc*.exe binaries are 32-bit Win32 PE; wibo itself is an
# x86_64 Linux ELF). GitHub's ubuntu-latest runners are x86_64, so build this
# image on an x86_64 host (or `docker build --platform linux/amd64`).
# ---------------------------------------------------------------------------
ARG WIBO_VERSION=0.6.16
ADD https://github.com/decompals/wibo/releases/download/${WIBO_VERSION}/wibo /usr/local/bin/wibo
RUN chmod +x /usr/local/bin/wibo

# ---------------------------------------------------------------------------
# Toolchain via the project's own downloader
# ---------------------------------------------------------------------------
# We copy ONLY tools/ first (not the whole repo) so this layer caches
# independently of ROM data and source churn. download_tool.py needs:
#   - requests   (pip)            -> fetches the binaries
#   - get_platform.py             -> picks the linux/x86_64 release URLs
# IMPORTANT: the host's committed ./dsd and ./objdiff-cli are macOS arm64
# Mach-O binaries (useless in this Linux x86_64 image), so we DO NOT copy them
# from the context — we re-fetch the Linux builds here.
COPY tools/ /work/tools/
WORKDIR /work

# Install the python deps download_tool.py imports (requests). pyperclip is in
# requirements.txt for the interactive clipboard helper and is irrelevant in
# CI, but installing the full file keeps us aligned with the project and is
# cheap. --no-cache-dir keeps the layer small.
RUN pip install --no-cache-dir -r tools/requirements.txt

# Fetch the exact pinned tool versions (kept in sync with configure.py:
#   DSD_VERSION=v0.11.0, OBJDIFF_VERSION=v2.7.1). download_tool.py auto-selects
# the linux/x86_64 asset via get_platform.py. We place dsd + objdiff-cli on
# PATH (/usr/local/bin). configure.py defaults dsd to ./dsd (overridden via
# `--dsd /usr/local/bin/dsd` in the workflow) and HARDCODES objdiff to
# ./objdiff-cli (no flag), so the workflow symlinks the baked objdiff-cli to
# that repo-root name after checkout. We do NOT do that symlink here because
# the repo root (GITHUB_WORKSPACE) only exists after the job checks out.
ARG DSD_VERSION=v0.11.0
ARG OBJDIFF_VERSION=v2.7.1
RUN python3.13 tools/download_tool.py dsd ${DSD_VERSION} --path /usr/local/bin/dsd \
 && chmod +x /usr/local/bin/dsd \
 && python3.13 tools/download_tool.py objdiff ${OBJDIFF_VERSION} --path /usr/local/bin/objdiff-cli \
 && chmod +x /usr/local/bin/objdiff-cli

# mwccarm bundle: download_tool.py mwccarm fetches decomp.aetias.com's
# mwccarm.zip and extracts it into --path. The `latest` bundle contains every
# SP under <root>/<series>/<sp>/ (2.0/sp1p5, 1.2/sp2p3, 1.2/sp3 + mwasmarm),
# which is exactly what configure.py's `--compiler` root expects. We extract
# to /mwccarm so the workflow can pass `--compiler /mwccarm` (matching ph/st).
RUN python3.13 tools/download_tool.py mwccarm latest --path /mwccarm \
 # Sanity-print the layout so a broken upstream zip fails the IMAGE build
 # loudly rather than silently producing a compiler-less image.
 && echo "=== /mwccarm layout ===" \
 && ls -R /mwccarm | head -50 \
 # The build invokes "/mwccarm/2.0/sp1p5/mwccarm.exe" etc. Fail now if the
 # default compiler is missing.
 && test -f "/mwccarm/2.0/sp1p5/mwccarm.exe"

# ---------------------------------------------------------------------------
# Copyrighted ROM data — the whole reason this image is PRIVATE.
# ---------------------------------------------------------------------------
# These COPY lines read from the build context (the repo root on the owner's
# machine, where orig/ and extract/ exist but are gitignored). They are baked
# into the image under /rom-data so the CI workflow can stage them into the
# checked-out repo (which has empty orig/ + extract/).
#
# WHY /rom-data and not straight into /work: the workflow does
# `actions/checkout` into its OWN workspace (GITHUB_WORKSPACE), which becomes
# the CWD — NOT /work. So we stash the data at a known absolute path and the
# workflow copies it into the checkout. (This mirrors ph baking `/extract` and
# `mv /extract/* ./extract` at job time.)
#
#   orig/   -> the three baseroms. configure.py SHA-1-verifies the one matching
#              <ver> at configure time (unless --skip-sha1). We bake all three.
#   extract/-> dsd's per-region extraction (config.yaml + files/ + module
#              dirs). Required by `dsd delink` because the workflow passes
#              --no-extract (so ninja does NOT re-run `dsd rom extract`).
#
# We strip macOS junk (.DS_Store, ._*) that the owner's Finder leaves in these
# trees — the project has tools/clean_macos_junk.py for the ROM-build path, but
# baking junk into the image is sloppy and the FAT scan in any future rom
# build would trip on it. find -delete is a no-op if there's none.
COPY orig/    /rom-data/orig/
COPY extract/ /rom-data/extract/
RUN find /rom-data -name '.DS_Store' -delete \
 && find /rom-data -name '._*'       -delete \
 && echo "=== baked ROM data ===" \
 && ls -la /rom-data/orig \
 && ls -la /rom-data/extract \
 # Fail the image build early if the baseroms or extract trees are missing,
 # rather than producing an image that can't configure.
 && test -f /rom-data/orig/baserom_eur.nds \
 && test -f /rom-data/orig/baserom_usa.nds \
 && test -f /rom-data/orig/baserom_jpn.nds \
 && test -f /rom-data/extract/eur/config.yaml \
 && test -f /rom-data/extract/usa/config.yaml \
 && test -f /rom-data/extract/jpn/config.yaml

# ---------------------------------------------------------------------------
# Convenience env. The workflow re-derives these, but documenting them here
# makes the image self-describing if someone `docker run`s it by hand.
# ---------------------------------------------------------------------------
ENV MWCCARM_ROOT=/mwccarm \
    ROM_DATA=/rom-data

# No ENTRYPOINT/CMD: GitHub Actions `container:` overrides the entrypoint and
# runs each `run:` step via the job shell. Leaving the default (python) is
# fine; the workflow drives everything explicitly.
