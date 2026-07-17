[//]: # (markdownlint-disable MD013 MD041)

# Brief 601 — re-land the 38 USA/JPN ships, properly gated

**Tally: 38/38 shipped (19 USA + 19 JPN), 0 culprits — the divergence was
tooling, not content.** Both regions' `ninja sha1` are green on the final
committed tree. No functions were parked or reverted.

## Recap: why these 38 were reverted

Brief 597 shipped 19 USA + 19 JPN functions gated only by 100% `objdiff-cli`
match against the delinked ground-truth `.o` — at the time, a full USA/JPN
`ninja sha1` was believed "not achievable" (USA/JPN were ~164 functions short
of completeness, so a full ROM relink would fail regardless of these 38's
correctness). The brain's adjudication of that brief caught the actual bug:
**unmatched functions never block `ninja sha1`** — dsd auto-gaps any
unclaimed range with the original region's bytes, so a region can be
wildly incomplete and still relink byte-identical everywhere it doesn't
have local claims. The "not achievable" conclusion was wrong; both regions'
own `ninja sha1` reverted-and-reran cleanly the moment it was actually
tried (see below). USA/JPN were reverted at integration pending a proper
re-land under the real gate — this brief.

## Root cause — the thumb-align-wall, not a content divergence

Unlike brief 453's precedent (a region-divergent struct-offset literal,
invisible to objdiff's reloc-tolerant comparator), **none of these 38
functions have wrong content.** All are region-invariant BIOS-SWI thunks or
small NitroSDK wrappers — the C source is byte-for-byte the same shape in
every region. The failure is a **tooling interaction bug**, already
documented as [`docs/research/thumb-align-wall.md`](thumb-align-wall.md)
(briefs 011/013/115/116) and directly relevant to the NDS secure-area family
scoped in [`docs/research/brief-600-startup-block.md`](brief-600-startup-block.md):

- mwcc-ARM always emits Thumb `.text` sections with `sh_addralign=4`.
- dsd's LCF template hardcodes `ALIGNALL(4)` for the `.arm9` segment (a
  literal in `assets/arm9.lcf.template`, not configurable).
- When a Thumb translation unit is claimed as its own `.c`-compiled unit
  starting at an address that is **2-byte-aligned but not 4-byte-aligned**,
  dsd's own post-build ROM-load verifier rejects the result:

  ```
  Error: expected 4-alignment for build info but got 2-alignment:
     0: std::backtrace::Backtrace::create
     1: ds_rom::rom::raw::build_info::BuildInfo::borrow_from_slice_mut
     2: ds_rom::rom::arm9::Arm9::with_autoloads
     3: ds_rom::rom::rom::Rom::load
     4: dsd::main
     5: std::sys::backtrace::__rust_begin_short_backtrace
     6: _main

  ninja: build stopped: subcommand failed.
  ```

  This is a **crash, not a sha1 mismatch** — the brief's protocol
  anticipated a byte-diverging ROM, not dsd's build tool refusing to
  produce one. All 6 originally-affected USA functions sit inside the NDS
  secure area (`0x02000000`-`0x02000800`), the same window brief 600
  scoped as home to the canonical 18-22 BIOS-SWI thunk family.

- The established, EUR-proven fix (already used for EUR's own non-4-aligned
  thunks, e.g. `src/main/SoftReset.s`, `src/main/Div.s`) is to ship the
  affected function as **`.s`** (raw hand-written Thumb assembly) instead
  of `.c` — one file per thunk (dsd's `delinks.txt` rejects a single TU
  claiming multiple non-contiguous `.text` ranges). `.s` files aren't
  subject to mwcc's own alignment emission, so the wall doesn't apply.

**Discriminating rule:** a Thumb function inside the secure area can ship
as `.c` only if its link-time start address is 4-byte aligned;
2-byte-aligned-only starts must ship as `.s`. This was confirmed with a
positive control (a predicted-safe function built alone: passed) and a
negative control (two predicted-unsafe functions built together: crashed
with the exact message above) before being applied as a blanket rule.

## The USA/JPN split is NOT the same set of functions

This is the finding worth generalizing most: **alignment is a property of
link position, not of the function's identity or content.** The same
thunk can be safe in one region and unsafe in another, because USA and JPN
assign different addresses to the same NitroSDK functions (different
autoload/link order upstream of these thunks). Computed directly from each
region's `symbols.txt`:

