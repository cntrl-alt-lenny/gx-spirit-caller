# Cascade-3 dry-run — brief 016 Task_InvokeLocked cluster

_Generated 2026-04-24 by `cloud` on brain's request after `#190`
(`tools/cascade_apply.py`) landed. Preview of what brief 016's
PR would look like if invoked against the Option A scouting from
[`cascade-3-scouting.md`](cascade-3-scouting.md) (Task_InvokeLocked
cluster)._

This doc is a **dry-run only** — no `symbols.txt` changes. It
demonstrates the scout → decide → apply → verify pipeline
end-to-end using real data, and surfaces one piece of intel that
the scouting-time snapshot missed.

## Intel the dry-run surfaced

**`func_020067fc` (the #1 candidate in #175's scouting, score 0.42 with
36 shared callers) has already been renamed** to `Task_PostLocked`
in a post-#175 wave. `cascade_apply.py`'s atomic validation caught
this via `old` name not-found:

```
❌ Validation failed: 1 problem(s). No files written.
  [main|0x020067fc] 'func_020067fc' → 'Task_InvokeUnlocked':
    `old` 'func_020067fc' not found in any symbols.txt
```

The #175 scouting snapshot is now stale by one rename. The
cluster has evolved from 7 placeholders to 6 — but the reveal
is more useful than that: the **naming convention** is now
concrete. Named symbols at the cluster addresses:

| Addr | Name | Source |
|---|---|---|
| `0x02006870` | `Task_InvokeLocked` | PR #165 (cascade-2 wave) |
| `0x020067fc` | `Task_PostLocked` | post-#175 wave |

So the `Task_*Locked` / `Task_*` pairing is real. Siblings in the
remaining 6 are likely the **non-Locked** counterparts + task-
creation primitives.

## Proposed decisions file (4 of 6 remaining candidates)

I picked 4 of the 6 remaining siblings — the ones with the strongest
signal from the scouting table. The other 2 (`0x02005d0c` and
`0x020068b4`, both 0.38 score / 0x48 / 0 shared callers) are
cold — no caller-graph evidence — and deserve individual
disassembly inspection before any naming commit.

```json
{
  "brief": "016",
  "anchor": "Task_InvokeLocked",
  "source_scouting": "docs/research/cascade-3-scouting.md",
  "renames": [
    {
      "module": "main",
      "addr": "0x020069f4",
      "old": "func_020069f4",
      "new": "Task_Invoke",
      "rationale": "0.40 / exact 0x44 size match with Task_InvokeLocked / adjacent — likely the non-locked variant"
    },
    {
      "module": "main",
      "addr": "0x020062cc",
      "old": "func_020062cc",
      "new": "Task_Post",
      "rationale": "0.39 / 0x48 / 1 shared caller — non-locked counterpart to Task_PostLocked"
    },
    {
      "module": "main",
      "addr": "0x02005c60",
      "old": "func_02005c60",
      "new": "Task_Create",
      "rationale": "0.39 / 0x40 / 1 shared caller — task initialiser"
    },
    {
      "module": "main",
      "addr": "0x020058b4",
      "old": "func_020058b4",
      "new": "Task_Init",
      "rationale": "0.39 / 0x3c / 4 shared callers — higher shared-caller count than Create suggests a more fundamental init"
    }
  ]
}
```

**These names are proposals, not commitments.** The decomper
verifies against disassembly — the `Task_*` shape matches the
established convention, but exact role assignments (Invoke vs
Post, Create vs Init) depend on function bodies.

## `cascade_apply.py` dry-run output

Running against the decisions file above:

