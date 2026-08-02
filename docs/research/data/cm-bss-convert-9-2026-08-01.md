# cm-bss-convert-9 — FSArchive resolved + AudioBank family + pool-yield note (2026-08-01)

Follow-up to [`cm-bss-convert-8-2026-08-01.md`](cm-bss-convert-8-2026-08-01.md).
Filing instruction asked for honesty if fresh-candidate yield drops —
it did. This wave leans entirely on SDK-type resolution and an
existing-research pattern-family rediscovery instead of a traditional
volume batch.

## Result

**A dormant, month-old lead resolved**: `data_021a8334` (flagged by
`cm-bss-convert-4` as struct-shaped, never resolved since) is
NitroSDK's `FSArchive` — a new vendored header, 76 of 92 bytes
evidenced. **2 more symbols shipped using already-vendored types**
(`OSTick`, and an `OSThreadQueue`-shaped anchor). **6-member struct
family found and shipped** by cross-referencing this project's own
pre-existing `ov006_core.h` research rather than blind reverse
engineering — including a genuine cross-module rediscovery (a
"different module, unrelated" candidate turned out to be the family's
6th member). **9 symbols / 468 B total, zero declines-that-stayed-open**
(1 real decline, `data_0210594c`, for a proven boundary conflict, not
a research gap).

```
Typed-array:   161,052 -> 161,052 bytes  (+0 B,     3.37% -> 3.37%)
Named-struct:   54,736 ->  55,204 bytes  (+468 B,   1.15% -> 1.16%)
```

Measured against a freshly re-baselined `git stash` snapshot of this
exact branch point (`origin/main` at `1050e7b5f`), matching wave 8's
own reported ending values exactly.

## Part 0: the pool-yield check, reported honestly

Re-derived the fresh candidate pool (excluding all 167 symbols named
across waves 1-8): the non-primitive pool is down to 9 candidates
totaling 92 bytes (mostly 0-4-byte pointer fields and the `_alias`
pool-header family this campaign has treated cautiously throughout);
the primitive pool's largest candidate is 61 bytes, versus 92 B last
wave, 256 B two waves ago, 512+ B in earlier waves. **A traditional
volume batch was not attempted this wave** — the pool doesn't support
one at the quality bar this campaign holds, and forcing a batch of
weak single-consumer 40-60 B candidates would have been exactly the
low-yield pattern the filing instruction asked to watch for. Instead,
effort went into the SDK scan (Part 1) and recognizing an
already-partially-documented pattern family in the existing pool data
(Part 2) — both proved far more productive than raw volume would have
been.

## Part 1: SDK scan — 2 families shipped, `FSArchive` a real breakthrough

Screened `OSAlarm`/`FSFile` (re-checks) plus `OSTick`/`FSArchive`/`GXRgb`
(fresh). Process note: one dispatched investigation briefly produced a
garbled non-answer instead of its findings mid-task; resuming it
directly (rather than treating the garbled output as a real negative
result, or silently re-spending a full fresh investigation) recovered
the actual work in progress, which turned out substantive.

### `FSArchive` — `data_021a8334` (92 B), new header `libs/nitro/include/nitro/fs_archive.h`

This is `cm-bss-convert-4`'s own flagged lead ("a stored function
pointer at +0x50 ... categorically incompatible with flat typing"),
raw ever since. `func_02098478` — already identified via the existing
`libs/nitro/FS_Init.legacy.c` vendoring as `FSi_InitRom`, citing
upstream `pokediamond:arm9/lib/NitroSDK/src/FS_file.c`, the real file
where NitroSDK's `FSArchive` lives — installs one of two backend
function-pointer sets into this object depending on a boot-device-type
flag. One-level-deeper tracing through 4 more functions that never
name the symbol directly (only receive it as a parameter) recovered
76 of 92 bytes: an embedded `OSThreadQueue` wait-queue (using the same
`OSi_InsertLinkToQueue` primitive `OSMutex`/`OSMessageQueue` use),
state flags, a pending-request list head, two mapped-region
pointer/size pairs, and 4 callback/handler function pointers —
including wave 4's original `+0x50` lead, now fully contextualized as
one of several backend callbacks rather than an isolated fact. Two
small ranges (`+0x00..+0x0b`, `+0x20..+0x23`) are honest gaps,
confirmed via `relocs.txt` (exactly 5 relocations, all accounted for)
to have zero real consumers, not just none found yet.

### `OSTick` — `data_021a66c8` (8 B), already-vendored type, no new header

`OS_GetTick`'s software backing store. `os.h` already declares
`typedef u64 OSTick;`; this object is the actual 64-bit accumulator it
returns, combined with a 16-bit hardware timer on read. Confirmed
clean via all 4 real consumers (found one beyond the initial list via
`relocs.txt`) — every write is a full-both-words 64-bit operation, no
sub-field ever singled out for a separate purpose.

### An `OSThreadQueue`-shaped anchor — `data_021a66d4` (8 B), already-vendored type

The alarm-list head/tail anchor for the `OSAlarm` mechanism (fully
reverse-engineered in wave 8, still no standalone `.bss` instance for
the alarm nodes themselves). Byte-identical in shape to `OSThreadQueue`
(confirmed: only `+0x0`/`+0x4` ever touched, across all 4 real
consumers) — but shipped with an honest naming caveat, documented
inline: the nodes it actually links are alarm/timer-deadline records,
not `OSThread` instances, so reusing the typedef asserts a "thread"
semantic the observed usage doesn't exercise. Shipped anyway since the
byte layout is provably identical and this project's own
`OSi_InsertLinkToQueue` primitive is already used generically across
multiple non-thread node kinds.

