# cm-bss-convert-8 — struct-lead resolution + 2 new SDK families (2026-08-01)

Follow-up to [`cm-bss-convert-7-2026-08-01.md`](cm-bss-convert-7-2026-08-01.md).
Priority this wave: a focused, full-toolkit resolution of every open
struct lead from waves 6 and 7, rather than deferring them a third
time. Secondary: continue the SDK-type scan.

## Result

**All 10 open leads from waves 6-7 resolved — 9 shipped, 1 permanently
declined with recorded reason.** **2 brand-new SDK families found and
shipped**: `GXOamAttr` (NDS hardware sprite attributes) and
`OSMessageQueue` (NitroSDK inter-thread message queue) — neither had a
vendored header before this wave; both were authored from scratch,
strictly from this game's own observed codegen. 13 symbols / 772 fresh
bytes + 3 retypes (240 B bucket-swapped) this wave.

```
Typed-array:   161,028 -> 161,052 bytes  (+24 B,    3.37% -> 3.37%)
Named-struct:   53,724 ->  54,736 bytes  (+1,012 B, 1.12% -> 1.15%)
```

Measured against a freshly re-baselined `git stash` snapshot of this
exact branch point (`origin/main` at `c91a2d491`), matching wave 7's
own reported ending values exactly. Both deltas match the per-symbol
hand-predicted totals exactly — see "a metric-model correction" below
for how that prediction was derived.

## Part 1: all 10 leads resolved, full toolkit applied

Dispatched 4 independent, fully-fresh investigations (not just
"continue the old notes") against every open lead from waves 6 and 7,
each re-verifying prior claims from scratch rather than trusting them.

### 6 fresh struct carves — all newly-shipped, none previously carved

| Symbol | Type | Bytes | Notes |
|---|---|---:|---|
| `data_ov009_021adc54` | `Ov009ScoreCtrl` | 64 | **All 16 of 16 four-byte slots confirmed**, zero padding needed — the richest lead of the whole campaign. Caught and self-corrected a near-miss where offset traffic from a *different* sibling object (`data_ov009_021adbcc`) nearly got misattributed |
| `data_ov005_021b1d4c` | `Ov005CardListAnim` | 92 | 13 scalar fields + a `short[5][4]` array bulk-copied from an already-shipped const table; only the array's last 2 bytes are write-only/unconfirmed |
| `data_02105b70` | `Packet02105b70` | 64 | **A genuine find**: a CRC-32/IEEE-checksummed packet (polynomial `0xedb88320`, confirmed via a textbook checksum-verify routine) — cleanly explains the exact 64-byte size as 0x3c payload + 4-byte trailer. Roughly half the payload stays honestly padded; the CRC alone proves it's a real record, not opaque |
| `data_ov016_021babec` | `SubsysB021babec` | 64 | Complete 13-field map; 2 fields (`+0x20`/`+0x28`) are real, confirmedly-addressed fields with no writer found anywhere in the traced graph — a genuine curiosity, recorded as such rather than hidden |
| `data_021aa0d0` | `Data021aa0d0` (`OSMutex` + pad) | 96 | Corrected a wrong claim from the prior pass (`func_020ace14` does **not** touch this symbol — it operates on an unrelated global); the 72-byte tail beyond the embedded `OSMutex` is now a *proven* gap (exhaustive `relocs.txt` closure: exactly 1 relocation exists, and it never indexes past `+0x0c`), not just an unfound one |
| `data_021a089c` | `Data021a089c` (`OSMutex` + 2 fields) | 32 | **Zero padding needed** — found 2 more shipped consumer files via the `relocs.txt` cross-symbol technique (tracing the *neighboring* symbol's relocations, since these two access our target only through the neighbor's own offset arithmetic) that direct-name `git grep` had missed entirely |

### 3 retypes — already-shipped `char[]`, upgraded to real structs