| Function | USA addr | USA mod4 | USA ships as | JPN addr | JPN mod4 | JPN ships as |
|---|---|---:|---|---|---:|---|
| `Sqrt` | `0x0200019c` | 0 | `.c` | `0x02000404` | 0 | `.c` |
| `CpuSet` | `0x02000320` | 0 | **`.c`** | `0x02000236` | 2 | **`.s`** |
| `HuffUnCompReadByCallback` | `0x020001ea` | 2 | `.s` | `0x0200071a` | 2 | `.s` |
| `LZ77UnCompReadNormalWrite8bit` | `0x020002d2` | 2 | `.s` | `0x0200007e` | 2 | `.s` |
| `WaitByLoop` | `0x02000442` | 2 | `.s` | `0x02000162` | 2 | `.s` |
| `CpuFastSet` | `0x0200057e` | 2 | **`.s`** | `0x02000538` | 0 | **`.c`** |
| `IntrWait` | `0x02000662` | 2 | **`.s`** | `0x020002b0` | 0 | **`.c`** |
| `Halt` | `0x0200078a` | 2 | `.s` | `0x02000786` | 2 | `.s` |
| `AutoloadCallback` (ARM) | `0x02000a74` | 0 | `.c` | `0x02000a74` | 0 | `.c` |
| `main` (ARM) | `0x02000c34` | 0 | `.c` | `0x02000c34` | 0 | `.c` |
| `GetSystemWork` (ARM) | `0x02018af4` | 0 | `.c` | `0x02018af4` | 0 | `.c` |
| `OSi_IrqHandlerTimer0..3`, `OSi_IrqHandlerDma0..3` (ARM, 8) | `0x0209036c`-`0x020903ec` | 0 | `.c` | same | 0 | `.c` |

