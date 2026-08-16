# cm-restock-carve-7 — P-50's evidence boundary closes, main's largest remaining pool drains (2026-08-14)

Seventh wave of the restock-census carve series. Two parts: close the
OBSERVED-NOT-CONFIRMED evidence boundary the brain flagged on P-50 at
`cm-restock-carve-6`'s merge review, then keep draining the restock
pool — this wave's target is `main`, the largest remaining 4-aligned
module group in the 2026-08-03 census.

## Part 1 — P-50's evidence boundary

`cm-restock-carve-6` classified the composed-TU size-ordering wall as
`codegen-walls.md`'s P-50, PERMANENT. At merge review the brain
demoted that to OBSERVED-NOT-CONFIRMED: every scratch compile and both
real candidates behind the entry ran at the **default SP only**, and
this document's own bar for a `P` verdict is an N-variant × SP sweep
(the same bar that demoted P-10 to C-29). Two untested tiers were
reachable for zero extra machinery — `.legacy.c` (mwcc 1.2/sp2p3) and
`.legacy_sp3.c` (mwcc 1.2/sp3), both selected by filename in
`tools/configure.py`.

### The 3-tier sweep

Same shape as the original discovery (a 43-byte array declared before
a 1-byte scalar — address-ascending, size-descending, mirroring the
real `data_ov011_021d3034`/`_305f` candidate), compiled standalone
through all three mwcc tiers, both declaration orders:

```
$ arm-none-eabi-objdump -t scratch_p50.o          # default 2.0/sp1p5
00000000 g     O .data 00000001 g_small
00000000 g     O .data 0000002b g_big

$ arm-none-eabi-objdump -t scratch_p50.legacy.o    # .legacy.c, 1.2/sp2p3
00000000 g     O .data 00000001 g_small
00000000 g     O .data 0000002b g_big

$ arm-none-eabi-objdump -t scratch_p50.legacy_sp3.o  # .legacy_sp3.c, 1.2/sp3
00000000 g     O .data 00000001 g_small
00000000 g     O .data 0000002b g_big
```

All three tiers, both declaration orders (`g_big` first and `g_small`
first): identical outcome. `g_small`'s `.data` section always lands
first in the compiled object (lower section index, lower file offset)
regardless of source order or compiler tier. **Clean negative across
the board.**

### Leg 3 — the one-compile merged-symbol repair

The OBSERVED-NOT-CONFIRMED note also flagged Leg 3 (the
merge-to-one-symbol falsification) as weaker than stated, since the
original mwldarm link failure is specific to how one consumer
(`func_ov011_021caafc`) references the eliminated symbol. The
suggested repair — rewrite that consumer to reference the merged
symbol `+ 43` instead — was run directly:

- `config/eur/arm9/overlays/ov011/symbols.txt`: removed the
  `data_ov011_021d305f` line (simulating the merge).
- `src/overlay011/func_ov011_021caafc.c`: `data_ov011_021d305f` →
  `data_ov011_021d3034 + 43` (same final address either way).
- `ninja check` (which runs `dsd delink` first): **fails immediately**,
  before `dsd check symbols` or `mwldarm` ever run —

  ```
  [ERROR] No symbol found for relocation from 0x021cabb4 in overlay 11
          to 0x021d305f in overlay 11
  Error: Failed to delink 'src/overlay011/func_ov011_021caafc.c', see
         errors above
  ```

This is a *stronger* failure than the original mwldarm leg: `dsd
delink` validates every relocation site in the **original ROM's own
disassembly** against `symbols.txt`, independent of how my modified
consumer references the address. The original binary's own literal
pool at `0x021cabb4` still targets `0x021d305f`; removing the symbol
breaks delink unconditionally for any TU whose *original* code
references that address — which is exactly the "referenced from
elsewhere" property that makes a symbol a real composable-recipe
target in the first place. Confirms Leg 3 is structural, not an
artifact of one consumer's phrasing. Change reverted after confirming
the error; tree verified clean before proceeding (`git status
--porcelain` empty aside from the queue-claim marker).

### Verdict

**P-50 confirmed PERMANENT, evidence boundary closed at both legacy
tiers.** `codegen-walls.md` updated: the OBSERVED-NOT-CONFIRMED block
replaced with a CONFIRMED note citing the 3-tier sweep and the Leg 3
result; `alignment-wall-tu-composition-recipe.md` gets a short "wave 7
update" pointer. No candidates unlock (both outcomes were negative,
which is the point — see the brief's framing: a clean negative at both
tiers is worth more than a few extra carves).

## Part 2 — draining main, the largest remaining 4-aligned module

