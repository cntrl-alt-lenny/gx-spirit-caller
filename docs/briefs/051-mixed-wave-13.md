### decomper/mixed-wave-13

**Goal:** Mixed-tier wave. Pull from cloud's PR #363 remaining
cluster-rescan candidates (4 clusters didn't get covered in
wave 12) plus continue hard-tier ≤ 0x28 work. Decomper picks the
balance per disassembly.

**Context:**

Brief 049's three-PR chain (waves 10/11/12) shipped **34 matches
at ~87% combined yield**, with wave 12 confirming cloud's "easy-
tier reopened" finding empirically. Easy tier 81.7% → 82.7%
(+11), hard tier matches stayed at 1.9% because all 11 of wave
12's matches reclassified to easy.

State after self-extend exhaustion:
- Easy: 82.7% (192 unmatched, of which ~99 sit in propagation-
  eligible clusters per PR #363)
- Hard: 1.9% (8198 unmatched, ≤0x28 cap working)
- Cloud's PR #363 surfaced 15 individual targets; wave 12 took 11
  from 6 clusters. **4 clusters from PR #363's list remain**.

**Targets:**

1. **Cloud's 4 remaining cluster anchors** (priority — already
   vetted as homogeneous-shape):
   See `docs/research/cluster-rescan-post-w10.md` (or whatever
   cloud named the rescan note) for the full table. Wave 12 took
   `func_0201ed28`, `func_02000cb4`, `func_0200add8`,
   `func_02006e1c`, `func_020057c8`, `func_020071a4`. The other 4
   are still open; pick the one(s) with highest matched-template
   ratio first.

2. **Fresh hard-tier ≤ 0x28 candidates** to fill out the wave —
   if cloud's 4 clusters yield <6 matches, top up from
   `next_targets.py`'s hard section.

3. **Apply wave 12 wall observations** in source-shape iteration:
   - **C-2 refinement** (struct-copy form for two-field copies —
     wave 12 PR's finding 1). Watch for this on multi-field copy
     shapes.
   - **mvn vs sub peephole** for `-1` immediates. Provisional
     wall; brief 052 cloud territory if it surfaces.
   - **ov004 BSS layout shift** — skip ov004 candidates this
     wave; brief 052 investigates.

**Workflow:**

Standard. find_shape_templates corpus is now ~325+ functions; the
2 fully-clean clusters from cloud's rescan should compound
strongly.

**Scope:**

- Match 6–10 functions across cloud's surfaced clusters + fresh
  hard-tier mix.
- Standard rename / verification gate.
- PR body documents:
  - Per-target source: which cloud-rescan cluster (if applicable),
    routing tier, shape.
  - New walls if any (flag for brief 052 / 053 cloud).
  - Read on whether the easy-tier reopen feels like it has more
    runway or whether 4 clusters is the residue.

**Non-scope:**

- ❌ ov004 candidates (brief 052 BSS-shift research territory).
- ❌ Tools / libs / include / AGENTS.md / state.md / docs/research
  edits.
- ❌ Hard-tier candidates > 0x28.

**Success:**

- ≥ 6 byte-identical matches.
- All matches verified locally + `pr-tier-delta` green.

**Branch:** `decomper/mixed-wave-13`

## Self-extend clause

If yield ≥ 60%, decomper may file up to **2** follow-up waves
without a fresh brief. Same selection rule. Stop after 2 OR if
both eligible pools (cloud's remaining + hard-tier <0x28) drain
below 6 viable per wave.

After this brief lands, brain re-scopes — possibly toward USA/JPN
bootstrap or a tooling investment if the eligible pool runs thin.