Bold rows are the three functions that **flip** between regions: `CpuSet`
is safe in USA but needs `.s` in JPN; `CpuFastSet` and `IntrWait` need `.s`
in USA but are safe in JPN. USA ships 13 as `.c` / 6 as `.s`; JPN ships 14
as `.c` / 5 as `.s` — different counts, not just different addresses. The
9 ARM-mode functions (`AutoloadCallback`, `main`, `GetSystemWork`, the 8
`OSi_Irq*` handlers) are all 4-aligned in both regions and never at risk —
the wall is Thumb-specific (ARM instructions are inherently 4-byte
aligned, so ARM `.text` claims can't produce a 2-aligned start).

Because the split had to be independently re-derived, JPN was **not**
built by copying USA's `.c`/`.s` assignment. The full per-function
alignment table above was computed from `config/jpn/arm9/symbols.txt`
before any JPN delinks.txt edit, batched accordingly (14 predicted-safe
together, 5 predicted-unsafe together), and both batches passed their real
`ninja sha1` on the **first attempt** — no bisection needed for JPN, unlike
USA where the wall was discovered the hard way (see below).

## USA discovery process (how the wall was found)

USA had no prior art to work from — brief 597 didn't hit this, because
EUR's own copies of these same thunks all happen to land 4-aligned (EUR's
link order differs from both USA and JPN). The first USA batch (all 19
functions flipped in one shot, following the brief's literal "batches of
~5" would have masked which functions were responsible) instead started
conservative and hit the crash above on an early batch. Diagnosis:

1. Recognized the failure mode was a crash inside `dsd rom build`'s
   load-back verifier, not a `ninja sha1` byte-mismatch — ruled out a
   content/relocation problem immediately (a wrong byte doesn't crash the
   loader, it just diffs).
2. Bisected by halves per protocol: 5 files -> 2 -> 1, isolating candidate
   culprits.
3. Computed address-mod-4 for all 19 USA targets, noticed the crash
   correlated exactly with 2-aligned-only starts.
4. Confirmed with a positive control (a predicted-safe function alone:
   passed) and a negative control (two predicted-unsafe functions
   together: crashed with the identical error).
5. Found the exact documented precedent
   ([`thumb-align-wall.md`](thumb-align-wall.md)) and independently
   re-confirmed it by scanning EUR's own delinks.txt for the same
   `.c`-vs-`.s` alignment pattern among its already-shipped thunks.
6. Applied the fix (re-route the 6 affected functions to `.s`, matching
   EUR's own `SoftReset.s`/`Div.s` convention exactly) — USA went green.

## Ledger

### USA (19/19, 4 commits)

| Commit | Functions | Result |
|---|---|---|
| `ed044177` | `Sqrt` (`.c`) | sha1 OK |
| `3358644b` | `CpuSet` (`.c`) | sha1 OK |
| `e0fadb0d` | `AutoloadCallback`, `main`, `GetSystemWork`, `OSi_IrqHandlerTimer0..3`, `OSi_IrqHandlerDma0..3` (11, all `.c`) | sha1 OK |
| `06247106` | `HuffUnCompReadByCallback`, `LZ77UnCompReadNormalWrite8bit`, `WaitByLoop`, `CpuFastSet`, `IntrWait`, `Halt` (6, re-routed `.c`->`.s` after the crash above) | sha1 OK |

13 as `.c`, 6 as `.s`. 0 culprits — every function shipped once routed
correctly; nothing was dropped or parked.

### JPN (19/19, 2 commits)

| Commit | Functions | Result |
|---|---|---|
| `8857664b`\* | `Sqrt`, `CpuFastSet`, `IntrWait`, `AutoloadCallback`, `main`, `GetSystemWork`, `OSi_IrqHandlerTimer0..3`, `OSi_IrqHandlerDma0..3` (14, all `.c`) | sha1 OK |
| `5deb2a0a` | `CpuSet`, `HuffUnCompReadByCallback`, `LZ77UnCompReadNormalWrite8bit`, `WaitByLoop`, `Halt` (5, all `.s`) | sha1 OK |

14 as `.c`, 5 as `.s`. 0 culprits, 0 bisection needed — both batches
predicted correctly from the alignment table and passed first try.

\* `8857664b`'s message says "cleanup — remove stale usa .c files" (see
Notes below); it also carries the JPN 14-function batch's delinks.txt
change, which was gate-tested as this exact content before committing.
The commit message doesn't reflect that second payload — noted here so
the ledger is accurate even though the git history isn't perfectly
labeled.

## Notes on commit hygiene (self-flagged, not corrected)

Two minor imprecisions in this brief's git history, neither affecting
correctness (every ship was gate-tested exactly as committed):

1. `ed044177` (the first USA batch, "Sqrt") swept in all 38 original
   `src/usa/main/*.c` + `src/jpn/main/*.c` files as inert additions —
   they were already staged from the brief's initial
   `git checkout origin/claude/small-tier-sweep-597 -- src/usa/main
   src/jpn/main` retrieval step. Harmless: unclaimed-by-delinks.txt
   source files don't affect the build.
2. `8857664b` bundles two unrelated payloads (USA's stale `.c` deletions +
   JPN's 14-function batch) under a "cleanup" message, because
   `config/jpn/arm9/delinks.txt` was already staged from a prior `git add`
   when the cleanup files were added to the same index. See the JPN
   ledger note above.

Neither was corrected via amend (project convention: prefer new commits;
amending was unnecessary since nothing was wrong, just imprecisely
labeled).

## Method note for future objdiff-gated porting waves

This is the second distinct failure mode found under "100% objdiff-complete
per-unit, fails at the real ROM gate" (the first was brief 453's
struct-offset literal). Together they define the actual check needed
before trusting objdiff-gated porting:

1. **objdiff validates content correctness** (does the compiled function
   match the ground-truth bytes) but says nothing about **linker/loader
   consistency** (does this TU's claimed address interact safely with
   region-specific tooling constraints like the thumb-align-wall). A
   function can be perfectly, byte-for-byte correct and still break the
   build if it's claimed at the wrong kind of address for its ISA mode.
2. Region ports are especially exposed because **the same source, ported
   verbatim, lands at a different address per region** — a claim that's
   safe in the source region can be unsafe in the target region purely
   because of where the linker happens to place it. This isn't
   predictable from the C source at all; it has to be checked per-region,
   per-function, against that region's actual link layout.
3. **The generalizable check:** before trusting an objdiff-complete port,
   for every Thumb function being newly claimed as `.c`, compute
   `start_address mod 4` against the target region's own `symbols.txt`.
   `0` is safe; `2` requires `.s` instead (or must stay unclaimed/`.s`
   until it is). ARM-mode functions are exempt (inherently 4-aligned).
   This is a cheap, mechanical, pre-build check — no wine-lane cycle
   needed to discover it if applied proactively.
4. The overarching maxim from brief 453 holds and is reinforced here:
   **the gate is the ROM, not objdiff.** Both known failure modes
   (struct-offset literal, thumb-align-wall) are invisible to per-unit
   objdiff and only surface at a real regional `ninja sha1`.

## Gates

- USA: real `ninja sha1` — green, baseline (unmodified) and after all 4
  incremental batches, re-verified once more on the final committed tree.
- JPN: real `ninja sha1` — green, baseline (unmodified) and after both
  incremental batches.
- `check_delink_dupes.py`: clean across all 81 `delinks.txt` files on the
  final tree.
- EUR: untouched this brief (no EUR source or config changes).
