[//]: # (markdownlint-disable MD013 MD041)

# Brief 319 — ov000 co-drain wave 2

**Brief:** 319 (scaffolder, co-drain). Continue the ov000 stream from wave 1
(brief 317). Branch `scaffolder/ov000-wave2` off latest main. Per-pick gate =
**EUR objdiff 100%** (direct-mwcc); the brain runs the 3-region SHA1 on merge.
Own `src/overlay000/`, the ov000 `delinks.txt`, and `ov000_core.h` —
collision-free vs the decomper (on ov004). Target ~10–15 picks; flag thinning.

## Headline

**13 shipped (all `.c`), all EUR objdiff 100%**, all drop out of a clean ov000
re-delink, and **EUR `ninja sha1` PASSES** with the wave applied. ov000 matched
`.c`: 23 → **36**.

**The cohort is NOT thinning.** Wave 2 (13) actually *beat* wave 1 (11) — once
the right recipes were in hand. What changed: wave 1's "near-misses" were mostly
**one-lever** misses (a field's signedness, a folded pool offset, a tail-merge),
and this wave turned each lever into a reusable recipe. The clean-C vein in
ov000 is still healthy; what genuinely walls is a narrow, well-characterised set
(below).

## The 13 picks

| shape / family | funcs |
|---|---|
| config-field predicate (`&&` / `\|\|` / nibble `!=`) | `021af378` · `021af47c` · `021ac834` |
| MMIO switch (engines `0x04000000`/`0x04001000`) | `021ab8b4` (clear [7:6]) · `021ab474` (set [15:13]) |
| active-object store / set-params (`*021c73e0`) | `021aaa20` (two V3 triples) · `021aa7e0` (facing + status) |
| 16-bit bitfield RMW counter/clamp | `021abfbc` (dec-if-nonzero) · `021abfec` (add-margin + clamp) |
| sub-display refresh orchestrator | `021ad3e8` |
| guarded multi-call orchestrator (5-arg stack call) | `021aca28` |
| status-notify (facing switch, both arms notify) | `021ae654` |
| strlen (NULL-safe, signed char) | `021ac7dc` |

(`021ad3e8`, `021ab8b4`, `021ac7dc`, `021af378` landed early in the session;
the remaining nine came from a systematic sweep of the unexamined `<0x100`
cohort.)

## Recipes banked (the levers behind the 13)

Each of these started as a 1-instruction near-miss and is now a repeatable move
(also captured in `ov000_core.h` §VERIFIED):

1. **Offset-member, not pointer-cast.** To reproduce `ldr [base,#off]` (the orig
   pools the base *symbol*), read the field as a struct **member** at that
   offset — `((struct{char pad[N]; T f;}*)base)->f` — never `*(T*)(base+N)`,
   which folds `N` into the pool constant and loads at offset 0. (`021ac834`:
   10v10 → match.)
2. **Unsigned bitfield → `lsr`, signed → `asr`.** A lone `asr`/`lsr` diff on a
   field read is just the field's declared signedness. (`021abfec`, `021ae654`,
   `021aca28` — each a single-instruction fix.)
3. **Positive-constant pool vs `mvn`.** `field = 0xffff` into a *signed* short
   collapses to `mvn r,#0` (−1); into an *unsigned* field mwcc materialises the
   positive `0x0000ffff` via a pool load. Match the orig by making the field
   unsigned. (`021aa7e0`: 23v24 → match.)
4. **`switch` prevents tail-merge.** Identical-body `if/else` branches get
   tail-merged and tail-called by mwcc (and the selector read dropped); a
   `switch` evaluates the selector and keeps the duplicated bodies + a frame.
   (`021ae654`: 7v18 if/else → 18v18 switch → match.)
5. **Chained-address struct.** When the orig computes `addr2 = addr1 + k`
   (chained) rather than both from the base, model both destinations as fields
   of **one** struct based at the lower address. (`021aaa20`: 14v14 → match.)
6. **5-arg stack layout.** A 5th argument lands at `sp+0` (outgoing-arg area,
   bottom of frame); locals stack above it, last-declared lowest. Declaring
   `a[36]` then `b[20]` puts `b@sp+4`, `a@sp+24` — right first try.
   (`021aca28`.)
7. **`(short)` cast** forces a dead `lsl#16;asr#16` ahead of a 4-bit bitfield
   write that a plain `short` parameter would skip. (`021aa7e0`.)
8. **16-bit bitfield RMW** (`unsigned c:16; unsigned:16`): `if(c)c--` and
   `c += b` emit the orig's load/mask/recombine (the `0xffff0000` mask built via
   `mov#0x10000; rsb`). (`021abfbc`, `021abfec`.)

