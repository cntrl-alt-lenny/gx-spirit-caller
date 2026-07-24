# Brief 672 — continue the epilogue-wall-corpus sweep (queue item cm-epilogue-resweep-2)

**Result: 13/17 shipped (76.5%), 4 parked.** All 13 ported to USA + JPN,
individually verified 100%. 3-region `gate3.py --scope all --no-tests`
PASS. One pre-existing tooling bug fixed along the way (see below).

## Scope

The queue item's own text pointed at brief 655/661's tables and
`cmatch-parked-and-floor.md`. Per this session's own brief 668 finding
— the mechanical `epilogue-wall-corpus.md` census outperforms
prose near-miss catalogs by 62.5% vs 0% — this brief instead continued
working the SAME 205-row corpus brief 668 opened, picking up where it
left off: 24 rows attempted across briefs 668/670 (15 shipped + 9
parked from 668's own re-sweep, since brief 670 worked a size-range
that turned out not to overlap this corpus), 7 more found already
routed by other briefs since the census was taken (stale entries,
skipped), leaving 174 truly-still-`.s` rows. Worked the smallest 17 of
those, size-sorted (56–72 bytes).

## Tooling fix found first: EUR delinks.txt suffix drift from brief 668

Before any new work, PR #1303's CI (`pr-invariants (eur)`) surfaced 17
`missing_tu_source` errors — all 17 were brief 668's OWN shipped/parked
candidates. Root cause: brief 668's delinks.txt patch step wrote the
plain `.c` extension in the TU header line for all 17, instead of the
real `.legacy.c`/`.legacy_sp3.c` (14 shipped) or `.s` (3 parked,
should've reverted) suffix. `configure.py` resolves TUs by scanning the
actual file on disk, so the build was never affected (EUR SHA1 stayed
OK throughout) — but `check_match_invariants.py` reads the header
literally, so every PR since brief 668 merged has failed this CI check.
Fixed by patching all 17 header lines to match the real on-disk
filename; verified `check_match_invariants.py --version eur` now shows
0 `missing_tu_source` errors (only the pre-existing, unrelated
`cross_file_name_drift` remains — flagged as a separate task, not
touched here). USA/JPN never had this bug (their per-port delinks
entries were generated correctly by `port_to_region.py`).

## Ships (13)

- **`func_02087df4`** — double-indirect deref + table lookup:
  `inner->fn0(...)`-style pointer chase into a byte field, combined
  with a signed-halfword table lookup, forwarded to a callee.
- **`func_02046658`** — classic bitmask-from-byte-array accumulator
  (`for` loop, `mask |= 1 << arr[i]`).
- **`func_0207445c`** — 2-way dispatch on a global int being zero,
  calling one of two void functions. 0 parameters (the function's own
  incoming registers are never read).
- **`func_0207d494`** / **`func_0207dab4`** — sibling pair: normalize a
  size to a multiple of 4 (bump zero to one, round up, mask low bits),
  then dispatch to one of two callees by the sign of a third argument,
  negating it for the negative branch. `dab4` additionally offsets the
  pointer argument by `0x24` — the offset computation had to be hoisted
  into its own local variable, computed once before the branch, or the
  compiler duplicated it into both call sites (2 extra instructions,
  47% match) instead of computing it once (100%).
- **`func_020822f0`** — a post-indexed struct read
  (`int val = *p++;` idiom, where the incremented pointer is then
  itself passed to the callee as the second argument) followed by two
  independent `&= ~bit` clears on the same flags field, written as two
  separate statements (not combined into a single `&= ~3`) to match the
  target's two separate load/modify/store pairs.
- **`func_0206da98`** — the disassembly's own flag-variable shape had
  to be modeled literally, not simplified to a direct `||`: target
  initializes a flag to 1, conditionally overwrites it to
  `(val == 4)` only when the first branch of an if/else wasn't taken,
  then checks the flag separately. A direct `if (val==0 || val==4)`
  reshapes into completely different (wrong) code; the explicit
  two-step flag-then-check form matched immediately.
- **`func_020a60fc`** — `CpuSet` zero-fill call (SDK helper, signature
  from `libs/nitro/include/nitro/swi.h`) followed by a second call
  whose result is stored into a global struct field. 100% on the first
  attempt.
- **`func_0203c7d0`** — two independent calls to the same helper with
  different literal arguments; no control flow.
- **`func_0204bf00`** — triple-call chain with 2 early-return guards,
  each guard re-invoking the SAME accessor function fresh rather than
  caching its result — this project's established "re-fetch, don't
  cache" lever (first documented in brief 668 for `func_0204bd8c`,
  confirmed again here on a different function).
- **`func_02052674`** — store an incoming pointer into a global, call a
  helper with it, then write a fixed halfword constant at a fixed
  offset computed off the same global (re-read fresh afterward, not
  from a cached register).
- **`func_0206eb08`** — textbook 32-bit byte-swap (bswap) of a callee's
  return value, written as the standard 4-term shift/mask/or
  expression.
- **`func_02079ddc`** — bounds/flag check on a table lookup
  (`arr[idx-1] & 0x8000`) with an early `-1` return, otherwise
  forwarding the original unmodified arguments to a second call and
  boolifying its result.

Each ship verified 100% via `objdiff-cli diff --format json` before
staging; each ported to USA + JPN and re-verified 100% at the ported
address.

## Parked (4)

