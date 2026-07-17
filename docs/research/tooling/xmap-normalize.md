[//]: # (markdownlint-disable MD013)

# xmap_normalize.py — stable layout-avalanche telemetry from `arm9.o.xMAP`

Speedup swarm finding (`docs/research/speedup-research-swarm-2026-07-03.md`,
Top-5 #4, pain 1 — layout avalanche): `ninja rom` already emits a full
CodeWarrior/mwldarm linker map at `build/<region>/arm9.o.xMAP`
(~95.7–144.7k lines per region). Committing a *normalized* form of it to
a dedicated branch on every green build (the pokeplatinum pattern) turns
"did this candidate's size change ripple anywhere, and how far" from a
manual ROM-diff derivation into a one-command `git diff`.

## What it does

`tools/xmap_normalize.py` parses `arm9.o.xMAP` and emits a small,
deterministic `segment  addr  size  name` table — one line per real
symbol or linker-script boundary, in the linker's own (stable, verified
identical across all three regions) segment order. Nothing here needs a
ROM build to test: it only reads an already-produced `.xMAP` file.

```
python tools/xmap_normalize.py build/eur/arm9.o.xMAP
python tools/xmap_normalize.py eur                          # shorthand for build/eur/arm9.o.xMAP
python tools/xmap_normalize.py eur usa jpn --outdir /tmp/xmap-snapshot
python tools/xmap_normalize.py build/eur/arm9.o.xMAP --out build/eur/arm9.xmap.norm
```

Output (excerpt):

```
# segment summary (byte totals from linker-script START/END markers)
# arm9     text=000b4320 rodata=0000f89c data=0003f0a0 bss=000a7840
# itcm     text=0000086c bss=00000000
# dtcm     data=00000600 bss=00000020
# ov000    text=00005330 rodata=00006c2c data=00010fe0 bss=00002980
...
#
# segment	addr	size	name
arm9	02000000	00000000	ARM9_TEXT_START
arm9	02000086	00000008	VBlankIntrWait
arm9	020000f2	00000004	LZ77UnCompReadByCallbackWrite16bit
...
```

The segment-summary header block means the FIRST thing a `git diff` shows
is which segment(s) changed footprint at all, before drilling into which
symbol did it.

## Why normalize — what "churn-noise" means here

The raw `.xMAP` has three parts; two are out of scope and dropped:

1. **`# Unreferenced symbols:`** — present-but-empty in some builds,
   absent entirely in others (confirmed: EUR's xMAP has the header with
   nothing under it; USA/JPN's don't have the header at all). If this
   is ever genuinely non-empty, that's itself notable — the tool
   surfaces it as a `# WARNING:` block rather than silently dropping it,
   but it carries no address/size data either way.
2. **`# Link map of Entry`** — a `found in local/global <obj>`
   dependency-inclusion trace, ~45k lines for EUR alone. This records
   *why* an object got pulled into the link, not *where* anything lives
   in memory. Irrelevant to layout telemetry; dropped entirely.
3. **The memory map** (everything from the first `# .<segment>` header
   onward) — this is what gets parsed.

Within the memory map, CodeWarrior splits one symbol's (name, size)
pair across 2-4 separate rows at the *same address*, verified against
six real xMAP files (eur/usa/jpn × two independent build worktrees):

```
02000086 00000000 .text   $t             (VBlankIntrWait.o)   size always 0 (ARM/Thumb mode marker)
02000086 00000008 .text   .text          (VBlankIntrWait.o)   <- the real SIZE lives here; "symbol" is just the section name again
02000086 00000000 .text   VBlankIntrWait (VBlankIntrWait.o)   <- the real NAME lives here; size always 0
0200008c 00000000 .text   $d             (VBlankIntrWait.o)   own address, size 0
```

A naive line-by-line diff on the raw file shows spurious churn here —
the size-bearing row's own "symbol" column (`.text`) never changes, and
the named row's own "size" column is always 0 — without ever putting
the one number that matters (this symbol's size) in one place. The
normalizer groups same-address rows and re-attaches the size to the
real name, so the ONLY things that can show up in a `git diff` on the
output are an actual address or size change on an actual named symbol.

This also transparently handles the case where dsd bundles several
small globals into one shared placeholder object (each at its own
distinct address, each already carrying its own size directly — no
special-casing needed, since grouping is by address, not by object).

**Gap-filler entries** (a group with a nonzero size but no real symbol
name — i.e. genuinely unclaimed padding) are kept, since a gap's size
*is* the avalanche signal, but relabeled to the stable placeholder
`<gap>` rather than the literal `_dsd_gap@<module>_<counter>.o` object
name — that counter is a sequential id assigned by dsd's own
bookkeeping and can shift whenever an *earlier*, unrelated gap in the
same module merges or splits, which would manufacture a diff on a
build where this specific gap's position and size never actually
changed. (No real nonzero-size gaps exist in this repo's xMAP right now
— see Validation below — so this path is exercised with a synthetic
test, not live data; it will start mattering the moment any region's
delink coverage regresses below 100%.)

**Zero-size groups** (a lone mapping-symbol marker with no size-bearing
sibling — e.g. a trailing `$d` at a segment's tail) carry no layout
information and are dropped.

## Validation (build-free — reads pre-existing `.xMAP` files only)

Tested against all 6 real xMAP files already on disk from two
independent, already-built worktrees (`../decomper/build/*/arm9.o.xMAP`,
`../scaffolder/build/*/arm9.o.xMAP`) — no ROM build was run to produce
this validation:

- **Known-value spot checks**, hand-derived from the raw file and
  confirmed against the tool's output: `VBlankIntrWait` → `02000086
  00000008` (EUR); `Mod` → `0200009e 00000006` (USA); `func_ov023_
  021b2280` → `021b2280 00000064` (EUR — cross-checked against the next
  function's start address, `021b2280 + 0x64 == 0x021b22e4`, which
  matches `func_ov023_021b22e4`'s own row exactly).
- **Determinism**: running the same input twice produces byte-identical
  output.
- **Cross-build consistency**: `decomper`'s and `scaffolder`'s
  normalized EUR/USA/JPN dumps are each byte-for-byte identical between
  the two independent worktrees (0-line diff, all three regions) — the
  real-world version of "nothing changed → nothing diffs."
- **Synthetic tests** (real data doesn't currently exercise these
  paths, since the project's delink coverage is 100%): a non-empty
  `# Unreferenced symbols:` block surfaces correctly as a `# WARNING:`;
  a true nonzero-size, no-name group correctly becomes `<gap>` with its
  size preserved; `$a`/`$t`/`$d` markers never leak into the `name`
  column.
- A first bug was caught and fixed during this validation: the initial
  version searched for the `# Unreferenced symbols:` header with an
  unbounded scan, which — on USA/JPN, where that header doesn't exist
  at all — consumed the entire file before the segment-parsing scan
  ever got a chance to run, producing empty output. Fixed by bounding
  the search to stop at the first `# Link map of` line (which always
  precedes the memory map, and — when present — always follows the
  unreferenced-symbols header too).

## Workflow it feeds (per the swarm finding, not yet wired up)

Create an orphan branch (e.g. `xmap`) in the decomper repo. After a
local `ninja rom` goes green, run this tool over all three regions'
`.xMAP` files, commit the three normalized dumps to the `xmap` branch
with the corresponding main-branch commit SHA in the message, and
**push** (append commits — never force-push; the history is the whole
point). From then on, `git diff xmap~1 xmap` on that branch shows
exactly which symbol's size changed and everything that cascaded from
it, for a park-vs-pursue call, without re-deriving it from a raw ROM
diff each time. This is a **local, post-build hook** for now (CI here
deliberately never builds the ROM); it becomes a CI step once a
private-container baserom path (`docs/research/speedup-research-swarm-
2026-07-03.md`, rank 6) lands.
