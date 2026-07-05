[//]: # (markdownlint-disable MD013)

# Brief 532 - main sibling-sweep (Pattern A1/B6) + safe-queue-v3 fallback

Branch: `claude/cmatch-main-532`

Scope: attempt the overlay sweep's method (match one family exemplar, then
sweep siblings using the same idiom) against `docs/research/data/VtableDispatchPatterns.md`
Pattern A1 (`+0xb6c` state-machine dispatch) and Pattern B6 (main struct
callback slots), specifically the "un-swept main" members those patterns
call out. Both turned out thin — documented below with concrete evidence —
so the wave fell back to the safe-queue-v3 grind per the brief's own
contingency instruction.

## Outcome

- **A1/B6 sibling-sweep candidates identified: 6** (2 for A1, 4 for B6)
- **A1/B6 candidates actually buildable: 0** — every single one resolved to
  either a nonexistent symbol, an already-confirmed-permanent GLOBAL_ASM
  wall, or (in two B6 cases) a raw `.s` that no longer even contains the
  `blx` the catalogue described.
- **Safe-queue-v3 fallback candidates attempted: 11** (ranks ~93-104 of the
  MAIN `LIKELY` block, continuing past brief 530's rank-92 stopping point)
- **EUR matches accepted: 0**
- **Avalanche-parked: 9**
- **Skipped without a build attempt (dossier confirms already-permanent
  `.s` wall): 2**

This is a **zero-match wave** — an honest, fully-investigated negative
result. Both halves of the brief (the pattern-sweep method and its
fallback) are reported in full below since the negative finding itself
narrows the campaign's remaining runway understanding.

## Part 1: Pattern A1/B6 sibling-sweep investigation

### Pattern A1 (`+0xb6c` state-machine dispatch) — dead end on main

The catalogue's own entry table only lists overlay entry functions; "main"
is mentioned only in prose ("Overlays using this pattern: ... plus arm9
main"), with no specific main address given. Investigation:

1. `grep -l "0xb6c" src/main/*.s` → exactly 2 hits:
   - `func_02000f84.s` — writes zero to `+0xb6c/+0xb70/+0xb74/+0xb78`
     (a state-reset helper, not a dispatcher). Its already-matched sibling
     `func_020057dc.c` does the identical reset shape for a different
     first field, confirming this is a "reset" family member, not the A1
     entry point itself.
   - `func_02012cc8.s` — genuinely reads `+0xb6c` as a state index, but
     dispatches via a **compare-chain** (`cmp r4,#0;beq...;cmp r4,#1;beq...`)
     to *inlined* code blocks, not the table-indexed `blx` the A1 pattern
     describes. This file's own header comment says it all: **"whole-function
     ship-as-.s (GLOBAL_ASM endgame, brief 302)... reg-alloc-walled functions
     with no C match (brief 294 endgame)"** — already a confirmed permanent
     wall, and a huge one (500+ lines of disassembly).
2. Broadened the search to all 40 main files (`.s` + `.c`) referencing the
   underlying global (`data_021040ac`) regardless of exact offset, then
   filtered for `blx` presence: only 2 of the 23 still-unmatched files
   contain a `blx` at all, and **both are already the same confirmed
   GLOBAL_ASM-endgame permanent wall** (`func_02012cc8.s` above, and
   `func_020059b0.s` — a bsearch-with-callback helper, same brief-302/294
   marker).

**Conclusion: there is no unswept, table-indexed-`blx` A1 dispatcher on
main.** The doc's "plus arm9 main" claim maps to a real function
(`func_02012cc8`), but that function uses a different dispatch mechanism
(inline compare-chain, not table-`blx`) and was independently decided
unmatchable years before this brief.

### Pattern B6 (main struct-callback slots) — all 4 catalogued entries dead

The catalogue lists 4 file/offset pairs. Checked each against current
`config/eur/arm9/symbols.txt`:

| Catalogue entry | Current state |
|---|---|
| `func_02021278.s` (r5+0xc, `blx r1`) | **Address doesn't exist as a function start** — it's mid-body inside `func_020211c8` (0x020211c8-0x0202112cc). Read the real `.s`: **zero `blx` instructions anywhere** in the function (all calls are `bl` to named symbols) — the catalogue entry appears to be stale/mistranscribed for this address. The containing function is also already a confirmed permanent GLOBAL_ASM wall (brief 302/294 marker). |
| `func_02022e90.s` (r5+0x30, `blx r1`) | Same story: address is mid-body inside `func_02022d54` (0x02022d54-0x02022ee4). Real `.s` has **zero `blx` instructions**. Also an already-confirmed permanent GLOBAL_ASM wall. |
| `func_02005e04.s` (r8+0xa48, `blx r3`) | **Does not exist in `symbols.txt` at all** — no function starts at this address currently. |
| `func_02005e20.s` (r8+0xa48, `blx r3`) | This one's real: `ldr r3,[r8,#0xa48]; ...; blx r3` is present exactly as catalogued. But it's **also** an already-confirmed permanent GLOBAL_ASM wall (brief 302/294 marker) — dossier-free, already decided. |

**Conclusion: 0 of 4 catalogued B6-on-main entries are live sweep
candidates.** Two never existed as matchable functions at their catalogued
address (stale doc or address-boundary drift since authoring), and the
other two are real but were already permanently parked by a much earlier
wave before this brief started. This appears to be a case of the pattern
catalogue itself going stale for the MAIN-specific rows — it was likely
accurate for overlays (per briefs 529/531's reported 89% hit rate mining
this same catalogue) but the main entries either predate the brief-294/302
GLOBAL_ASM endgame sweep or were never double-checked against it.

*(This "sibling-sweep on Pattern B doesn't behave like Pattern A" finding
appears consistent with independent investigation happening elsewhere in
the campaign around the same time — worth cross-referencing if a
Pattern-B-focused brief report exists alongside this one.)*

## Part 2: Safe-queue-v3 fallback grind (ranks ~93-104)

Continued from brief 530's stopping point (rank 92 / `02072444`, the last
main `LIKELY`-tier candidate that brief attempted).

### Matched candidates

None.

### Parked candidates

| Addr | Bucket | One-line reason |
|---|---|---|
| `02072544` | avalanche | Signed-short byte-swap (bswap16) compose for a 4-stage packet-field comparator; confirmed the dossier's own "permuter-class" prediction on the 3-temp interleave in the final 32-bit compose. |
| `02073fc8` | avalanche | BSD `in_cksum`-style internet checksum with htons folding; dual-loop (odd/even pointer parity) strength-reduction pattern. |
| `020778c4` | avalanche | BCD date/time field parser (`x*10+y` → `mla`); the `mla`-vs-`add+add<<shift` coin-flip the dossier flagged as compiler-internal. |
| `02077954` | avalanche | String-append-with-bound helper; `start` pointer must live in `lr` with only `{lr}` pushed — a callee-saved-register-count coin-flip. |
| `02078dcc` | avalanche | RC4 PRGA (stream generation) inner loop; confirmed the dossier's own prediction that mwcc won't reproduce the exact `i`-in-lr/`j`-in-ip register pinning. |
| `02078e3c` | avalanche | RC4 KSA (key schedule) — sibling of `02078dcc`, same S-box layout. Applied the dossier's own documented fix (`int zero = 0; kp = zero;` to force a register-move encoding over an immediate-move for the keypos-wrap) — still avalanched. |
| `02079b48` | avalanche | Big-integer subtract-with-borrow over u16 limbs (`goto`-based early-exit to a shared tail). |
| `02079cc0` | avalanche | Big-integer add-with-carry — twin of `02079b48` (dossier explicitly calls these out as a pair); avalanched identically. |
| `0207cff4` | avalanche | Intrusive doubly-linked-list unlink with an offset-indexed `Link` substructure; confirmed the dossier's own prediction that mixed index/immediate addressing (`ldr [r1,ip]` vs `ldr [r0,#0xa]`) won't come from clean C pointer arithmetic. |
| `0207ef90` | avalanche | Cell-array range-guard + 4-way strided halfword store (32-byte stride, part of a 3-function "Cell" family with `0207ec68`/`0207f05c`). |
| `020801ac` | avalanche | 3-mode lookup (linear/table/binary-search) returning a u16; binary-search midpoint's signed-divide-by-8-of-pointer-difference shift chain didn't reproduce, exactly as the dossier predicted. |

### Skipped without a build attempt

| Addr | Reason |
|---|---|
| `0207b18c` | Dossier states directly: *"Already shipped as `src/main/func_0207b18c.s` — the `.s` is byte-exact and covers this function. Do not attempt a C replacement."* |
| `0207e0a8` | Dossier states directly: *"this function is already shipped as `.s`... The `.s` ship is the endgame for this function."* |

## Takeaways for the next main-lane wave

1. **The VtableDispatchPatterns.md catalogue is stale for MAIN specifically.**
   Its overlay rows have a strong track record (89% hit rate reported in
   briefs 529/531), but none of its 6 main-tagged entries (2 A1, 4 B6) survive
   contact with current ground truth. Before trusting a catalogue entry
   against main again, check the address still resolves to a function start
   in `symbols.txt` and that the file still contains the described
   instruction, not just that the file name matches.
2. **The remaining main `LIKELY`-tier queue (post-rank-104) looks
   floor-dominated.** Eleven attempts spanning genuinely different shapes
   (checksums, BCD parsing, both RC4 phases, linked-list unlink, binary
   search, bitfield packing) all avalanched, and two more were already
   pre-decided permanent walls. Combined with brief 530's own findings, the
   main-module MED/LIKELY tier is thinning out fast — a future wave might
   get better yield surveying a fresh queue section (ranks 105-119, ~15
   candidates) before assuming this exhausts the lane, but should budget for
   a continued low hit rate.
3. Grep for the brief-294/302 GLOBAL_ASM-endgame marker comment
   (`"whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302)"`) before
   spending a build cycle on ANY main candidate whose dossier references a
   `.s` file directly — this wave hit it 4 separate times (2 in the A1/B6
   investigation, 2 in the fallback grind) before learning to check for it
   first.

## Verification

No matches this wave means no ports were needed, but all 3 regions were
re-verified clean regardless (no source changes were made — every candidate
attempt was fully reverted via `git checkout HEAD --` + `delinks.txt` line
reset after its containment check — so this confirms the revert discipline
held, not that anything new was fixed):

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```