### Scoping

Re-derived the 2026-08-03 census's remaining pool by cross-referencing
every one of its 274 symbols against `config/eur/arm9/**/delinks.txt`
for a `complete` entry containing that address (not by filename
match — several already-shipped symbols live in composed/absorbed
files named after a different member of the same TU). Excluded the 9
P-50-declined misaligned-struct-arc symbols and `data_02101e7c`
(declined a 4th time in `cm-data-restock-check-2026-08-03.md` Part 2,
the census's own documented exception). Result: **265 shipped, 9 + 1
declined, 75 remaining**, grouped by module:

| module | remaining | bytes |
|---|---:|---:|
| **main** | **40** | **2,296** |
| ov006 | 6 | 352 |
| ov011 | 4 | 736 |
| ov009 | 4 | 104 |
| ov012 | 4 | 112 |
| ov016 | 4 | 64 |
| (13 more modules) | 1-2 each | ≤32 each |

`main` is the largest remaining group by a wide margin (5× the next
largest by symbol count), and every one of its 40 candidates is
already 4-aligned at both address and size — no ALIGNALL(2)
composition wall to work around, unlike the ov011 arc. Of the 40,
`data_02101e7c` is the already-declined exception (excluded above,
leaving **39**).

### Header cross-reference

Grepped every remaining symbol name across `src/` to find its
reader(s) before typing anything. Two categories emerged:

- **19 symbols already have a matched C reader** — field-access
  evidence available directly (extern declarations, indexing,
  memcpy-style calls). Two gave a real type: `data_020c6878` (`extern
  int data_020c6878[]`, indexed `[0,7)` by an already-shipped
  function) and `data_020be9c4` (`extern int data_020be9c4[]`, indexed
  by `OS_SPrintf`). The rest are opaque pointers passed whole into a
  resource-loader (`func_020211c8`) or a memcpy-style copy — no field
  layout to anchor a struct on.
- **20 symbols have only a `.s` (unmatched) reader** — no compiled-C
  evidence available without a full disassembly read. Shipped as
  opaque arrays per this project's standing convention for this case
  (e.g. `data_020b46a0`, "still opaque").

### The internal-relocation finding

Before typing anything as a plain byte blob, every candidate's own
byte range was checked against `config/eur/arm9/relocs.txt` for
relocations *sourced from inside* the candidate's own span (not just
relocations pointing *at* it). **19 of the 39 turned out to contain
one or more internal relocations** — i.e. they're not opaque data at
all, but arrays containing pointers to other `main` addresses (data or
code). Two of these are genuine function-pointer tables
(`data_020c35cc`, census `shape=fnptr_table`, verified — all 9 words
resolve to real `func_*` symbols; and `data_020be9c4`, census
`shape=struct` but 9/9 words are relocations to `data_020c6bxx`
addresses, a mislabeled case in the same family wave 6 caught 7 times
in `ov000`). `data_020be77c` and `data_020be9ac` (both census
`shape=struct`, both 100% pointer-density in their words) show the
same signature and are annotated accordingly, though not reclassified
in the census table itself this wave.

**This does not change how the bytes are shipped.** Every relocation
in this statically-linked ROM resolves to a fixed absolute address at
build time — there is no runtime relocation/ASLR. The real ROM bytes
at a pointer slot already *are* the resolved address value. Extracting
those bytes directly (`extract/eur/arm9/arm9.bin`, offset = addr −
`0x02000000`) and emitting them as a plain hex literal produces
byte-identical output to an equivalent `&symbol` expression, without
needing to resolve every target to a clean C name. Verified for all 19
pointer-bearing candidates: every relocated word's raw LE byte value
was cross-checked against `relocs.txt`'s own `to:` field — **zero
mismatches** across 98 relocated words. Each pointer word is still
annotated with its resolved target name (from `symbols.txt`) as a
comment, for whoever reads the file next.

### Two deferred findings

**`data_020c3e88`, not carved.** Its sole relocation site
(`func_020069f4`, `0x02006a30`/`0x02006a34`) loads two literal-pool
bases 4 bytes apart — `0x020c3e88` and `0x020c3e84` — and the function
indexes both as `pair_020c3e84_t data_020c3e84[i]` (`{int v; int w;}`,
8 bytes, already shipped as a 4-byte scalar at `data_020c3e84`).
`0x020c3e84 + offsetof(w)` = `0x020c3e88` exactly: the census's
"188-byte struct at `data_020c3e88`" is very likely a continuation of
the *same* logical array `dsd`'s boundary derivation split at a symbol
it discovered from a different literal-pool reference, not an
independent object. `data_020c3e84` (4 bytes) + `data_020c3e88` (188
bytes) = 192 = exactly 24 × 8-byte pairs — clean, but resolving the
true array length needs finding `func_020069f4`'s callers and their
`i` range, which is a genuinely open-ended dig outside this wave's
bounded scope. Carving `data_020c3e88` as an independent opaque blob
would still produce correct bytes (sha1 doesn't care about "true"
structure), but would bury this finding instead of documenting it —
left for a future wave armed with the caller-range analysis.