```
$ python tools/cascade_apply.py /tmp/brief-016-taskfamily.json

✔ Dry-run: 4 rename(s) would apply cleanly.

Commit-message template:

cascade wave (brief 016): 4 renames around `Task_InvokeLocked`

Anchor: `Task_InvokeLocked`. Source: `docs/research/cascade-3-scouting.md`.

## Renames

| Module | Addr | Old | New | Rationale |
|--------|------|-----|-----|-----------|
| `main` | `0x020069f4` | `func_020069f4` | `Task_Invoke` | 0.40 / exact 0x44 size match ... |
| `main` | `0x020062cc` | `func_020062cc` | `Task_Post` | 0.39 / 0x48 / 1 shared caller ... |
| `main` | `0x02005c60` | `func_02005c60` | `Task_Create` | 0.39 / 0x40 / 1 shared caller ... |
| `main` | `0x020058b4` | `func_020058b4` | `Task_Init` | 0.39 / 0x3c / 4 shared callers ... |

## Test plan

- [ ] `./dsd check modules` — baseline preserved
- [ ] `python tools/check_match_invariants.py --version eur` — 0 errors (clean cross-file drift)
- [ ] `python tools/find_cascades.py --version eur` — measure downstream `hard → medium` promotions from this wave
- [ ] `ninja rom` clean
```

The emitted template is commit-ready. The decomper's actual flow
after reading this doc:

1. Open `docs/research/cascade-3-scouting.md` to confirm the cluster
2. Pull current `config/eur` state (candidates may have moved)
3. Read the disassembly for each candidate (via
   `tools/scratch_bundle.py main <addr>`)
4. Edit the proposed names in the decisions JSON to match what the
   disassembly supports
5. Run `cascade_apply.py <file>` — dry-run catches any remaining
   stale-data issues
6. Run `cascade_apply.py <file> --confirm` to apply
7. Pipe the emitted template into `git commit -m "$(...)"`
8. Match the functions (byte-identical), mark TUs complete, push
   under `decomper/brief-016-taskfamily`

## Expected cascade impact

`find_cascades.py --version eur` before the wave (run against
current main): Task_InvokeLocked shows up as one of the named
anchors driving the post-#165 cascade. Its siblings, once named,
should each contribute to further `hard → medium` promotions —
the cascade model is proven by the cascade-2 wave's 85-promotion
result from 4 renames.

Rough expectation for brief 016 (4 renames): **20-40 downstream
tier promotions** based on the per-rename average from #165
(~20/rename). Actual number reported by the PR's
`cascades-diff.yml` comment after merge.

## Follow-ups after brief 016

- **Inspect the 2 cold siblings** (`0x02005d0c` + `0x020068b4`)
  individually. Size + adjacency-only signal; no caller
  overlap. Might or might not be task-family.
- **Re-run `tools/bulk_rename_candidates.py main 0x02006870`**
  after the wave lands. The newly-named Task_Invoke / Task_Post /
  Task_Create / Task_Init callees will surface further
  second-order siblings via the
  `nitro_suggest_renames.py` token-overlap signal (PR #134).
- **Re-run `tools/find_cascades.py`** to see how the wave shifts
  the rank order. Each rename matches + cascade typically
  reshuffles the top-20.

## Why publish this dry-run as a doc

Three reasons:

1. **Stale-scouting signal** — the #175 doc would've misled a
   decomper opening it cold. This one's footnote surfaces the
   `Task_PostLocked` rename that already happened and narrows
   the actual candidate set.
2. **Pipeline validation** — proves `cascade_apply.py` (#190) +
   `check_match_invariants.py` drift check (#185) + the workflow
   render (#196) all compose as intended on real data.
3. **Worked example** — cascade-pipeline docs in
   `docs/decomp-workflow.md` reference this as the canonical end-
   to-end example.

## Cross-refs

- `docs/research/cascade-3-scouting.md` — scouting that produced
  this candidate list (PR #175)
- `tools/bulk_rename_candidates.py` — the scoring used (PR #153)
- `tools/cascade_apply.py` — the tool demonstrated (PR #190)
- `tools/find_cascades.py` — the cascade model (PR #132)
- PR #165 — cascade-2 wave that established the 85-promotion
  baseline this wave targets
- `docs/decomp-workflow.md § The rename-cascade pipeline` — the
  prose walkthrough of the same flow (PR #193)
