# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-04-22. Main tip is `a94181f` after merging
PRs #91, #92, #93. Brief 010 now open, docs/state.md refresh follows.

**Baseline:** `python tools/configure.py eur`, `ninja rom`,
`ninja objdiff`, `ninja report`, and `./dsd.exe check modules -c
config/eur/arm9/config.yaml` all pass on Windows. Module check:
expected **24/27 OK** (ARM9 main / DTCM / overlay 4 still fail per
CLAUDE.md, not agent-caused).

**Progress:** `python tools/progress.py --version eur` now reports
code `3016 / 2386664` bytes (0.13%), data `0 / 4776528` bytes
(0.00%), and `145 / 258` units passing (56.20%). +24 bytes / +1
unit from PR #92's sinit outlier.

**Matched breakdown** (live from `python tools/next_targets.py
--version eur`):

| Tier | Matched | Unmatched | Total | % matched |
|------|--------:|----------:|------:|----------:|
| `trivial` | 78 | 59 | 137 | 56.9% |
| `easy` | 61 | 1062 | 1123 | 5.4% |
| `sinit` | 47 | 4 | 51 | 92.2% |
| `named` | 0 | 22 | 22 | 0.0% |
| `medium` | 0 | 6 | 6 | 0.0% |
| `hard` | 0 | 8510 | 8510 | 0.0% |

sinit is now at 47/51; brief 010 targets 3 more (both ov010 sinits +
the ov011 zeroing sinit), which would land sinit at **49/51**. Only
the ov004 outlier (in a failing module) stays deferred after that.

## Merged since last refresh

Main tip moved from `5c1cb9b` → `a94181f`.

### Decomper track

- **PR #92** — brief 009 shipped. `__sinit_ov002_022ca7e8` matched at
  100% / 24 of 24 code bytes. Required **`asm void`** — mwcc's
  RHS-first evaluation order can't be beaten in plain C when both
  sides of the assign are global addresses. Decomper tried four C
  variants (plain assign, `slot` temp, `volatile char **` temp,
  `*(unsigned int *)(...)`) plus struct access + swapped extern
  decl order — all produced the wrong literal-pool layout. Header
  comment in
  [`src/overlay002/sinit_ov002_022ca7e8.c`](../src/overlay002/sinit_ov002_022ca7e8.c)
  is a useful reference for the escape-hatch pattern.

### Cloud track

- **PR #91** — `.github/workflows/worklist-diff.yml`. Wires PR #88's
  `ci_format_worklist_diff.py` into a PR workflow: on every PR
  touching `config/**` / `src/**` / relevant tools, snapshots the
  worklist on base vs head and posts/upserts a single comment with
  matches-landed / new-candidates / tier-delta. Mirrors the existing
  analyzer.yml / match-invariants.yml upsert pattern. Path-filter
  means only src-affecting PRs get the comment; docs / brain PRs
  stay quiet.
- **PR #93** — `tools/find_callsites.py --caller-depth N` for
  multi-hop caller expansion (capped at 5 to avoid graph-wide
  explosions). Tests bumped from the previous count to 24. Useful
  when direct callers are placeholder-named and a deeper hop brings
  real-named context into view — came up naturally while scouting
  brief 010's ctor chains.

### Brain track

- Refreshed `docs/state.md` (this file) + wrote brief 010 on the
  three remaining sinit outliers. Added an *Open briefs* pointer in
  `AGENTS.md` and moved brief 009 to the closed-briefs reference.

## In flight

- **Open PRs:** zero (post this brain-PR merge).
- **`decomper`** — brief 010 open. Branch:
  `decomper/sinit-remaining-outliers`. One PR, three targets
  (`__sinit_ov010_021b89a8`, `__sinit_ov010_021b89f0`,
  `__sinit_ov011_021d3620`). See
  [`docs/briefs/010-sinit-remaining-outliers.md`](briefs/010-sinit-remaining-outliers.md)
  for the shapes + risk notes. Closes sinit to 49/51.
- **`cloud`** — no open brief. Good self-directed candidates:
  1. Follow-up patch on `tools/ci_format_worklist_diff.py`: the
     stdout path crashes on Windows cp1252 console when rendering
     emoji (📉 in the "Worklist delta" heading). The `-o file` path
     that the CI workflow uses works fine — this only affects local
     stdout usage on Windows terminals. One-line fix:
     `sys.stdout.reconfigure(encoding="utf-8")` early in `main()`.
  2. Research-only scoping for the data tier opener (still 0%
     matched). A `tools/data_worklist.py` or similar.
  3. A `permuter` integration pass — `tools/permute.py` exists but
     is minimally wired; could add a CI-runnable smoke test.
- **`brain`** — waiting for the next decomper PR. Will re-run
  analyzer + heatmap regen after brief 010 lands.

## Next-brain TODO

1. **Review brief 010 PR when it opens.** Three new `.c` files
   under `src/overlay010/` + `src/overlay011/`, three delinks-block
   appends across two overlays. Verify: `python tools/configure.py
   eur`, `ninja rom`, `ninja objdiff`, `./dsd.exe check modules`
   (still 24/27). All three target functions must hit 100% in
   `ninja report`. Summarize for cntrl_alt_lenny and offer to merge.
2. **Scope brief 011** once brief 010 lands. Natural next target:
   the **named tier** (22 candidates). Pick a single BIOS / libc
   function with a known name — `Div`, `Sqrt`, `LZ77Uncomp*` — as
   the opener, same one-function-PR cadence as brief 007.
3. **Latent bug** in `tools/ci_format_worklist_diff.py` (Windows
   stdout Unicode) — noted above. Non-blocking; the CI workflow
   uses `-o file` which sidesteps it. Fix with one line when cloud
   has idle time.
4. **Pre-existing warning** carryover: `func_ov021_021aaf58` is in
   a `complete` TU but still placeholder-named. Fix when identity
   is clear.
5. **`match-invariants` as a required check** in GitHub branch
   protection — continuing carryover. Stable across many PRs now.
6. **Data-tier opener** — 0% still. Likely brief 012+.

## New agents?

Still no. Brain + decomper + cloud is holding. Slug rename in PR #87
means any LLM session can take any slot; no new manifest changes
needed. Reopen if `libs/nitro/` / `libs/runtime/` balloons, or if
graphics/audio decomp becomes a target.
