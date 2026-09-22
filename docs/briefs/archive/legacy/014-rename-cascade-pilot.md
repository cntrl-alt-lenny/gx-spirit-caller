### decomper/rename-cascade-pilot

**Goal:** Match + rename ONE of three high-leverage easy-tier leaves
identified by `tools/find_cascades.py` (PR #132). The match itself
is brief-001-shaped trivial work; the payoff is **cascade promotion
of 20-39 callers to `medium` tier** from a single rename, validating
the find_cascades signal end-to-end and seeding the first wave of
rename-cascade work that the project has been circling for three
rounds of suggester analysis.

**Context:**

- `tools/find_cascades.py` ranks placeholder symbols by how many
  size-≤0x80 callers they'd promote `hard → medium` if named. Full
  analysis: `build/eur/analysis/cascades.md` (run the tool to
  regenerate).
- Round-3 `nitro_suggest_renames` analysis
  (`docs/research/nitro-rename-suggestions-round3.md`) showed 0
  HIGH hits in the scanned corpus: the scorer has a structural
  ceiling at score 4 with 0.1% signal coverage. Cascade-leverage
  picking is the complementary signal — we don't need a HIGH-
  confidence name suggestion to get the cascade benefit; any real
  name (even just a descriptive one from reading the
  disassembly) fires the cascade rule.
- PR #136 already consumed some cascade value: the decomper
  matched 6 forwarders around `func_02018b28` as easy-tier work.
  But `func_02018b28` **itself** is still placeholder-named, so
  the cascade it blocks remains pending.

**Targets (pick ONE; all three are easy-tier leaves):**

| # | Module | Addr | Size | Cascade | Callers | Caller modules |
|---|--------|------|-----:|--------:|--------:|---------------:|
| 1 | `main` | `0x02018b28` | 0xc | **39** | 189 | 6 |
| 2 | `main` | `0x020944c0` | 0x14 | **25** | 168 | 17 |
| 3 | `main` | `0x02006e1c` | 0xc | 8 | 151 | **21** |

All three are classified `easy` tier (leaf + size ≤ 0x20), so the
match itself is at the trivial end of the spectrum — typically a
single `ldr`/`bx lr` or `mov`/`bx lr` pair.

**Why cascade, not direct match-count, is the headline:**

All three would be picked up by a normal easy-tier sweep and
matched in one round. The thing that makes THEM special is the
cascade: naming any of them promotes many hard-tier callers to
medium tier, which in turn unblocks the next round of
`next_targets.py`'s worklist.

Pick rationale (rank 1 is the obvious choice):

1. **`func_02018b28`** — highest cascade weight (39). Already
   validated indirectly by #136 matching its neighbours. 189
   callers is a lot; the function is a singleton state accessor
   of some kind (leaf, no data refs, 12 bytes pure code). Best
   all-round pick.

2. **`func_020944c0`** — second-highest cascade (25), and
   **17 distinct caller modules** — the widest fan-out of any
   top-cascade hit. Strong signal for a fundamental SDK-shaped
   function (likely a flag/state getter used project-wide).
   Alternative pick if you want to validate that the cascade
   model scales across overlays, not just within `main`.

3. **`func_02006e1c`** — lower cascade (8) but **21 caller
   modules** (max observed in the corpus). Also interesting
   because it's the only one with a data load (loads
   `func_02006870`, a 0x44-byte main function — suggests this
   might be a thunk/forwarder rather than a pure getter).

**Process:**

1. Match the target function (size ≤ 0x20 leaf → brief-001 /
   brief-005 shape).
2. Rename in `config/eur/arm9/symbols.txt` to whatever the
   disassembly supports semantically. If the name isn't obvious,
   a descriptive `GetGlobalState` / `GetFlagN` / similar is fine —
   the cascade doesn't care about the exact name, just about the
   placeholder → real transition.
3. Run `python tools/find_cascades.py --version eur main <addr>`
   (single-symbol mode) to confirm the expected cascade count
   pre-rename.
4. Run `python tools/next_targets.py --version eur --no-outputs`
   after the rename and confirm the `medium` tier count goes
   up by approximately the predicted cascade weight.

**Scope:**

- `src/main/<target>.c` — the matched C source
- `config/eur/arm9/symbols.txt` — one rename
- `config/eur/arm9/delinks.txt` — one `complete` marker

**Non-scope:**

- The other two targets — they stay for follow-up briefs (brief
  014b? 015?). Bundling all three would dilute the "one-rename-
  measurable-cascade" validation this brief is about.
- Renames in overlays. All three targets live in `main`; keep the
  brief tight on that surface.
- Any disassembly of the cascade callers. They promote to `medium`
  on their own once the rename lands; matching them is future
  work (next round of `next_targets.py`).

**Success:**

- Target function reports 100% in objdiff against the baserom.
- `dsd check modules` stays at the expected baseline (24/27 OK).
- `python tools/next_targets.py --version eur --no-outputs` shows
  the `medium` tier count grew by ≥ (cascade weight − 2). The −2
  margin accounts for edge cases where a caller had *another*
  placeholder callee blocking (not captured in the cascade
  prediction).
- `check_match_invariants` reports 0 errors.
- The new CI workflow from PR #144 renders the per-rename cascade
  impact in the PR comment — this brief is the first live test of
  that comment shape on a real PR.

**Why this brief is different from briefs 005/006/011:**

- Brief 005/006/011 were bulk waves: match N similar functions in
  a cluster, drain the backlog. Optimize for match-count throughput.
- Brief 014 is a **single-function precision strike**: match ONE
  high-leverage placeholder and watch the cascade fire. Optimize
  for tier-promotion leverage per match. Validates the
  find_cascades signal that cloud has been building towards.

Pair with `tools/find_cascades.py` (PR #132),
`docs/research/nitro-rename-suggestions-round3.md` (PR #142 seed),
and the round-2 seed doc for the broader context on why this is
scoped as a single rename rather than a wave.

**Branch:** `decomper/rename-cascade-pilot`
