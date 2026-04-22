### decomper/ov011-tail-wrappers

**Goal:** Match the two ov011 tail-call wrappers `func_ov011_021ce324`
and `func_ov011_021ce334` at 100% objdiff. They're both 0x10 bytes
(ARM), both do nothing but zero one register and tail-call the next
function in the chain. Briefed together because the first tail-calls
the second — matching them as a pair keeps the call graph consistent.

**Context:**

- Brief 007 (`func_ov000_021ac550`) shipped cleanly in PR #85 and
  proved the "one small function, one PR" cadence still works after
  the long easy-tier wave. Brief 008 continues that small-bites
  cadence.
- Codex-decomper scouted this pair on 2026-04-21 and flagged both as
  safe, with the caveat that they should be briefed together and that
  the signature has to stay "loose" since the ultimate callee
  (`func_ov011_021ce190`, 0x194 bytes) hasn't been matched yet.
- Shape from the scouting report:
  - `func_ov011_021ce324` (0x10, ARM) — sets `r1 = 0`, tail-calls
    `func_ov011_021ce334`.
  - `func_ov011_021ce334` (0x10, ARM) — sets `r2 = 0`, tail-calls
    `func_ov011_021ce190`.
- ov011 is a passing module (not in the `{main, dtcm, ov004}` failing
  set). Any wave must keep `dsd check modules` at 24/27 OK.

**Suggested C shape (hypothesis — let objdiff decide):**

```c
/* func_ov011_021ce324: zero r1 and tail-call func_ov011_021ce334.
 *
 *     mov r1, #0
 *     b   func_ov011_021ce334
 */

extern void func_ov011_021ce334(int r0, int r1, int r2);

void func_ov011_021ce324(int r0) {
    func_ov011_021ce334(r0, 0, 0);  /* r2 is don't-care; mwcc may drop */
}
```

```c
/* func_ov011_021ce334: zero r2 and tail-call func_ov011_021ce190.
 *
 *     mov r2, #0
 *     b   func_ov011_021ce190
 */

extern void func_ov011_021ce190(int r0, int r1, int r2);

void func_ov011_021ce334(int r0, int r1) {
    func_ov011_021ce190(r0, r1, 0);
}
```

Keep signatures generic (`int` for unknown-purpose args). If objdiff
reports an argument-count or signedness drift, widen/narrow as needed
rather than reverse-engineering the deep callee. The scouting report
explicitly says "safe if the signature is kept loose."

**Scope:**

- `src/overlay011/ov011_021ce324.c` — new file, one function.
- `src/overlay011/ov011_021ce334.c` — new file, one function.
- `config/eur/arm9/overlays/ov011/delinks.txt` — two new `complete`
  TU entries (one per `.c` file). `tools/scaffold_batch.py` with
  `--apply-delinks` after dry-run is the easy way to get these blocks
  right.
- **Optional rename** — if during matching the signatures suggest a
  real name (e.g. both are call-gate wrappers for some specific
  system), rename via `tools/rename_symbol.py`. Otherwise keep
  `func_ov011_*` placeholders; the call graph can be revisited later.

**Non-scope:**

- ❌ `func_ov011_021ce190` (0x194, size 404) — the deep callee. Too
  big for this brief and needs its own analysis pass.
- ❌ Any `__sinit_*` outlier (`__sinit_ov002_022ca7e8`, etc.) — those
  are brief 009's territory.
- ❌ Failing modules (`main`, `dtcm`, `ov004`).
- ❌ `tools/`, `libs/`, `include/`, `AGENTS.md`, `docs/state.md`.
- ❌ Other ov011 easy-tier leaves — brief 010+ can sweep those if
  momentum holds.

**Success:**

- Both `func_ov011_021ce324` and `func_ov011_021ce334` at 100%
  objdiff.
- `ninja rom && ./dsd.exe check modules -c config/eur/arm9/config.yaml`
  still reports **24/27 OK** (ov011 must stay green).
- `python tools/check_match_invariants.py --version eur` exits 0;
  warnings are fine if they're the known placeholder-name category.
- `python tools/progress.py --version eur` ticks up by 32 bytes
  (0x10 + 0x10).
- One PR, both functions in it. Include the verification output in
  the PR body.

**Branch:** `decomper/ov011-tail-wrappers`.

**After this brief lands:**

1. **Brief 009** candidate: the safer sinit outlier
   `__sinit_ov002_022ca7e8` (0x18, ov002). Per Codex-decomper's
   earlier scouting: "just loads `data_ov002_022d11bc`, stores
   `data_ov002_022cc4f4` at `+0x1f8`, and returns. The only wrinkle
   is getting mwcc to keep the `.init` placement and literal-load/store
   order." Trickier than brief 008, but closes the sinit tier further.
2. **Brief 010** candidate: second ov011 tail-wrapper sibling pair
   `__sinit_ov010_021b89a8` / `__sinit_ov010_021b89f0` (two 0x48 shapes
   sharing the same ctor-register-dtor pattern; r4 must survive across
   calls). A natural step up in difficulty.
3. After these land, the brain should consider whether to keep
   scoping briefs one-pair-at-a-time (like 008) or return to wide
   sweeps (like 006). Likely depends on how the sinit outliers go.