**`data_021023d8` (192 B) and `data_02102c44` (28 B), carved then
reverted — a known wall, not a new one.** Both are genuinely all-zero
across their full span (verified from real ROM bytes, not assumed).
First shipped as `unsigned int data_X[N] = {0, 0, ..., 0};`, both
passed a full clean-tree 3-region gate at that point in the session —
**but the SHA1 was wrong** (`cf898406…` vs expected `1da50df7…`), a
false pass traced to a genuine build race with a concurrently-running
worktree that happened to reproduce the *same* wrong hash on a second,
uncontended clean rebuild, which is what exposed this as deterministic
rather than transient. Root cause: `arm-none-eabi-objdump -t` on the
compiled `.o` showed both symbols landing in **`.bss`**, not `.data`
— mwcc silently reroutes an all-zero-initialized non-`const` global to
`.bss` regardless of declared section (`__attribute__((section(".data")))`
scratch-tested directly and does **not** override this, unlike the
alignment attribute case). `.bss` carries no file bytes, so both spans
vanished from the built ARM9 binary — confirmed via
`build/eur/build/arm9.bin` being exactly 220 bytes (192 + 28) shorter
than `extract/eur/arm9/arm9.bin`. This is [documented,
known behavior](../cluster-b-size-1-2-recipe.md#generalisation--recipe-also-drains-value0-size4-brief-155):
"all-zero scalars compile to `.bss`... The bundle recipe forces
non-zero content into the TU's `.data` section." The proven fix is
bundling with a non-zero neighbor — unavailable to either candidate
without rewriting an already-shipped adjacent TU (both span their
entire gap edge-to-edge), which is out of this wave's scope. Reverted
cleanly (`.c` file + `delinks.txt` entry removed); a future wave
carrying the neighbor-rewrite budget can apply the established recipe
directly. **Process note for future waves: check every candidate's
byte content against this known wall (all real bytes are literally
zero) before carving, not after — this wave found it the expensive
way, via a full gate cycle.**

### Result: 36 symbols shipped, 1,864 bytes

Per-symbol reconciliation table (every Size cell cross-checked against
the new `config/eur/arm9/delinks.txt` entry it produced — all 36
match exactly):

| Symbol | Address | Size (B) | Sec | Words | Ptr-words | File |
|---|---|---:|---|---:|---:|---|
| `data_020be77c` | `0x20be77c` | 24 | rodata | 6 | 6 | `src/main/data_020be77c.c` |
| `data_020be9ac` | `0x20be9ac` | 24 | rodata | 6 | 6 | `src/main/data_020be9ac.c` |
| `data_020be9c4` | `0x20be9c4` | 36 | rodata | 9 | 9 | `src/main/data_020be9c4.c` |
| `data_020c35cc` | `0x20c35cc` | 36 | rodata | 9 | 9 | `src/main/data_020c35cc.c` |
| `data_020c58b0` | `0x20c58b0` | 20 | data | 5 | 0 | `src/main/data/data_020c58b0.c` |
| `data_020c5994` | `0x20c5994` | 24 | data | 6 | 0 | `src/main/data/data_020c5994.c` |
| `data_020c59ac` | `0x20c59ac` | 20 | data | 5 | 0 | `src/main/data/data_020c59ac.c` |
| `data_020c6878` | `0x20c6878` | 28 | data | 7 | 0 | `src/main/data_020c6878.c` |
| `data_020c68fc` | `0x20c68fc` | 92 | data | 23 | 0 | `src/main/data/data_020c68fc.c` |
| `data_020c72f0` | `0x20c72f0` | 208 | data | 52 | 25 | `src/main/data/data_020c72f0.c` |
| `data_020cd040` | `0x20cd040` | 168 | data | 42 | 20 | `src/main/data/data_020cd040.c` |
| `data_020cd460` | `0x20cd460` | 40 | data | 10 | 4 | `src/main/data/data_020cd460.c` |
| `data_020ce380` | `0x20ce380` | 16 | data | 4 | 1 | `src/main/data/data_020ce380.c` |
| `data_020d0ef0` | `0x20d0ef0` | 16 | data | 4 | 1 | `src/main/data/data_020d0ef0.c` |
| `data_020e5c60` | `0x20e5c60` | 104 | data | 26 | 12 | `src/main/data/data_020e5c60.c` |
| `data_020f84e0` | `0x20f84e0` | 32 | data | 8 | 3 | `src/main/data/data_020f84e0.c` |
| `data_020f8700` | `0x20f8700` | 32 | data | 8 | 3 | `src/main/data/data_020f8700.c` |
| `data_020f87d8` | `0x20f87d8` | 24 | data | 6 | 2 | `src/main/data/data_020f87d8.c` |
| `data_020f8a40` | `0x20f8a40` | 32 | data | 8 | 3 | `src/main/data/data_020f8a40.c` |
| `data_020fb840` | `0x20fb840` | 32 | data | 8 | 3 | `src/main/data/data_020fb840.c` |
| `data_020fbd50` | `0x20fbd50` | 24 | data | 6 | 2 | `src/main/data/data_020fbd50.c` |
| `data_020fbe60` | `0x20fbe60` | 88 | data | 22 | 10 | `src/main/data/data_020fbe60.c` |
| `data_020fd470` | `0x20fd470` | 72 | data | 18 | 8 | `src/main/data/data_020fd470.c` |
| `data_020fda40` | `0x20fda40` | 32 | data | 8 | 3 | `src/main/data/data_020fda40.c` |
| `data_02100310` | `0x2100310` | 64 | data | 16 | 0 | `src/main/data/data_02100310.c` |
| `data_02100de0` | `0x2100de0` | 64 | data | 16 | 0 | `src/main/data/data_02100de0.c` |
| `data_02101e4c` | `0x2101e4c` | 24 | data | 6 | 0 | `src/main/data_02101e4c.c` |
| `data_02101f74` | `0x2101f74` | 64 | data | 16 | 0 | `src/main/data/data_02101f74.c` |
| `data_02102198` | `0x2102198` | 20 | data | 5 | 2 | `src/main/data/data_02102198.c` |
| `data_02102200` | `0x2102200` | 16 | data | 4 | 1 | `src/main/data/data_02102200.c` |
| `data_02102210` | `0x2102210` | 64 | data | 16 | 0 | `src/main/data/data_02102210.c` |
| `data_0210225c` | `0x210225c` | 36 | data | 9 | 0 | `src/main/data/data_0210225c.c` |
| `data_021022a4` | `0x21022a4` | 36 | data | 9 | 0 | `src/main/data_021022a4.c` |
| `data_0210268c` | `0x210268c` | 24 | data | 6 | 0 | `src/main/data/data_0210268c.c` |
| `data_02102718` | `0x2102718` | 76 | data | 19 | 5 | `src/main/data/data_02102718.c` |
| `data_02102764` | `0x2102764` | 152 | data | 38 | 10 | `src/main/data/data_02102764.c` |

### Metrics

```
Typed-array:   180,336 -> 182,200 bytes  (+1,864 B, 3.78% -> 3.81%)
Named-struct:   73,696 ->  73,696 bytes  (+0 B,     1.54% -> 1.54%)
```

Named-struct is unchanged by design — every carve this wave is a
`[const] {int,unsigned int} data_X[N]` array (no field-typed struct
survived the reader evidence), so all growth lands in Typed-array.

### Gate (verbatim)

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

Full verbatim per-region tail (`tools/gate3.py --scope all`, clean tree,
no concurrent worktree activity — verified twice, see the incident
note above for why the second run was necessary):

```
gx-spirit-caller_eur.nds: OK
[eur] SHA1 PASS

gx-spirit-caller_usa.nds: OK
[usa] SHA1 PASS

gx-spirit-caller_jpn.nds: OK
[jpn] SHA1 PASS
```

`python3.13 -m pytest -q tests`: 3248 passed, 13 skipped, 63 subtests
passed, 0 failed — full `==================== GATE PASS ====================`,
not just the 3 SHA1 lines (`docs/research/README.md` and
`docs/state-table.md` regenerated before this run, closing both
staleness checks the intermediate runs surfaced).

## Standing rules unchanged

Never hand-transcribe byte content; every word in every file above
came from a programmatic extraction of `extract/eur/arm9/arm9.bin`,
cross-checked against `relocs.txt` for relocated slots. `relocs.txt`
structural claims trusted as ground truth (dsd's own extraction from
the original ROM). `alignment-wall-tu-composition-recipe.md`'s
standing rule (compile every composed TU standalone before trusting
it) did not apply this wave — none of the 36 shipped candidates needed
TU composition with a differently-sized neighbor.