All 4 are logic-correct and got substantially closer than a first
attempt, but plateaued on pure register/instruction-order choices with
zero movement across every reshape tried — the project's established
reg-alloc-choice wall class (see `docs/research/codegen-walls.md`
P-4), not a modeling error:

- **`func_02087e54`** (73.3%) — double early-return guard on a
  dereferenced struct pointer, then a call with a pointer-into-struct
  argument. Sole residual: the cached pointer is allocated to r2 in
  mine, r3 in target. Tried caching in a local vs. direct repeated
  `p->inner` access — both landed on identical bytes.
- **`func_020490dc`** (72.2%, best of several variants) — a global
  pointer is null-checked, has a field zeroed, then (after an
  intervening call) two more fields are written, one of them a
  self-reference (`ptr->field = ptr`). Target keeps the ORIGINAL
  pre-call register value alive across the call without a stack
  spill, then does a completely fresh reload of the same global
  afterward for the other field — reusing the fresh reload for both
  remaining writes but the pre-call value only for the self-reference.
  Caching in a named local variable instead produces an r4 push/pop
  (the compiler spills to a callee-saved register rather than trusting
  the value survives the call); never referencing a local at all
  produces an extra reload with a wrong self-referential store
  address. Neither matches; this specific "value survives an external
  call in a scratch register, no spill" allocator behavior wasn't
  reproducible from any source shape tried.
- **`func_02063620`** (88.2%, up from 76.5%) — comparison chain
  boolifying a call's result. Explicit `if/else` (assigning to a
  named `int flag`) instead of a ternary fixed the SECOND boolify
  (`result == 0`) to 100%-match instantly, but the FIRST boolify
  (`field_c == 6`) kept emitting `movne`-then-`moveq` (reversed
  from source-textual order) regardless of testing `==` first,
  `!=` first, ternary, or if/else — apparently something about the
  value flowing into a subsequent function-call argument (rather than
  an immediate `return`) changes mwcc's predicated-move emission
  order independent of source polarity.
- **`func_0207d4dc`** (88.2%, up from 27.8%) — range/alignment check
  dispatching to a callee. The brief-655 "converge to one shared
  return" lever (combining two separate `if (...) return 0;`
  statements into one `||`-joined condition) fixed a real structural
  divergence (predicated-inline double-return vs. target's
  branch-to-shared-tail), and matching the observed addition operand
  order (`a1 + a0` not `a0 + a1`) fixed a second mismatch — the sole
  remaining residual is a pure r2-vs-r3 scratch-register choice for
  the `end - start` intermediate, insensitive to a named-local-variable
  reshape.

## Levers confirmed / new

- **Epilogue-wall-corpus census continues to outperform prose
  catalogs**, now over two briefs: 15/24 (62.5%, brief 668) then 13/17
  (76.5%, this brief) — 28/41 total (68.3%) from the same mechanical
  source, vs. 0/7 from the prose-catalog-sourced first attempts brief
  668 opened with.
- **Hoist a shared pointer/offset computation out of both branches of
  an if/else, or the compiler duplicates it** (`func_0207dab4`) —
  computing `p + 0x24` inline at each of two call sites produces two
  separate `add` instructions (one per branch); computing it once into
  a local before the branch produces the target's single shared
  computation. Directly analogous to (but distinct from) the
  established "converge branches to a shared *return*" lever — this is
  convergence of a shared *value*, not a shared exit point.
- **A disassembly's literal flag-variable shape can be load-bearing,
  not just a simplification target** (`func_0206da98`) — collapsing an
  explicit "initialize flag=1, conditionally overwrite it, check flag
  separately" sequence into a direct `||` expression compiles to
  entirely different code. When a near-miss involves a boolean that's
  computed then checked in a visibly separate step in the disassembly,
  model the flag variable literally before reaching for a boolean
  expression.
- **The brief-655 "shared return" convergence lever generalizes beyond
  its original discovery site** — confirmed again on `func_0207d4dc`,
  a genuinely different function shape (range-check dispatch, not the
  original's early-return-predication case).
- **Re-fetch, don't cache, continues to recur across unrelated
  functions** (`func_0204bf00`, `func_02052674`) — now confirmed on 4+
  distinct functions across 2 briefs (668, this one). Worth checking
  as a first hypothesis whenever a near-miss shows a register being
  reloaded from a global instead of reused, immediately after a call.

## Porting notes

9 of 13 ships resolved HIGH confidence in both USA and JPN. The other
4 (`func_02046658`, `func_020a60fc`, `func_02052674`, `func_02079ddc`)
resolved only MEDIUM ("size+ish match, no relocs to compare" — these
functions either have no external references at all, or the reference
pattern in their own body doesn't disambiguate cleanly between
same-size candidates), auto-promoted from a raw LOW guess via the
tool's neighbor-consensus-shift heuristic. Ported with
`--confidence-floor MEDIUM` and — per the brief-668 lesson that the
confidence floor alone doesn't catch every porting bug —
individually objdiff-verified every one of the 26 ports (13 USA + 13
JPN) against its own region's ground truth rather than trusting the
resolution or a clean gate: all 26 came back 100%. Notably, every one
of the 13 functions resolved to the identical target address in both
USA and JPN, consistent with this session's earlier observation
(brief 671) that USA and JPN share address layout in this region of
`main`.

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN), forced-clean rebuild. `check_delink_dupes.py` clean
throughout (81 delinks.txt, no duplicate `.text` addresses).
