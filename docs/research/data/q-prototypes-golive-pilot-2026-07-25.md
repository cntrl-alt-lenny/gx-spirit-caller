# q-prototypes-golive-pilot — go-live pilot report (2026-07-25)

## Question

The prototype bank (`include/game/prototypes.h`, 3,793 evidence-only
signatures per `gen_prototypes.collect_evidence_backed_signatures()`,
`check_prototypes_provenance.py` 0 mismatches, `audit_callsite_arity.py`
0 unresolved contradictions) is included by **zero** translation units.
The measured prize is a 50.2% wrong-extern rate in matched TUs — but
that payoff stays entirely theoretical until something actually
`#include`s the header. Does swapping a TU's inline `extern`
declarations for the bank's `#include "game/prototypes.h"` change a
single compiled byte, anywhere, ever?

## Method

1. Enumerate every banked function's defining source file
   (`sig["source"]` from `collect_evidence_backed_signatures()`) — the
   HARD CONSTRAINT (r11-verified): a TU that defines any banked
   function cannot include the header at all (its own real,
   non-void*-normalized signature would conflict with the header's
   void*-normalized `extern` for the same symbol — a redefinition
   error). This set has 3,752 files.
2. Scan every non-ported EUR-relevant `.c`/`.legacy.c`/`.legacy_sp3.c`/
   `.thumb.c` file under `src/` (`src/usa/`, `src/jpn/` excluded —
   region ports re-derive the same source, not independent evidence,
   same exclusion `gen_prototypes.py`/`audit_callsite_arity.py`
   already apply) for `extern <type> <name>(<args>);` declarations
   naming a banked function, **excluding any file in the defining set
   above**.
3. Pick 6 of the resulting pool for structural diversity — not the
   report's own illustrative wrong-extern examples (see "A wrinkle"
   below for why those turned out to be ineligible) — swap the
   targeted externs for `#include "game/prototypes.h"`, rebuild, and
   verify byte-for-byte per TU before moving to the next.

## A wrinkle: the illustrative wrong-extern examples aren't eligible pilots

`docs/research/data/khdays-callsite-arity-report-2026-07-25.md` names
two concrete wrong-extern examples: the 8-file `func_ov006_021ba1f0`
"constant-one predicate" family and the 3-file `func_020190c0` family.
Neither's caller files are actually eligible pilots: e.g.
`src/overlay006/func_ov006_021b2804.c` calls `func_ov006_021ba1f0`
with a wrong 1-arg extern, but **that same file also DEFINES
`func_ov006_021b2804`** — itself a banked function — so it's a
"definer TU" with respect to a *different* banked function and is
correctly excluded by the hard constraint. This is not a one-off: in
this codebase's one-function-per-file convention, a file that calls
sibling functions overwhelmingly also defines its own (usually banked)
function. Of 2,640 raw "file contains an extern naming a banked
function" hits, only **45 hits across 32 distinct files** survive the
definer exclusion — the eligible pool is far narrower than the raw
wrong-extern count suggests, purely because of file structure, not
because the correction itself is unsafe.

## Eligible pool: 32 TUs

| Tier | Files |
|---|---|
| plain `.c` | 27 |
| `.legacy.c` | 4 |
| `.legacy_sp3.c` | 1 |
| `.thumb.c` | 0 |

Of the 45 individual extern hits across those 32 files: 25 declare an
arity that disagrees with the bank (all traceable to the same
byte-safe-wrong-extern pattern `audit_callsite_arity.py` already
catalogued), 20 already match the bank exactly.

## The 6 pilots

