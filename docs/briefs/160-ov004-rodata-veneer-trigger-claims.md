### decomper/ov004-rodata-veneer-trigger-claims

**Goal:** First production use of brief 159 Part 2's reverse-
lookup tool. Pick 3-5 high-reference ov004 `.rodata` slots
from `docs/research/ov004-rodata-pointer-targets.md`, claim
each as a Pattern 1 `.c`, observe whether the veneer count
drops by 1 per claim. This validates **path 2** (orthogonal-
to-byte-coherence veneer-trigger identification) with real
source changes and unlocks scaled drain if it works.

**Context — what brief 159 + 156 established:**

Brief 159 Part 2 (PR #590) shipped
`tools/find_ov004_rodata_pointer_targets.py` which enumerates
the ov002→ov004 `.rodata` pointer graph: **4001 cross-overlay
references across 219 distinct ov004 slots**. Top references:

| ov004 slot | Refs |
|---|---:|
| `data_ov004_021e2b15` | 363 |
| `data_ov004_021ff0b4` | 360 |
| `data_ov004_021e26a5` | 344 |
| `data_ov004_02201943` | 328 |
| `data_ov004_021ded69` | 319 |
| `data_ov004_021e2efc` | 153 (brief 154 known-fail) |

Brief 156 spot-disasm found that **byte coherence ≠ SHA1
safety** (lcf re-emission for `function(arm, unknown)` shifts
downstream bytes). Brief 159's empirical observation:
`data_ov004_021e2efc` has BOTH byte coherence AND 153 cross-
overlay refs, yet kind-flipping it broke SHA1. The two
signals together still aren't sufficient.

**Path 2 hypothesis** (this brief tests): source-claiming an
ov004 `.rodata` slot (as `.data` — i.e., Pattern 1 `.c`) —
**WITHOUT** changing its kind in `symbols.txt` — should drop
mwldarm's veneer count by 1 per claim, per the brief 141 /
147 empirical model. This is the safer move than path 1
(reclassification) because the symbol stays `data`-kinded —
no lcf re-emission shift.

**Brief 160 deliverables:**

### Part 1 — Pick 3-5 candidates

From `docs/research/ov004-rodata-pointer-targets.md`'s top-
referenced slots:

1. Pick 3-5 slots with the HIGHEST reference counts (363,
   360, 344, etc.), EXCLUDING `data_ov004_021e2efc` (brief
   154 known-broken).
2. For each candidate, inspect:
   - The slot's bytes at `extract/eur/arm9/arm9_ov004.bin`
     (offset = slot_VA - 0x021de638). Confirm it has byte
     content (not all zero — those need cluster B bundle
     recipe).
   - The slot's size (next-symbol offset or padding boundary).
   - Any pre-existing source claim in
     `src/overlay004/data/`.

### Part 2 — Per-slot claim + SHA1 round-trip

For each picked slot, **one at a time** (do NOT batch — the
per-claim SHA1 gate is the experiment):

1. Generate Pattern 1 `.c`:

   ```c
   const unsigned char data_ov004_<addr>[N] = {0xAA, 0xBB, ...};
   ```

   Bytes copied from the orig binary; size = the slot's size
   per Part 1's inspection.
2. Add TU claim to `config/eur/arm9/overlays/ov004/delinks.txt`.
3. Run 3-region `ninja sha1`. Record:
   - **PASS** → claim sticks. Observe the patcher's "veneers
     spliced" line — did `n` drop by 1?
   - **FAIL** → revert the claim. Document the failure
     pattern (byte content shape, byte-diff pattern from
     `cmp -l`).

### Part 3 — Report

Add a new section to
`docs/research/ov004-rodata-pointer-targets.md` (or sibling
note) capturing per-candidate results:

| Slot | Refs | bytes | Claim outcome | Veneer drop |
|---|---:|---|---|:---:|
| `data_ov004_021e2b15` | 363 | … | PASS / FAIL | yes / no |

If ≥ 3 candidates PASS with veneer drop, **path 2 is
validated** and brain scopes a scale-up wave (brief 162+
decomper) to drain dozens of high-reference slots.

If 0 PASS or veneer count doesn't drop, **path 2 is
falsified** for this hypothesis shape — brain scopes a
follow-up that investigates why (e.g., maybe the reloc kind
matters, or the slot needs to be claimed as `.text` not
`.data`, or the suppression mechanism is more nuanced than
the brief 141 model).

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS for all kept claims
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
```

If even ONE of the kept claims (i.e., not reverted) drops
EUR SHA1, the PR doesn't merge.

**Non-scope:**

- ❌ Reclassifying symbols in `symbols.txt` (that's path 1;
  separate cautious brief).
- ❌ Touching `tools/` (cloud's territory; brief 161 fixes
  the subsumed-ref collision in parallel).
- ❌ Bulk-claiming all 219 slots (this brief is a controlled
  experiment; scale-up is brief 162+ after path-2 validation).
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- 3-5 high-reference slots tried.
- Per-candidate result documented (PASS+drop / PASS+no-drop /
  FAIL+reverted).
- 3-region `ninja sha1` PASS preserved for all KEPT claims
  (failures reverted).
- New section in research note documenting outcomes.
- Brain has empirical data to scope brief 162+ scale-up.

**Branch:** `decomper/ov004-rodata-veneer-trigger-claims`

**Priority:** HIGH. First empirical test of path 2; outcome
determines whether the brief 159 reverse-lookup tool unlocks
substantial ov004 `.rodata` drain or whether we pivot.

**After this brief lands:**

1. Brain reads the per-candidate report; decides:
   - **If path 2 validates** (≥3 PASS with veneer drop):
     brief 162 = scale-up wave claiming dozens more high-
     reference slots.
   - **If path 2 partially validates** (some PASS some FAIL):
     brain scopes refined heuristic brief.
   - **If path 2 fails**: pivot to path 1 (cautious
     reclassification with per-candidate SHA1 gate per brief
     156 hand-off) OR to mega-array work (30 KB main).
2. If brief 161 has landed, brief 158-deferred candidates
   (`data_02101928` etc.) become unblocked for a separate
   D-3 wave 3 brief.
