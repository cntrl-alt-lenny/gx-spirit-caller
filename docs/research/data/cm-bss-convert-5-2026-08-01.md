# cm-bss-convert-5 — retroactive DispatchState audit + fifth carve batch (2026-08-01)

Follow-up to [`cm-bss-convert-4-2026-07-31.md`](cm-bss-convert-4-2026-07-31.md).
Three parts: a retroactive audit of every DispatchState member shipped
before wave 4's lower-bound rule existed, a dedicated resolution of the
two leads wave 4 flagged for a focused follow-up, and a fresh
reconciliation batch continuing to favor `Named-struct` candidates.

## Result

**Retroactive audit: all 5 pre-wave-4 DispatchState members CONFIRMED
CORRECT, zero fixes needed.** Two dedicated leads resolved: one struct
retype (`data_ov019_021b6848`), two vendored-SDK `OSThread` retypes
(`data_0219b490`, `data_021a5340`) — a first for this project. **Fresh
batch: 15 symbols investigated (9 CONVERT, 6 DECLINE), all 9 shipped**,
plus one additional alignment-pairing symbol discovered mid-carve
(`data_ov004_0229164c`), for 10 symbols shipped across 9 files.

```
Typed-array:   159,508 -> 160,072 bytes  (+564 B,  3.34% -> 3.35%)
Named-struct:   52,836 ->  53,352 bytes  (+516 B,  1.11% -> 1.12%)
```

Measured against a freshly re-baselined `git stash` snapshot of this
exact branch point (`origin/main` at `9af2c18a0`), matching wave 4's own
reported ending values exactly (159,508 / 52,836), confirming a clean
anchor. Both deltas match the per-symbol hand-predicted totals exactly.

## Part 0: retroactive DispatchState audit (the lower-bound rule, applied backward)

Wave 4 established that a matched consumer's own extern is only a lower
bound on an object's true size, after finding 2 of the pattern's most
recent 4 members were shipped 4 bytes short. This wave re-checked the
5 members shipped *before* that rule existed — `data_ov023_021b23a0`
(the original proof-of-concept), `data_ov009_*`, `data_ov016_021bab44`,
`data_ov017_*`, `data_ov019_*` — against the same standard: a second
independent consumer, or a ground-truth `.s` write, for every field.

**All 5 confirmed correct as shipped, no undersizing found.** For two of
them (`data_ov023_021b23a0`, `data_ov009_*`) the audit used the
`relocs.txt` structural-proof technique — counting every `kind:load
... to:<addr>` relocation targeting the symbol's address in the shipped
ROM's own relocation table — to conclusively rule out any consumer this
project's source doesn't already account for, a stronger guarantee than
grep-based reference counting alone. The DispatchState family (7 shipped
members) is now fully verified end-to-end with zero known undersizing
risk. This negative result is worth keeping on record precisely because
it's negative: it means no future wave needs to re-run this check.

## Part 1: three dedicated retypes

### `data_ov019_021b6848` -> `Ov019SceneBState` (204 B, Named-struct only)

Wave 4's flagged struct alternate (two ~92-byte "edit records" + a
16-byte tail, ~200 of 204 bytes evidenced) resolves with exact field
types, not just offsets. Both edit records are now proven identical in
shape (not coincidentally similar) — `Ov019EditRecord { void *handle;
void *aux; void *tasks[19]; void *pending[2]; }`, corroborated by two
independently-decompiled consumers of the same block shape
(`func_0201ef3c.c`'s `state_0201ef3c_t`, `func_0201f090.c`'s
`list_f090`). The scene controller's tail is a fade/slide/count
animation state, exact field roles confirmed via 4 separate consumer
functions all performing the same 3-field transaction. Only 4 bytes
(`+0xc8..+0xcb`) remain an honest, explicitly-padded gap.

**This retype is a straight swap, not a free addition** — unlike wave
4's two precedents (`data_0218fd10`, `data_021a071c`), which kept an
outer array bracket (`Type name[N]`) and so added `Named-struct` while
leaving `Typed-array` untouched, `Ov019SceneBState` is genuinely
heterogeneous (a 2-element record array *plus* 5 scalar tail fields) and
cannot honestly keep a top-level array bracket. The bracket-less
singleton form is exactly the scenario `tools/progress.py` already
special-cases (`q-metric-singleton-struct-gap`, from the tooling-fix
phase): `Typed-array` -204 B, `Named-struct` +204 B.

### `data_0219b490` -> `OSThread` (192 B, Typed-array -> Named-struct)

### `data_021a5340` -> `{ OSThread thread; unsigned char reserved[0x400]; }` (1,216 B, same bucket)

Both symbols carried unusually strong vendored-SDK-type evidence since
wave 2/4 but were held conservative pending a dedicated pass, per wave
4's own next-steps note. Resolved deliberately, once, for both together:

- **Include mechanism**: `tools/configure.py` builds one global `-i`
  include set from every `include/` directory under both `src/` and
  `libs/`, with no differentiation between the two trees — confirmed by
  reading the config code directly, not assumed. 6 existing
  `libs/nitro/OSi_*.legacy.c` files already include
  `<nitro/os_thread.h>` successfully, but only through the *legacy* mwcc
  rule; this wave is the first time it's been built through the
  *default* rule these two files use. `ninja sha1` passing confirms it
  compiles clean either way.