All verified via `python tools/fastmatch.py eur <file> --gap
<absolute path to build/eur/delinks/src/.../X.o>` (function-containing
files) or an incremental `ninja sha1` (data-only files, which
`fastmatch.py` can't check — it reports `WARNING — no functions in
compiled .o` and exits 2 for those). Final confirmation:
`python tools/gate3.py --scope all` — **3-region SHA1 PASS (EUR/USA/
JPN), pytest 3017 passed / 16 pre-existing skips, 0 regressions.**

1. **`src/main/data_02102360.c`** (plain, main) — 8-entry function-
   pointer table, 1 banked entry (`func_02085864`, address-of only,
   never called). `ninja sha1`: OK.
2. **`src/main/Entry.c`** (plain, main) — the CRT entrypoint, `asm
   void` body. 3 externs already matched the bank exactly
   (`func_020b41bc`, `func_02000b64`, `main`) — the "trivial swap"
   baseline case. `ninja sha1`: OK.
3. **`src/overlay010/sinit_ov010_021b89a8.c`** (plain, overlay010) —
   `asm void` sinit constructor, 3 banked externs at once (2
   mismatched, 1 matching) referenced only via `bl`/`ldr =` inside the
   asm body. `ninja sha1`: OK.
4. **`src/overlay021/data_ov021_021ac9e0.c`** (plain, overlay021) — an
   80-entry function-pointer/data table; 5 of the 80 externs are
   banked (all mismatched, all address-of only), interleaved among 75
   untouched non-banked `extern char` data externs — a test of
   surgical-precision editing as much as codegen. `ninja sha1`: OK.
5. **`src/main/func_0208f850.legacy.c`** (`.legacy.c`, main) — a real
   C body with a real call site: `u8 *p = Vram_GetBankBaseE(a);`. See
   "The one real discovery" below. `fastmatch.py`: 100.0%.
6. **`src/main/func_0208f920.legacy.c`** (`.legacy.c`, main) — sibling
   of #5 (`Vram_GetBankBaseCD`), same pattern, confirms it's not a
   one-off. `fastmatch.py`: 100.0%.

No `.thumb.c` file is currently eligible (zero exist in the pool), so
that tier is untested here — noted as a gap, not a finding.

## The one real discovery

Pilots 5 and 6 are the only two with a genuine C-level call site (not
just address-of or asm-referenced) to a banked function whose bank
arity is 0 but whose local extern claims 1 (`extern u8
*Vram_GetBankBaseE(void *a);` vs. the bank's `extern void *
Vram_GetBankBaseE(void);`). Swapping *only* the extern for the
`#include` — without touching the call site — is a **hard compile
error**, not a silent byte change:

```
src\main\func_0208f850.legacy.c:11: function call 'Vram_GetBankBaseE(void *)'
src\main\func_0208f850.legacy.c:11: does not match
src\main\func_0208f850.legacy.c:11: 'Vram_GetBankBaseE()'
```

mwcc's explicit `(void)` parameter list (not an empty, unspecified
`()`) makes argument-count checking strict — passing an argument a
`(void)`-declared function doesn't accept is rejected outright. This
is a *better* failure mode than a silent byte change: it fails loudly,
at compile time, for exactly the TUs that need a call-site fix, and
never for the ones that don't.

The fix is the same one `audit_callsite_arity.py`'s own `classify()`
already establishes as correct: drop the now-provably-unused argument
(`Vram_GetBankBaseE(a)` → `Vram_GetBankBaseE()`), matching the real
callee's true 0-arg signature. Both pilots compiled clean and matched
100.0% after this one-line fix — the caller's own first parameter `a`
was already sitting in the ABI register the (wrong) 1-arg call would
have used, so dropping the now-explicit non-argument required zero
instruction changes. This won't generalize to every such case by
construction (a different register-allocation situation could easily
make it NOT byte-neutral) — it's a confirmed instance, not a proof for
the whole 25-mismatch pool.

## Eligible-TU count

**32** distinct caller-only (non-definer) TUs currently carry at least
one inline extern for a banked function project-wide, EUR baseline
(region ports excluded as non-independent). All 32 are individually
enumerable via the recon method above (not committed as a tool here —
a one-off count, not a recurring need until mass-conversion is
scheduled).

## Go / no-go recommendation

**GO for a careful, TU-by-TU or small-batch rollout. NOT a blind
find-replace.**

- 6/6 pilots (100%) reached byte-identical output across a
  deliberately diverse sample: pure data/fnptr tables (small and
  large, single and multi-symbol), `asm void`-bodied consumers (sinit
  constructor, CRT entrypoint), and real C call sites requiring a
  call-site correction — spanning `plain` and `.legacy.c` tiers, 3
  modules (main, overlay010, overlay021).
- Zero instances of a SILENT byte change. The one nontrivial case
  failed LOUDLY at compile time instead, which is the safe failure
  mode for an automated rollout — a script that mass-applies the swap
  and treats a compile failure as "needs manual attention" (rather
  than something that could ship broken) is sound.
- The real ceiling isn't codegen risk, it's the definer-TU exclusion:
  most single-function-per-file TUs in this codebase also define a
  banked function, so **any mass-conversion script must check each
  candidate file against `collect_evidence_backed_signatures()`'s own
  `source` set before touching it** — never assume "calls a banked
  function" implies "safe to include."
- Recommended mechanical recipe for a future mass-conversion pass:
  1. Build the defining-file set from `collect_evidence_backed_signatures()`.
  2. For each non-defining `.c`/`.legacy*.c`/`.thumb.c` file, find
     `extern` lines naming a banked function.
  3. Remove those lines, add `#include "game/prototypes.h"` once per
     file.
  4. Compile. A compile error naming an arg-count mismatch means a
     real call site needs its (extra, provably-unused) argument
     dropped — apply that fix, not a workaround.
  5. Verify byte-identity per TU (`fastmatch.py --gap` for
     function-containing files; batch `ninja sha1` for data-only
     files) before keeping the change.
  6. Never touch a file in the defining set.
- Not attempted here, left for the mass-conversion step itself: wiring
  the 33-contradiction list from `audit_callsite_arity.py` directly as
  the initial work list, since those are exactly the pre-identified
  wrong-extern instances.
