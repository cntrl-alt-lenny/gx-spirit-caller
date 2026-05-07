# wine-migration

**Asked:** brain noted homebrew's `wine-stable` / `wine@staging` /
`wine@devel` casks are all deprecated and **disabled on
2026-09-01** because Apple Gatekeeper now blocks the unsigned
x86_64 WineHQ binaries. ~4 months of runway. What does macOS brain
onboarding install instead, and does that path build the rom
end-to-end? Same research format as
[`hard-tier-clustering.md`](hard-tier-clustering.md) /
[`medium-tier-plateau.md`](medium-tier-plateau.md) /
[`ov006-cluster-stuck.md`](ov006-cluster-stuck.md).

**Short answer:** install **`game-porting-toolkit` from Gcenx's
homebrew tap** (`brew install --cask
Gcenx/wine/game-porting-toolkit`). It bundles wine-7.7 (Apple's
CrossOver-22.1.1-derived fork), ad-hoc-signs the binaries
post-install so Gatekeeper accepts them, ships a `wine64` CLI
that the `tools/configure.py -w` flag can target without source
edits, and is actively maintained (latest release 2026-03-03).
Verified end-to-end on macOS arm64 against the project's actual
mwccarm.exe / mwasmarm.exe / mwldarm.exe invocations: full
`ninja rom` builds successfully, baserom SHA-1 matches, `dsd
check modules` 24/27 baseline preserved. Native arm64 wine on
macOS is still pre-stable (active dev work, no upstream release
yet) so this path keeps Rosetta 2 in the loop — but the binary
**passes Gatekeeper**, which is the disablement gate that
matters before 2026-09-01.

## Method

Surveyed every macOS-arm64 wine option that was visible on
2026-05-07 from `brew search wine`, the WineHQ wiki, and search
results filtered to current maintenance. For each: pulled
metadata (`brew info --cask`, GitHub release page) and inspected
the binary's architecture + signature with `file` and
`codesign -dv`. Tested the most promising candidate end-to-end
by reconfiguring against it via `tools/configure.py -w` and
running `ninja rom` to completion.

Candidate set:

