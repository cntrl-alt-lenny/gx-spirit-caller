### decomper/medium-tier-wave

**Goal:** First medium-tier wave per brief 033's explicit pivot
recommendation. Match 6–12 individual medium-tier functions to
re-establish a working rhythm in fresh territory.

**Context:**

Brief 033 (PR #320) hit 18% yield on the cluster pool's last clean
candidate, with the cluster turning out to be brief 028's residue.
Decomper explicitly recommended pivoting to medium tier in the PR
body. Brain accepts.

The cluster pipeline served the easy tier well (briefs 020/022/024/
027/028/029/030/030-extend averaged ~75% yield, ~165 matches), but
remaining easy-tier targets are mostly:

- Cluster residues (brief 033's experience: 18% on the cleanest
  remaining cluster).
- Sub-floor matched=<10 clusters where template confidence is too
  thin.
- Solo leaves not in any cluster.

Medium tier (62 unmatched, 60.3% matched) is fresh territory. Top
candidates from `python tools/next_targets.py --version eur`:

```
| main   | 0x0207cbbc | 0x24 | func_0207cbbc | 36B, 2 named callees |
| ov011  | 0x021d2c64 | 0x28 | func_ov011_021d2c64 | 40B, 1 named callee |
| main   | 0x020a1e3c | 0x2c | func_020a1e3c | 44B, 2 named callees |
| main   | 0x0207b5f8 | 0x34 | func_0207b5f8 | 52B, 2 named callees |
| main   | 0x02091714 | 0x34 | func_02091714 | 52B, 2 named callees |
| main   | 0x0209d6f0 | 0x34 | func_0209d6f0 | 52B, 2 named callees |
| main   | 0x0209d724 | 0x34 | func_0209d724 | 52B, 2 named callees |
| ov000  | 0x021ac85c | 0x34 | func_ov000_021ac85c | 52B, 1 named callee |
```

These are bigger than easy-tier leaves (50–60B vs 8–28B) and have
1–2 already-named callees, meaning the call shape is partly known.
Closer to the brief 005 / 006 easy-tier-wave pattern than to the
brief 020+ cluster pipeline.

**Workflow:**

1. Pull the medium-tier candidate list (`python tools/next_targets
   .py --version eur`).
2. **For each target you pick, check `docs/research/codegen-walls.md`
   first** when the disassembly looks similar to a documented
   pattern. The C-1..C-8 coercible-with-knowledge bucket should
   accelerate by ~20% per brief 032's analysis.
3. Disassemble + read the target via `dsd dis` (or your usual
   workflow). For each, write a `.c` from-scratch when the shape is
   clear. `find_shape_templates` may still help if the target's
   opcode sequence matches a matched function elsewhere — try it on
   targets that *look* simple but resist a manual write.
4. Build, byte-compare, iterate.

**Scope:**

- Match 6–12 individual medium-tier functions.
- No cluster propagation in this brief (single-function focus).
- Pick from anywhere in the medium-tier `next_targets` list; prefer
  the top entries (smallest medium-tier sizes) for the first 3-4
  matches to establish rhythm.
- Standard rename / verification gate: `ninja rom` clean,
  `dsd check modules` 24/27, `check_match_invariants` no new
  error categories, `pr-tier-delta` matches the +N count.

**Non-scope:**

- ❌ Cluster pipeline territory (`find_pattern_clusters` ranking).
  If a target you pick happens to be in a cluster, fine — but
  don't intentionally re-pilot a previously-stuck cluster.
- ❌ Tools / libs / include / AGENTS.md / state.md / docs/research
  edits (cloud may pick those up separately).

**Success:**

- ≥ 6 byte-identical medium-tier matches.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - Each match's shape (one-line C-equivalent or shape-class).
  - Whether `docs/research/codegen-walls.md` patterns fired
    during the work and which.
  - Drops if any (with codegen-walls bucket attribution).
  - Read on whether medium tier feels qualitatively different
    from easy tier — useful signal for brief 035 / 036 scope.

**Branch:** `decomper/medium-tier-wave-1`

**After this brief lands:**

1. Brain refreshes state.md + writes brief 035 / 036 sized to the
   experience (could be a wave 2, could be a tooling brief if a
   pattern emerges).
2. Cluster yield track record gets a "medium tier wave 1" entry
   for context.