- **`data_0219b490`**: exactly 192 bytes (no slack against its neighbor),
  4 consumers, every touched offset (0x64 state, 0x78 queue, 0x9c
  joinQueue, 0xb0 alarmForSleep) matches `struct _OSThread` exactly,
  zero contradictions. Ships as a bare `OSThread data_0219b490;`.
- **`data_021a5340`**: 1,216 bytes total, but only the first 192 bytes
  are `OSThread` — ground truth (`func_02088dd8.s`) shows the thread's
  *actual* stack buffer is a separate, adjacent symbol
  (`data_021a5800`), passed explicitly at the thread-creation call site.
  **This corrects wave 2's implicit framing**: the trailing 1,024 bytes
  of `data_021a5340` were never proven to be "this thread's own stack"
  — they're simply unclaimed adjacent BSS that dsd's boundary tracer
  folded into the same symbol. Shipped as an honest two-field wrapper
  rather than asserting an unproven role for the tail.

`data_0219b490` moves the metric (`Typed-array` -192 B, `Named-struct`
+192 B, since the prior `char[192]` was a bracketed primitive array and
`OSThread` is a bracket-less non-primitive scalar). `data_021a5340` was
*already* a bracket-less non-primitive declaration under its old ad-hoc
struct, so swapping its internal content for a real vendored type moves
zero bytes between buckets — pure correctness, not metric-visible.

## Part 2: fresh batch, 9 CONVERT / 6 DECLINE, one alignment-pairing bonus

| Symbol | Type | Bytes | Movement | Why |
|---|---|---:|---|---|
| `data_02105eb8` | `unsigned char[132]` | 132 | Typed-array | Dynamically-indexed bit-test table, no pass-through to trace |
| `data_0218ff8c` | `int[32]` | 128 | Typed-array | Flat-indexed, parallels an already-shipped sibling table 1:1 |
| `data_0219daf4` | `char[128]` | 128 | Typed-array | 2 confirmed/committed consumers agree; 3 *unverified draft* consumers proposing `void*[]` are internally self-contradictory, not trusted |
| `data_021a8288` | `int[32]` | 128 | Typed-array | Flat-indexed per-slot value array, consumer's own comment confirms |
| `data_ov006_0225deb4` | `Ov006Obj6d8c` | 120 | Named-struct | Surface text (5 consumers, 100% agreeing `char[]`) is misleading — every consumer is a pure pass-through; one-level-deeper trace found the Metrowerks `__register_global_object` C++-dtor-registration call (a marker no primitive buffer would ever get) plus 3 confirmed int fields via dedicated one-line setters |
| `data_ov011_021d41a0` | `char[120]` | 120 | Typed-array | Per the project's own explicit, already-documented convention (`ov011_core.h`): kept `char[]` for pointer-arithmetic ergonomics even though each element is a well-defined 20-byte struct |
| `data_ov004_0229164c` + `data_ov004_0229164e` | `char[2]` + `char[98]` | 100 | Typed-array | Alignment-pairing fix (see below); both independently referenced, both flat opaque buffers |
| `data_ov005_021b1ddc` | `char[112]` | 112 | Typed-array | Weakest evidence of the batch — zero direct byte-level access anywhere, only a full-region `Fill32` zero and inert stub ctor/dtor — but zero contradicting evidence either |
| `data_ov004_02291f98` | `char[112]` | 112 | Typed-array | First-ever whole-file promotion (see below); matches 2 already-shipped siblings of the same `Rec`-cast pattern in the same source function |

**Fresh bytes shipped: 1,080** (960 Typed-array + 120 Named-struct,
across 9 files / 10 symbols, the 10th being the alignment-pairing
bonus). Combined with the 3 retypes' bucket movements (`Typed-array`
-396, `Named-struct` +396), total delta matches the measured
`Typed-array` (+564) and `Named-struct` (+516) exactly.

### The alignment-pairing bonus: `data_ov004_0229164c`

`data_ov004_0229164e` alone starts at `0x0229164e` — not 4-aligned,
caught immediately by the wave-1 alignment guard before any build was
attempted. Its immediately-preceding neighbor, `data_ov004_0229164c` (2
bytes, itself 4-aligned), turned out to have its own real, independent
consumer usage in the *same two* caller functions — a fixed 2-byte
`memcpy`-style copy and a keyed-CRC "key" argument, both confirmed
against ground truth (`func_ov004_021dc1cc.s`, a finalized ship-as-.s
file), both clean and non-contradictory. Per the established
alignment-pairing fix (`cm-bss-convert-2`), both now ship in one TU,
starting at the 4-aligned `0x0229164c` — but unlike wave 2's precedent
(which merged an *unreferenced* neighbor into its partner's array,
losing its own name), both symbols here keep their own name and type,
since both are independently addressed and neither depends on the
other's placement or the TU's internal declaration order.

### The whole-file promotion: `data_ov004_02291f98`