| Symbol | Old | New | Bytes | Notes |
|---|---|---|---:|---|
| `data_ov009_021adc00` | `char[72]` | `Ov009EntryPanel` | 72 | Includes a `char label[18]` field whose exact contents were recovered by reading the format string directly out of the ROM binary (`extract/eur/arm9_overlays/ov009.bin`): `"/card128/%04d.5bg"` |
| `data_ov014_022350f4` | `char[92]` | `Ov014PaneBController` | 92 | **100% evidenced** — every one of the 92 bytes traced to a real consumer, no padding anywhere. Strongest retype of the batch |
| `data_ov014_02235094` | `char[76]` | `Ov014PaneAController` | 76 | Shares its embedded `Ov014PaneSlot` shape with the sibling above (each file defines its own copy — C typedefs don't conflict across TUs) |

### 1 permanent decline

`data_ov007_022334d0` (80 B): a deeper trace than either prior pass
found 5 *new* fields, fully closing the `+0x34..+0x4f` tail (a 7-field,
zero-gap block) — real progress, up from 2.5% evidenced to 35%. But
`+0x00..+0x33` (52 of 80 bytes, 65%) has zero evidence anywhere,
including in the front half's own already-matched consumer
(`func_ov007_021b299c.c`), whose own struct model independently
declares `char gap00[0x3c]` before its own used fields — the shipped
code's own author didn't know what's there either. Below this
project's established retype bar (both prior DECLINE precedents,
`data_ov017_021b8570` at 22% and `data_ov006_0225e068` at 51%, were
stronger than this). **Recorded as final** per this wave's filing
instruction — the newly-found tail layout is preserved above so a
future pass with a different unlock (e.g. the front-half consumer
getting matched) doesn't have to re-derive it, but this is not
re-flagged as an open lead.

## Part 2: two new SDK families, both shovel-ready

An evidence-gathering pass (not shape-matching) across
`OSMessageQueue`, `OSAlarm`, `FSFile`, `GXOamAttr`, `NNSG2d*` found two
with strong, concrete, standalone-`.bss`-instance evidence. Neither
type existed in this project's vendored subset before this wave —
both headers were authored from scratch, based strictly on this game's
own directly-observed codegen (not copied from an external reference),
matching this project's `fx_vec.h`/`fx_mtx.h` precedent's own
requirement that field layout match real behavior byte-for-byte.

### `GXOamAttr` — new header `libs/nitro/include/nitro/gx_oam.h`

Real NDS hardware OAM (sprite) attribute entry. `func_0207f934`
(src/main, 14 call sites across main + 6 overlays) reads a source
table at an exact 6-byte stride as three consecutive `u16` values and
writes them to a destination at an 8-byte stride; two independent
already-decompiled callers (`func_0201e964`, `func_0201eaa0`) pass a
literal `.bss` address as that destination and separately patch
hardware bitmasks via plain load/bic/orr/store — never through C
bitfields, confirming a plain 4x`u16` struct (3 significant halfwords
+ 1 reserved) is both what the evidence shows and NitroSDK's own
documented convention for this exact type.

| Symbol | Type | Bytes |
|---|---|---:|
| `data_02191e38` | `GXOamAttr[33]` | 264 |

### `OSMessageQueue` — new header `libs/nitro/include/nitro/os_message.h`

NitroSDK's inter-thread blocking message queue. Three sibling
functions (`func_0209256c` send, `func_0209240c` insert-at-front,
`func_020924c0` receive) implement a textbook producer/consumer ring:
2 embedded `OSThreadQueue`s (send-wait / receive-wait, confirmed via
calls into the same `func_02091a8c`/`func_02091a0c` sleep/wake
primitives `OSMutex` uses), a `msgArray` pointer, capacity, ring index,
and count — 32 bytes total, confirmed identically across all 3
standalone instances found.

| Symbol | Bytes |
|---|---:|
| `data_0219ed20` | 32 |
| `data_021a520c` | 32 |
| `data_021a8d30` | 32 |