## What genuinely walls (the real "remainder", not thinning)

After 36 matched across two waves the `<0x100` residue is dominated by four
well-understood classes — none of which is "ran out of functions":

1. **stride-44 bitfield-PACK family** (`021c7530` rows + the `021c7588`/`758c`
   region packs: `021ab5d8`, `021ab62c`, `021aed38`, `021af560`, `021ab6ec`,
   `021ab740`, …). Multiple `bic`/`and`/`orr` field inserts per function; the
   insert *order* mwcc emits does not flip from C (the wave-1 near-miss,
   re-confirmed). **→ ship-as-`.s`** (one `asm_escape.py --whole-function` pass
   clears the cluster).
2. **`021ab850` register-numbering near-miss** — 25v25, structurally perfect
   (the `(f-2)<=1u` range lowering and load-once pattern both reproduced), but
   the orig assigns the loaded value to `r0` / the pointer to `r1` and the
   allocator will not reorder from C.
3. **`021aa840` CSE near-miss** — 21v22; mwcc hoists the `obj+256` base that the
   orig recomputes inside each branch.
4. **Complex orchestrators** `021ae218` / `021adc50` / `021ad540` — nested
   goto-tail control flow and many-stack-arg pass-through calls. Matchable, but
   each is a dedicated RE job (wave-3 tier, not a sweep pick).

One oddity logged: `021ac810` (0x24) computes `([021c758c+4] & ~0xf) | ((arg<<12)&0xf)`
— the inserted term is identically 0 and the argument is dead; left unmatched as
a likely source artifact rather than spend cycles reproducing it.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-pick) | **13/13 byte-identical** |
| clean re-delink drop-out (disasm-header scan) | **13/13** out of the ov000 gap objects |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| overlay-swap aliasing (gotcha 18) | still clear — picks are all in the ov000-only range, no ov002 collision, no dotted aliases |
| ov000 `delinks.txt` | 36 `complete .text` blocks (23 prior + 13; matched-set subtracted, overlap 0) |
| `ruff` / `tests/` / `check_match_invariants` | clean / pass / 0 errors |

`src/overlay000/` gains 13 `.c`; `ov000_core.h` gains the §VERIFIED wave-2 block
(structs, sink signatures, the 8 recipes, the wall list). EUR ov000
`delinks.txt` +13 `complete`. No tool / USA / JPN change.

## Recommendation for the brain

1. **Keep the scaffolder on ov000 for wave 3 — it is not mined out.** The
   clean-C sweep tier still yields (13 this wave). Wave 3 should pick up the
   **orchestrator tier** (`021ae218`, `021adc50`, `021ad540` and siblings) as
   dedicated RE — they recover more main-arm9 sink signatures, which compounds.
2. **Run one `asm_escape.py --whole-function` pass on the stride-44
   bitfield-PACK family** (`021c7530` + the `021c7588`/`758c` region packs,
   ~7+ members). The insert-order wall is confirmed across `|=` / `=a|b` / `b|a`
   / explicit masking and two waves — it is `.s` territory, and one pass clears
   the cluster the same way the ov002/ov006 tails were closed.
3. ov000 remains **bitfield-dense**, but wave 2 shows the density is *tractable*
   for reads/predicates/RMW; only the multi-field *packs* wall. The pivot to a
   fresh clean-C overlay (ov008, per brief-300's ov004 > ov000 > ov008 ranking)
   can wait until the ov000 orchestrator tier + `.s` pack pass are done.

## Cross-references

- `docs/research/brief-317-ov000-wave1-drain.md` — wave-1 footing (globals,
  struct map, the first 11 picks, the stride-44 near-miss this wave re-confirms).
- `docs/research/brief-300-ov006-premap.md` — the cross-overlay reachability
  ranking (ov004 > ov000 > ov008) behind the overlay choice.
- `src/overlay000/ov000_core.h` — the byte-proven ov000 globals / struct map /
  sink signatures / recipes (§VERIFIED wave-2 block added here).