The pool scan surfaced this wave's first-ever single-symbol `.bss`
cluster file (`src/overlay004/bss/data_ov004_bss_2_2.s`, confirmed by
its own header comment: "1 .bss symbols"). Converting it leaves *zero*
remaining fragment — a case the carve script's own invariant explicitly
rejects, so it was handled directly rather than through the script:
write the new `.c` file, repoint the single `delinks.txt` entry from
the `.s` path to the `.c` path (same `complete` / `.bss start:end`,
only the path changes), delete the now-pointless `.s` file. `ninja
sha1` passed clean on the first attempt — this is mechanically just a
normal ship-as-.s-to-.c promotion, distinct from wave 4's genuine
zero-width-TU wall (that one failed because a *0-byte marker* symbol
was left as its own adjacent TU; this one leaves no TU behind at all).

### Declined (6)

| Symbol | Bytes | Why |
|---|---:|---|
| `data_ov017_021b8610` | 108 | Direct int field at +4 in the first consumer already disproves flat buffer; one-level-deeper trace found 9+ more fields in a card-open animation controller |
| `data_ov006_0225e138` | 104 | **Strongest decline of the batch** — the project's own `ov006_core.h` header already documents this exact symbol as needing per-TU local struct typing; confirmed `int[5]` handle array via two independent, opposite-direction consumer groups (alloc vs. teardown), `Fill32` only zeroes 80 of 104 bytes (an internal boundary a uniform buffer wouldn't have) |
| `data_ov021_0222ced4` | 100 | 2 independent callees decode different fields (task handle at +0, state index at +0x38, frame counter at +0x3c) from a `Scene_Update`-driven controller, corroborated by an existing research dossier |
| `data_ov012_021cc80c` | 96 | 2 independent callees extract different bitfields (bits 2 and 4-6) from the *same* word at offset 0 — conclusive packed-flags evidence |
| `data_021a8334` | 92 | A stored function pointer at +0x50 (`&func_02097ce8`) is categorically incompatible with flat typing — most decisive single piece of struct evidence in the batch |
| `data_0219c408` | 120 | Not a standalone object at all — ground-truth address arithmetic proves it's element 27 (the last) of a 28-element struct-array whose real base is `data_0219b760`, a symbol this campaign already declined in wave 2 for the identical reason (a record array provably spanning 3 separately-declared `.bss` symbols) |

## Process notes

- **The `__register_global_object` call is a decisive discriminator for
  C++-object-shaped globals.** `data_ov006_0225deb4`'s sinit function
  registers it for destructor cleanup — an ABI artifact no primitive
  byte buffer would ever get, emitted only for objects the original
  source gave a constructor/destructor. Worth checking for on any
  future symbol whose only consumers are pure pass-throughs, since
  those are exactly the cases surface-level extern text can't
  distinguish from a real flat buffer.
- **Draft research docs disagreeing with shipped/confirmed code stays
  resolved in favor of the confirmed code** — `data_0219daf4` had 3
  self-flagged-uncertain draft consumers proposing `void*[]` against 2
  landed, agreeing `char[]` consumers; tracing the drafts' own shared
  callee found their chain was internally unreconciled (a draft
  caller's extern signature didn't even match its own draft callee's
  return type). Flagged for whoever lands those drafts, not treated as
  a blocker here.
- **A single-symbol `.bss` cluster file needs a different mechanical
  path than the standard carve script** — the script's own "at least 1
  remaining fragment" invariant exists because every prior wave's
  targets had siblings; this wave's pool scan (now scraping much
  smaller candidates than earlier waves) surfaced the first exception.
  Handled by direct `delinks.txt` repoint + file deletion rather than
  bending the script to a case it wasn't designed for.
- Wave-4 safeguards applied throughout; every claim in this doc and the
  queue result block reconciled against `git diff --stat`/`git status
  --short` before writing it.

## Next steps

- The non-primitive (struct-referenced) pool via simple extern-scanning
  is now nearly exhausted (5 tiny candidates remained going into this
  wave, all `_alias`-suffixed or 0-byte, deliberately not attempted this
  round). Continuing to weight toward `Named-struct` candidates will
  likely need a different discovery technique next wave — pattern-family
  search (as `DispatchState` was found), one-level-deeper pass-through
  tracing on primitive-looking pools (as `data_ov006_0225deb4` was found
  this wave), or revisiting declined-but-partially-evidenced symbols
  (`data_ov006_0225dc34`'s partial 0x0-0x7c layout from wave 4 is still
  preserved and waiting on `func_ov006_021b53d4` getting matched).
- `data_0219c408`'s cross-symbol array (based at `data_0219b760`,
  spanning `data_0219b940`) is now doubly-declined for the same
  documented reason across 2 non-adjacent waves — a real candidate for a
  coordinated, single combined-pass carve rather than continuing to
  decline its individual fragments one at a time.
- `q-zero-width-bss-tu-fix` (filed wave 4, PR #1415) is not yet merged;
  once it lands, `data_ov001_021ca420_alias`'s already-reconciled
  4-byte-struct-plus-honest-gap carve is ready to ship immediately.
