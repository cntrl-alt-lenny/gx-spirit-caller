# cm-bss-convert-1 — first `.bss` carve batch (2026-07-30)

Follow-up to [`cm-bss-carve-scope-2026-07-30.md`](cm-bss-carve-scope-2026-07-30.md),
which scoped the `.bss` carve workstream and shipped one proof-of-concept symbol.
This wave took the first real batch from the 462-symbol (re-derived: 435-symbol)
pool of already-referenced `.bss` symbols and ran each one through full per-symbol
reconciliation before converting.

## Result

**18 symbols investigated. 13 reconciled as CONVERT, 5 as DECLINE. 11 of the 13
shipped; 2 were mechanically blocked and deferred** (reconciliation stands, the
byte-size just isn't a multiple of 4 — see below).

```
Typed-array:   79,664 -> 139,104 bytes  (+59,440 B,  1.67% -> 2.91% of data bytes)
Named-struct:  50,112 -> 50,112  bytes  (+0 B,        1.05% -> 1.05%, unchanged)
```

Every shipped symbol is a plain primitive-element array (`char[N]` /
`unsigned char[N]`) — per `progress.py`'s own logic, a bracketed array whose type
clause is a primitive token moves `Typed-array` only, never `Named-struct`
(`_is_primitive_type_clause` excludes it from `_tu_has_named_struct_decl`'s count).
The measured delta matches this exactly: `+59,440` on `Typed-array`, `+0` on
`Named-struct`. Verified two ways — independently computed from the shipped
symbols' own sizes (hand sum: 59,440), and by running `tools/progress.py` on the
tree before and after via `git stash`/`git stash pop`, not by trusting any single
agent's own metric claim (see "Process notes" below for why that mattered).

## Methodology

Same as `cm-bss-carve-scope`'s established procedure, applied as a hard rule per
this wave's queue item:

1. Full-repo grep for every reference to the symbol (not just what the seed pool's
   scripted scan found).
2. Read every extern declaration's full text; any disagreement between consumers
   is an automatic DECLINE.
3. Confirm real size via two independent sources that must agree: the
   `symbols.txt` address gap to the next symbol, and the `.space N` value in the
   module's `bss/*.s` cluster file.
4. An unsized extern (`char foo[];`) asserts nothing about size — it's neither a
   confirmation nor a contradiction. It's a strictly weaker evidentiary position
   than a sized-but-partial extern, not an equivalent one.
5. Check consumer usage for flat-buffer vs. substructure evidence, including
   tracing into unmatched `.s` callees when a matched consumer's usage alone is
   inconclusive.

## Per-symbol results

### Shipped (11, 59,440 bytes)

| Symbol | Type | Bytes | Module | Why CONVERT |
|---|---|---:|---|---|
| `data_ov006_021d6ed0` | `char[19256]` | 19,256 | ov006 | Sole consumer forwards the pointer opaquely into an unrelated state-write call; never dereferenced |
| `data_ov006_02257548` | `char[18840]` | 18,840 | ov006 | 3 byte-identical externs; only 2 `u16` fields touched near the front; 2 independent dossiers both explicitly call the remainder a "gap" |
| `data_ov006_0225c4dc` | `char[1652]` | 1,652 | ov006 | 23 real externs (scripted scan undercounted at 14 — see process notes), unanimous, matches this data-table family's documented convention |
| `data_ov006_0225cbb8` | `char[4188]` | 4,188 | ov006 | 6/6 consumers agree; a `Fill32(0, ptr, 0x105c)` full-buffer zero-fill matches the declared size exactly |
| `data_ov003_021cf72c` | `char[1300]` | 1,300 | ov003 | Last symbol in its cluster (pure end-of-range carve); 4 byte-identical externs, all opaque-handle usage |
| `data_ov016_021b9784` | `char[4028]` | 4,028 | ov016 | Sole matched consumer passes the pointer straight through, untouched |
| `data_ov019_021b5e70` | `char[1220]` | 1,220 | ov019 | Sole consumer passes it as an opaque sort base to `func_ov016_021b22d8` |
| `data_02104f58` | `char[2348]` | 2,348 | main | Sole EUR extern (`GetSystemWork.c`) only returns the pointer; ~189 documented callers elsewhere access via `GetSystemWork()+offset`, described in prose but never as a named/machine-checked struct |
| `data_02193440` | `unsigned char[3840]` | 3,840 | main | Single consumer, opaque `void*` into a still-unmatched `.s` function, no field access |
| `data_0219d388` | `char[1568]` | 1,568 | main | Sole consumer does `+idx*0xc4` slot-address arithmetic only, never dereferences; an unverified dossier's 8x0xc4 struct theory (tied to an unmatched sibling) explicitly excluded as evidence |
| `data_0219adcc` | `unsigned char[1200]` | 1,200 | main | Sole typed consumer does manual pointer arithmetic only; declined a speculative 12x0x64 struct shape despite it "coincidentally" tiling exactly |

### Reconciled CONVERT, deferred for mechanical reasons (2, 9,036 bytes)

| Symbol | Type | Bytes | Module | Status |
|---|---|---:|---|---|
| `data_ov006_021cf1b0` | `char[4173]` | 4,173 | ov006 | Reconciliation stands (6/6 consistent externs, pure opaque-pointer usage). **Not shipped this wave** — 4173 is not a multiple of 4 |
| `data_0219060c` | `char[4863]` | 4,863 | main | Reconciliation stands (sole consumer, pure pointer arithmetic, evidence explicitly rules out a record-array shape since 4863 doesn't divide evenly by any candidate stride). **Not shipped this wave** — 4863 is not a multiple of 4 |

**Why deferred**: carving either symbol out as its own single-symbol TU leaves that
TU's exit boundary misaligned to 4 bytes. `mwldarm` inserts a real alignment gap
at a misaligned inter-TU boundary — invisible to a raw `.space`-sum check (which
only verifies total bytes, not alignment), but real at link time. This was not
theoretical: the first attempt at this wave shipped both symbols, and the build
failed `ninja sha1` with millions of differing ROM bytes. `ninja check` isolated
it precisely — every symbol downstream of `data_0219060c` in ARM9 main showed a
consistent, cascading address shift (`data_0219190b` +1, `data_02194340` +4,
`data_0219b27c` +4, `data_0219d9a8` +4 — the +1 from the first misaligned
boundary, then unchanged since nothing later reintroduced misalignment). Same
signature for `data_ov006_021cf1b0` in ov006 (matches the previously-documented
`feedback_non-4-byte-tu-split-linker-gap` failure mode, now confirmed a second
time in a different context). Pulling both from the batch and rebuilding produced
a clean `ninja sha1` PASS and a clean `gate3.py --scope all` GATE PASS. The carve
script now hard-asserts 4-byte alignment on every target boundary before writing
anything, so this can't silently reoccur.

Both remain valid CONVERT-reconciled candidates for a future wave — the size and
shape evidence isn't in question, only the standalone-TU mechanics. A future pass
could revisit them alongside an adjacent symbol (pairing into one TU whose
combined size is 4-aligned) rather than as solo carves.

### Declined (5, 6,596 bytes evaluated, 0 shipped)

| Symbol | Bytes | Module | Why DECLINE |
|---|---:|---|---|
| `data_021a5844` | 1,236 | main | Unsized extern proves nothing; the sole downstream callee's raw disassembly (corroborated by an already-matched sibling sharing the same field-offset pattern) shows a ~12-byte linked-list-header struct at the front — directly contradicting a flat-buffer read of the other ~1,224 bytes |
| `data_02105f4c` | 1,372 | main | Ground-truth-verified `.s`/`.c` consumers dereference up to 780 bytes *past* the declared `.space` boundary — the carved boundary doesn't correspond to a real object edge (likely one large shared system-work region sliced into several anchor symbols by the original automated carve) |
| `data_021a4cd0` | 1,124 | main | Not self-contained — field `+0x1c` of a shared 32-element, 0x24-byte-stride array-of-structs whose real base is the earlier sibling symbol `data_021a4cb4`, outside this task's scope |
| `data_021922e0` | 2,080 | main | Partial-coverage trap: the only 2 consumers (copies of one templated draft, not independent) evidence just 13 of 2,080 bytes (0.6%) |
| `data_021a84c0` | 1,568 | main | 2 conflicting externs already live in the tree (`char[]` vs. `char*`, the pointer form objdump-verified against the shipped `.o`); evidence of a self-referential subsystem-control struct (lock/refcount, ring-buffer cursor, callback slot, flags) via both direct-base and pointer-chase access; <20% of the region evidenced at all |

Each DECLINE reason is a distinct failure mode — no two are the same shape of
problem, which is a reasonable sign the reconciliation rule is discriminating
real cases rather than pattern-matching on a single tell.

## Process notes

- **Undercounted extern references**: `data_ov006_0225c4dc`'s prescan said "~14"
  references; the real count was 23 — 8 consumers used a multi-symbol comma-list
  extern form (`extern char a[], b[], c[];`) that a simple single-line regex
  scan misses. All 23 agreed, so the conversion was unaffected, but it's a
  reminder that the seed pool's reference counts are a floor, not a ceiling.
- **`.ignore`-filtered grep gap**: `data_ov016_021b9784`'s investigation found the
  default ripgrep-backed search tool silently excludes `docs/research/c-match-prep/`
  via a repo-root `.ignore` file, even though that directory is git-tracked and
  not gitignored. `git grep` (which only respects `.gitignore`) found 2 more
  files there, one of them relevant. Worth using `git grep` for repo-wide
  reference sweeps generally, not just when a result looks incomplete.
- **Self-caught hex typos**: at least 3 investigation prompts this wave stated a
  `.space` value that didn't match the true file content (transposed or dropped
  digits, e.g. `0x4988`->`0x4998`, `0x1305`->`0x12ff`, `0x1055`->`0x104d`). Every
  case was caught by the dispatched agent verifying against the actual file
  rather than trusting the prompt's stated value, and used the correct number.
  Direct evidence the "verify, don't trust the scan" rule is working as intended
  — including against this session's own dispatch prompts.
- **Cross-agent metric-claim inconsistency, caught before shipping**: the
  `data_ov006_0225c4dc` investigation claimed its conversion would move both
  `Named-struct` and `Typed-array`, while the equivalent `data_ov016_021b9784`
  investigation correctly identified its own (structurally identical) conversion
  as `Typed-array`-only. `char` is a primitive type clause, so neither should
  move `Named-struct` per `progress.py`'s own `_is_primitive_type_clause` check.
  Rather than trust either agent's narrative claim, the actual metric delta was
  computed directly by running `progress.py` before/after — confirmed
  `Named-struct +0` across the whole shipped batch, settling it empirically.
- **The alignment bug** (detailed above) is the headline mechanical finding of
  this wave: a `.space`-sum-only check is not sufficient to safely carve a
  symbol out of a cluster file into its own TU. Byte-count preservation and
  4-byte boundary alignment are two separate invariants, and only the second
  one is actually enforced by the linker. The carve script's alignment guard is
  the durable fix.

## Next steps

- The `.bss` carve pool still has ~420+ untouched symbols after this wave (435
  pool minus 13 investigated). A follow-up wave can pull the next batch using
  the same reconciliation procedure.
- `data_ov006_021cf1b0` and `data_0219060c` are shovel-ready CONVERT verdicts
  blocked only by the alignment mechanics — worth revisiting with a pairing
  strategy rather than re-investigating from scratch.
- `data_02105f4c`'s decline surfaced a specific, scoped lead: the
  `0x02105f4c`-`0x021067b4`+ span likely wants investigation as one shared
  system-work-area struct spanning several already-named anchor symbols, not as
  independent single-symbol reconciliations.
- `data_021a4cd0`'s decline similarly points to a combined-pass candidate: the
  32-element array-of-structs based at `data_021a4cb4`, together with its
  sibling fields `data_021a4ccc` (+0x18) and the dossier-documented +0x0c field.