`FSFile` and `OSAlarm` re-checks: both reconfirmed negative
(no standalone instance), the second time via a completely independent
investigative path (hardware-timer-MMIO literal greps rather than
type-signature scanning) landing on the identical conclusion as wave
8 — strengthening confidence this is a real, not under-searched,
negative. `GXRgb`'s scalar semantics are now solidly proven (RGB555
packing via two independent already-shipped code paths) but the one
`.bss` candidate array is buried in a heavily-fragmented, `ambiguous`
-tagged region needing dedicated boundary-carving before it could ship
— not attempted this wave.

## Part 2: the `Ov006AudioBank` family — 6 members, found via existing research

`src/overlay006/ov006_core.h` already documented a cross-referenced
"bank"/"status" pairing family from prior briefs (`brief-309` through
`brief-314-ov006-waveN-drain.md`), naming 5 of this wave's targets as
"audio sub-structs" without a resolved type. Investigating them
together (rather than as 5 scattered weak single-consumer primitive
candidates, which is how the fresh pool scan surfaced them) found one
proven, shared 60-byte struct:

| Symbol | Module |
|---|---|
| `data_ov006_021cf174` | ov006 |
| `data_ov006_0224f1c0` | ov006 |
| `data_ov006_0224f20c` | ov006 |
| `data_ov006_0224f254` | ov006 |
| `data_ov006_0224f2f4` | ov006 |
| `data_ov021_021ace8c` | ov021 |

Every member's sole consumer runs the identical `func_0202adf8`
(caches the object's own address into a global "current bank" pointer,
`Fill32`-zeroes all 60 bytes) immediately followed by `func_0202ae1c`
(shipped byte-exact ground-truth `.s`, dereferences that cache) —
proving all 5 fields groups' offsets from one real ground-truth trace,
corroborated by 3 more already-matched functions in the same call
chain. 12 of 15 words are directly evidenced; `+0x20..+0x2b` is an
honest gap, represented as padding the same way this codebase's own
already-shipped sibling functions represent it.

**The 6th member is a genuine rediscovery**: `data_ov021_021ace8c` was
dispatched as an "unrelated, different module" control candidate —
its `Audio_Init.c` consumer runs the exact same 3-call chain, making
it the family's 6th confirmed member, not an independent object. Also
a single-symbol `.bss` cluster file (this campaign's 3rd instance of
that mechanical case, after wave 5 and wave 8), handled via the same
direct delinks.txt repoint + file deletion.

Two more likely members were flagged but not carved this wave
(`data_ov006_0224f2ac`, `data_ov006_0224f344` — same size, same
idiom per raw `.s`/draft evidence, not independently re-verified to
this wave's standard) — ready for a fast follow-up.

## Declined (1)

`data_0210594c` (61 B): the declared boundary is real (`symbols.txt`
gap and `.space` both agree) but **already-matched, shipped code reads
past it** — `func_020191cc.c` dereferences `+0x52` (21 bytes past the
boundary), independently confirmed by raw disassembly in
`func_ov004_021d3de4.s` reading `+0x58` (29 bytes past). The neighbor
symbol `data_02105989` is itself independently, separately relocated
(3 real consumers of its own address) — this is a genuine boundary
conflict between two real, both-referenced globals, not a simple
under-sized carve. Needs a dedicated combined investigation of both
symbols together; not attempted here.

## Process notes

- **Reported the pool-yield drop honestly rather than forcing a
  batch** — matches this wave's explicit filing instruction. The
  numbers (9 non-primitive candidates/92 B, primitive top capped at
  61 B) are roughly a quarter of wave 6's density.
- **Leaning on this project's own existing research paid off far more
  than a blind pool scan would have.** The `ov006_core.h`
  cross-reference is what turned 5 marginal-looking 60-byte
  single-consumer candidates into one clean, confidently-typed
  6-member family — worth checking for existing per-module `_core.h`
  documentation before writing off a small-looking primitive
  candidate as low-value.
- **A background investigation's garbled stop was recovered, not
  treated as a negative result or silently redone.** Resuming the
  same agent directly (rather than trusting the malformed "no
  findings" output or re-spending a full fresh dispatch) got the real,
  substantive report — worth trying before assuming a confused agent
  output means the work didn't happen.
- Two research-doc staleness bugs found and flagged (not fixed, both
  read-only investigations): `docs/research/map/_names_overlay006.md`
  attributes 2 functions to the wrong struct (verified against real
  shipped source, matches `brief-309`'s byte-verified table instead);
  and my own dispatch prompt mis-cited `cm-bss-convert-7`'s OSMutex
  work as having investigated the ov006 main-state structs, which it
  hadn't (the addresses don't overlap) — a self-caught citation error,
  not consequential to this wave's outcome but worth noting.
- Cross-region aliasing: none of this wave's 9 symbols' addresses
  intersected the 105 flagged addresses from
  `docs/research/cross-region-symbol-aliasing-audit.md` (checked
  directly) — no new test case for that lane this wave.
- Wave-8 safeguards applied throughout; every claim in this doc and
  the queue result block reconciled against `git diff --stat`/`git
  status --short` before writing it.

## Next steps

- `data_ov006_0224f2ac`, `data_ov006_0224f344`: same `Ov006AudioBank`
  family, same idiom, not independently re-verified this wave — fast
  follow-up candidates.
- `data_0210594c`/`data_02105989` boundary conflict: needs a dedicated
  joint investigation, not a single-symbol carve attempt.
- `GXRgb`'s one real `.bss` candidate needs boundary-carving work (like
  the original `cm-bss-carve-scope` precedent) before it's shippable —
  the type itself is ready whenever a clean instance surfaces.
- `q-zero-width-bss-tu-fix` (wave 4, PR #1415) and
  `q-cross-region-alias-guard` (wave 7, PR #1426) remain open.