`FSFile` and `OSAlarm` both have real, thoroughly-proven mechanism
evidence (a 72-byte handle idiom used in 28+ call sites; a fully
reverse-engineered alarm struct already partially named in shipped
code) but no standalone `.bss` instance — both mechanisms are only
ever exercised through stack locals or fields buried behind pointer
indirection in still-uncharacterized larger objects. Not shipped this
wave; noted as leads if a relevant enclosing object ever gets
characterized. `NNSG2d*` was ruled out: the game ships real
NNS-authored asset files (verified NCGR/CHAR magic bytes) but no code
evidence of the actual library — `GXOamAttr`'s own consumer reads a
much simpler bespoke format, suggesting a hand-rolled parser instead.

## A metric-model correction, found while reconciling this wave's numbers

The first delta computed for this wave (`Typed-array` unchanged, all
772 fresh bytes counted only toward `Named-struct`) didn't match the
measured numbers — off by exactly 264 bytes, `GXOamAttr[33]`'s size.
Reading `tools/progress.py` directly (not re-deriving from memory)
resolved it: `Typed-array` and `Named-struct` are not mutually
exclusive buckets. `Typed-array` counts *any* bracketed array
declaration regardless of whether the element type is primitive;
`Named-struct` counts any non-primitive declaration, bracketed or not.
**A bracketed array of a non-primitive type counts toward both.** Every
prior wave's array-of-struct win came from *retyping* an
already-`Typed-array`-counted primitive array (so `Typed-array` never
visibly moved — it was already counted, just under the old type name);
`GXOamAttr[33]` is this campaign's first *brand-new* non-primitive
array, carved directly from raw `.bss` rather than retyped from an
existing primitive one, so its 264 bytes are new to both metrics at
once. Corrected prediction: `Typed-array` = -240 (3 retype swaps,
`char[N]` -> bracket-less struct) + 264 (`GXOamAttr`, new-to-both) =
+24. `Named-struct` = +240 (retypes) + 264 (`GXOamAttr`) + 412 (6
fresh bracket-less scalars) + 96 (3x `OSMessageQueue`) = +1,012. Both
now match measured exactly.

## Process notes

- **A focused re-investigation beats a third deferral.** All 4
  dispatched agents were told to re-verify prior claims from scratch,
  not extend them — this caught 2 real errors in the *prior* passes
  (`func_020ace14` misattribution, `data_02105b70`'s "+0x4 read twice"
  register-reuse trap) that a purely incremental follow-up would have
  inherited silently.
- **The `relocs.txt` cross-symbol technique** (checking a target's
  *neighboring* symbol's relocations, not just its own) surfaced real
  shipped consumers for `data_021a089c` that direct-name `git grep`
  structurally could not find, since those files access the memory
  only through the neighbor's own offset arithmetic. Worth trying by
  default whenever a symbol's own relocation count seems low relative
  to its evidenced complexity.
- **Authoring a new vendored header is justified by evidence density,
  not just plausibility.** Of 5 candidate SDK families screened, 2
  had concrete standalone-instance evidence and were shipped; 2 had
  real mechanism evidence but no shippable instance and were correctly
  held back; 1 had zero code evidence despite strong asset-level
  plausibility and was ruled out entirely.
- Cross-region aliasing: none of this wave's 13 symbols' addresses
  intersected the 105 flagged addresses from
  `docs/research/cross-region-symbol-aliasing-audit.md` (checked
  directly, not assumed) — no real test case for that lane's future
  block-list from this wave.
- Wave-6 safeguards applied throughout; every claim in this doc and
  the queue result block reconciled against `git diff --stat`/`git
  status --short` before writing it.

## Next steps

- `FSFile`/`OSAlarm`: both mechanisms are fully proven; revisit if a
  relevant enclosing object (`data_0219b400`'s 144-byte parent for
  `FSFile`; `data_021a088c`'s pointee for `OSAlarm`) ever gets
  characterized enough to expose a standalone instance.
- `q-zero-width-bss-tu-fix` (wave 4, PR #1415) remains open — 2
  shovel-ready carves (68 B) still wait on it.
- `q-cross-region-alias-guard` (wave 7, PR #1426) remains open.