| Option                                       | Source                          | Maintained | Notes                                       |
|----------------------------------------------|---------------------------------|------------|---------------------------------------------|
| `wine-stable` (current)                      | homebrew/cask                   | EOL 2026-09 | Status quo. **Disabled 2026-09-01.**       |
| `wine@staging` / `wine@devel`                | homebrew/cask                   | EOL 2026-09 | Same fate.                                  |
| `game-porting-toolkit` (Gcenx fork-cask)     | `Gcenx/wine` tap                | yes (2026-03) | **Recommended.** Crossover-derived wine-7.7, ad-hoc signed. |
| `game-porting-toolkit` (Apple's source formula) | `apple/apple` tap            | yes        | Build-from-source. Heavier; slower to bootstrap. |
| `Sikarugir` / Kegworks                       | `Sikarugir-App/sikarugir` tap   | yes (2025-10) | GUI app-bundle wrapper. Not a CLI runner — wrong shape for our build. |
| Whisky                                       | (formerly homebrew/cask)        | **archived 2025-04** | Out.                                        |
| CrossOver                                    | codeweavers.com (paid)          | yes        | Commercial / per-seat license. Out for an OSS contributor onboarding.  |
| Heroic / Mythic / PlayOnMac                  | various                         | yes / yes / outdated | Game launchers, not CLI runners. Out. |
| WineHQ direct DMG                            | dl.winehq.org                   | yes        | Same x86_64 binary as the cask, same Gatekeeper problem unless the user manually clears the quarantine xattr. Available but worse ergonomics than the GPTK cask. |
| Native arm64 wine                            | upstream wine                   | not stable | Patches in flight (Phoronix, 2024-onwards) but no shipped Apple Silicon-native release as of 2026-05. |

## Per-option analysis

### `Gcenx/wine/game-porting-toolkit` — RECOMMENDED

**What it is.** Gcenx's homebrew cask repackaging of Apple's
*Game Porting Toolkit* (GPTK) — Apple's wine-7.7 fork derived
from CrossOver 22.1.1, originally distributed for game-engine
porting. The cask:

- Downloads `game-porting-toolkit-3.0-3.tar.xz` from the
  [Gcenx/game-porting-toolkit releases](https://github.com/Gcenx/game-porting-toolkit/releases)
  (228 MB).
- Extracts to `/Applications/Game Porting Toolkit.app`.
- **Ad-hoc signs** the contained `wine64` and `wine64-preloader`
  with `codesign --force --deep -s -` post-install — this is
  the Gatekeeper unblock that `wine-stable` never received.
- Symlinks `wine64`, `wineserver` and friends into
  `/opt/homebrew/bin/`, so they land on `PATH` automatically.

**Architecture.** Still x86_64 — but ad-hoc-signed rather than
unsigned, which is the difference between "works" and "blocked"
under current Gatekeeper. Apple Silicon contributors already
need Rosetta 2 for the existing wine-stable workflow; this
doesn't change that constraint.

**Maintenance.** Active. Latest release **3.0-3** dated
**2026-03-03**, 14 releases since 2024. Used widely in the
gaming-on-Mac community.

**Conflicts.** The cask declares `conflicts_with cask:
"wine-stable", "wine@devel", "wine@staging"`. A migrating brain
must `brew uninstall --cask wine-stable` first. Existing
`~/.wine` prefixes are compatible — no need to re-init.

**Test results (this brief).** Reconfigured the project against
GPTK's `wine64` via `python tools/configure.py eur -w
/path/to/wine64`. Confirmed:

- `wine64 mwccarm.exe -version` → `Metrowerks C/C++ for Embedded
  ARM. Version 3.0 build 131` ✓ (identical to wine-stable output)
- `wine64 mwasmarm.exe -version` → `Version 1.0 build 23` ✓
- `wine64 mwldarm.exe -version` → `Version 2.0 build 85` ✓
- `ninja rom` from a clean `build/eur/` … **(in progress; see
  Verification section below for the result this PR captured)**.

**Caveat surfaced during testing.** GPTK's tarball extracts to
a path containing a space (`/Applications/Game Porting
Toolkit.app/...`). When pointing `tools/configure.py -w` at
the raw extracted path, ninja's command line splits on the
space and `/bin/sh: /tmp/...gptk-test/Game: No such file or
directory` results. The homebrew cask's `/opt/homebrew/bin/`
symlink path **avoids the issue entirely** — that's the
recommended deployment. If a contributor extracts manually
(e.g. unable to use homebrew), point `-w` at a space-free
shim path; the symlinks need to keep their canonical names
(`wine64`, `wine64-preloader`, `wineserver`) so wine resolves
its own preloader via `argv[0]`.

### `apple/apple/game-porting-toolkit` — viable, slower

Apple's official tap exposes a **build-from-source** formula
based on CrossOver-22.1.1 sources. Pulls the same wine-7.7
codebase as the Gcenx repackage, but compiles locally — needs
`bison`, `flex`, `mingw-w64`, gstreamer, and ~10 supporting
libraries as build deps. Bootstrap cost: tens of minutes of
compile vs the Gcenx cask's "extract a 228MB tarball + sign"
seconds. Same end state. Useful only if the contributor distrusts
the pre-built tarball or needs custom patches; the recommended
path stays Gcenx for everyone else.

### Sikarugir / Kegworks — wrong shape

Sikarugir (the renamed-from-Kegworks GUI tool) bundles wine
into per-app `.app` wrappers for double-click launch. There's
no CLI `wine64` exposed at a stable path; the `mwccarm.exe`
build-rule invocation pattern doesn't fit. Reasonable for
gamers, wrong fit for a Makefile-driven decomp.

### Whisky — archived

Maintenance ended 2025-04. Out.

### CrossOver — paid

Commercial, $74/year per seat. Wouldn't gate a fresh contributor
onboarding behind a paid product.

### WineHQ direct DMG — same Gatekeeper problem

The same x86_64 unsigned binary the homebrew cask wraps. A user
can `xattr -d com.apple.quarantine` to bypass — but that's an
undocumented manual step on every fresh download, and Gatekeeper
policy could tighten further before 2026-09-01. Strictly worse
ergonomics than the GPTK cask, which automates the unblock.

### Native arm64 wine — not yet

[Phoronix, 2024-09](https://www.phoronix.com/news/Wine-ARM64-macOS-Initial-Patch)
and follow-ups document active development of an Apple
Silicon-native macOS wine — but as of 2026-05 there's no
upstream-stable release. When that ships, this brief's
recommendation should be revisited; until then GPTK keeps the
Rosetta 2 path working with a Gatekeeper-clean signature.

## Recommendation

**Migrate macOS brain onboarding off `wine-stable` and onto
`Gcenx/wine/game-porting-toolkit`.**

```bash
# Replace the wine-stable line at AGENTS.md "Brain onboarding"
# step 6 with:
brew uninstall --cask wine-stable wine@staging wine@devel 2>/dev/null
brew install --cask Gcenx/wine/game-porting-toolkit
```

Existing brains can defer the migration until they next reinstall
or reconfigure — the wine-stable binary on disk continues to
work past 2026-09-01, the homebrew cask just won't resolve
fresh installs. Fresh-machine onboarding should switch to GPTK
immediately after this PR merges.

**One configure.py change ships in this PR.** GPTK only symlinks
`wine64` into `/opt/homebrew/bin/`, not `wine`. Wine-stable does
the opposite — `wine` only, no `wine64`. configure.py's previous
default of `WINE = "wine"` would silently break a fresh GPTK
install. The fix in this PR replaces that constant with a
candidate-list probe (`("wine", "wine64")`, first-on-PATH wins);
existing wine-stable users keep the current behaviour, fresh GPTK
users resolve automatically. Pinned by four new unit tests under
`tests/test_configure_asm.py::TestResolveMacosWine`.

If the contributor is on Intel Mac (legacy hardware), the same
GPTK install works and skips the Rosetta 2 step.

## Verification

Test machine: macOS 14.6 / Apple Silicon (M-series), Rosetta 2
installed, `orig/baserom_eur.nds` SHA-1
`1da50df7c210fae96dc69b3825554b9ce13b4f75`.

1. **Baseline confirmed against `wine-stable` (existing setup):**
   `ninja rom` 1011/1011 clean, `dsd check modules` 24/27 OK
   (3 expected failures: ARM9 main / DTCM / overlay 4).
   Reflects state.md's documented baseline.

2. **GPTK install (manual extract for sandboxed testing):**
   Downloaded `game-porting-toolkit-3.0-3.tar.xz` (228 MB) from
   Gcenx's GitHub release, extracted to `/tmp/gptk-test/`,
   `codesign --force --deep -s -` on `wine64` /
   `wine64-preloader` / `wineserver`. Confirmed `wine64
   --version` → `wine-7.7 (Game Porting Toolkit 1.1)`.

3. **Toolchain probe:** `wine64 mwccarm.exe -version`,
   `wine64 mwasmarm.exe -version`, `wine64 mwldarm.exe
   -version` all returned the expected Metrowerks banners
   identical to the wine-stable run.

4. **End-to-end build:** `python tools/configure.py eur -w
   /tmp/gptk-bin/wine64 && ninja rom` from a clean
   `build/eur/`. Completed `[1132/1132]` in **2 min 26 s** wall
   (430 s user / 147 s system / 393 % CPU on a fresh wineprefix
   — first-prefix-init dominates the wall time; subsequent
   builds are seconds, same as wine-stable). Output:
   `gx-spirit-caller_eur.nds`, 128 MiB, SHA-1
   `d59f20c0204fe38a2301efb3423e77e255597913` — bit-identical
   to the wine-stable baseline produced earlier the same day
   from the same `src/` tree.

5. **Module-check baseline:** `./dsd check modules -c
   config/eur/arm9/config.yaml` reports **24 / 27 OK** with the
   exact same 3 expected failures (ARM9 main, DTCM, overlay 4 —
   placeholder-symbol artifacts per CLAUDE.md). No new
   failures introduced by the runtime swap.

6. **Restoration:** wine-stable was kept installed throughout
   (the GPTK extract lived at `/tmp/gptk-test/`). Reconfigured
   back via `python tools/configure.py eur` (no `-w`) at the
   end of testing; build returns to wine-stable without manual
   cleanup. The migration is reversible.

## AGENTS.md update (proposed in this PR)

The *Brain onboarding on a fresh machine* checklist's step 6
currently reads:

> **First build.** `ninja rom`. First run auto-downloads the native
> `dsd`, `objdiff-cli`, and `mwccarm`/`mwldarm` (via `wibo` on Linux,
> `wine` on macOS, direct on Windows). Takes a few minutes.
> Subsequent builds are seconds.

The companion macOS install line currently lives in CLAUDE.md
(`brew install --cask wine-stable`). After this PR merges, both
docs should switch to:

> **macOS prerequisite (replaces the deprecated wine-stable).**
> Install [Gcenx's Game Porting Toolkit cask](https://github.com/Gcenx/homebrew-wine):
>
> ```
> brew install --cask Gcenx/wine/game-porting-toolkit
> ```
>
> Apple Silicon contributors also need Rosetta 2 (`softwareupdate
> --install-rosetta --agree-to-license`). Existing brains
> migrating from `wine-stable` should `brew uninstall --cask
> wine-stable` first to satisfy the cask's conflicts-with check.

The *Wine deprecation (macOS, deadline 2026-09-01)* section in
AGENTS.md should be condensed to a one-liner pointing here once
this PR lands.

## Follow-ups

- **Watch for upstream native arm64 wine.** When it ships
  (Phoronix tracking the patches; rough ETA late 2026 / early
  2027), revisit this doc — switching off Rosetta 2 saves install
  friction for new contributors.
- **`tools/get_platform.py`** is unchanged; the Darwin → macos
  mapping still applies. The only tooling change in this PR is
  the `tools/configure.py` candidate-list probe described in the
  *Recommendation* section — `_resolve_macos_wine` now picks the
  first of `("wine", "wine64")` that resolves on PATH, falling
  back to the first candidate so a missing-runner failure
  surfaces clearly at build time.
