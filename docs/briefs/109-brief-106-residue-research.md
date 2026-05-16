### cloud/brief-106-residue-research

**Goal:** Walls research on the 5 new wall candidates
brief 106 surfaced in its skip list. Brief 097 residue
classification just closed in brief 107; brief 106's
own skipped candidates form a fresh residue worth
classifying via the same methodology pipeline.

**Context — what brief 106 surfaced:**

Brief 106 PR #507 listed 5 skipped candidates (reg-
alloc-blocked or codegen-pattern-mismatched) that
didn't fit existing C-class recipes:

| Candidate | Pattern |
|---|---|
| `func_02037b34` | predicated vs early-return form mismatch (mwcc 2.0 chose predication where orig used early-return) |
| `func_02079ddc` | r1/r2 reg-alloc swap on indexed halfword load |
| `func_020326d4` | mwcc didn't split `ctx+0x1fc` intermediate |
| `func_020aac30` | push {r0-r3} arg-spill vs str-spill |
| `func_020338f8` | predication shape (carryover from brief 104) |

Brief 109 classifies each via codegen sweep per the
brief 084 / 088 / 099 / 100 / 103 / 105 / 107
methodology. Goal: ≥ 1 new C-N or P-N entry. Expected
NEGATIVE-finding rate: ~30% per the operational
baseline.

**Method:**

1. **Pattern clustering.** Look at the 5 candidates'
   asm signatures + see if any can be clustered into
   one wall family. If so, pick smallest single-wall
   exemplar from the cluster + run codegen sweep.

   Likely clusters:
   - `func_02037b34` + `func_020338f8`: both predication-
     shape mismatches. Possibly same wall family
     (different from P-9 which is mvnNE-write).
   - `func_02079ddc` + `func_020aac30`: both reg-alloc
     adjacent (swap vs spill). Different mechanisms but
     may share permuter-susceptibility.
   - `func_020326d4`: struct-offset intermediate
     splitting. Likely standalone.

2. **Codegen sweep per cluster.** 5-6 source variants ×
   15 SPs = ~75-90 compiles per cluster. Match the
   methodology pattern brief 099 / 100 / 103 / 107
   established.

3. **Try natural form FIRST** at default mwcc 2.0/sp1p5
   for each candidate before running the full sweep.
   6 consecutive NEGATIVE findings (briefs 100 / 102 /
   103 / 104 / 105 / 106) say ~30% of any classified
   candidate is over-classified.

4. **Classification:**
   - Byte-identical recovery → new **C-N** entry
     (numbered next available after C-27).
   - Close-but-not → **P-N** classification with asm
     discriminator.
   - All variants byte-diff → permanent for current
     source-form pipeline; permuter is the next-attempt
     path.

5. **Document in codegen-walls.md** per the entry
   template. Cross-reference brief 106's per-port table.

**Non-scope:**

- ❌ Applying any recipe — research only. Decomper
  applies in a future single-region wave.
- ❌ Permuter sweeps on the candidates (separate brief
  candidate, similar to brief 098 / 105).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- ≥ 1 new codegen-walls.md entry (C-N or P-N) for one
  of the 5 candidates' walls.
- Codegen sweep matrix attached.
- Cluster analysis documented (which candidates share
  the wall family, which are standalone).
- NEGATIVE findings flagged if any candidate byte-
  matches natural form.
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/brief-106-residue-research`

**Priority:** MEDIUM. Decomper brief 108 (C-27
application) is the higher-leverage immediate move.
Brief 109 runs in parallel; if recipes surface, future
single-region waves pick them up.

**After this brief lands:**

1. **Recipes found** → decomper applies in a future
   wave (brief 111+ candidate).
2. **P-N classifications** → brain's skip-list gains
   asm signatures. Permuter sweep brief queued as
   follow-up (brief 098 / 105 pattern).
3. **All NEGATIVE** → these candidates were
   over-classified by brief 106's funnel; flag for
   decomper to retry natural form when revisiting the
   same module.
4. **Methodology pipeline continues:** brief 109 hand-
   back surfaces the next residue layer; next
   methodology cycle.
