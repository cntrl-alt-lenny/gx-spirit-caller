# Brief 511 — dossier-guided MED wave 4

Date: 2026-07-01  
Branch: `decomper/c-match-med-511`  
PR: #1071

## Summary

Used the dossier-guided MED loop with per-object resolved checks before SHA gates.
The full `ninja report` path was avoided; per-object `.resolved` diffs were regenerated
fresh for each candidate before acceptance.

- Attempted: 17 candidates
- Matched in EUR: 7
- Ported and gated in USA: 6
- Ported and gated in JPN: 6
- EUR-only match with region ports deferred: 1
- Parked: 10
- Yield: 7 / 17 attempted = 41.2% EUR
- Match rate: about 2 funcs/hour over the match-commit window; lower including final gates/reporting.

## Confirmed matches

| EUR | USA | JPN | Notes |
|---|---|---|---|
| `0201d0b0` | `0201d05c` | `0201d05c` | Guard reshape; resolved 0-diff and SHA OK in all regions. |
| `02022608` | `020225b4` | `020225b4` | Bound guard/base locals up front to preserve register shape. |
| `0202e270` | `0202e21c` | `0202e21c` | Corrected stale dossier membership cases from assembly ground truth. |
| `02035ff4` | `02035fa4` | `02035fa4` | Corrected inverted dossier branch; decrement path is `hi != 0`. |
| `020364c4` | `02036474` | `02036474` | Short-circuit OR plus declaration-order reshape for entry/count registers. |
| `0201bc3c` | deferred | deferred | EUR matched; USA/JPN raw overlay-init BL words do not match ordinary C call relocations. |
| `020452c4` | `02045274` | `02045274` | Dossier case constants were stale; rebuilt switch from assembly table and reordered case bodies. |

## Parked / deferred

| Candidate | Reason |
|---|---|
| `020142b4` | Large low-confidence truncated dispatch; triaged only. |
| `0201a5c0` | Permuter-class const-hoist / loop scheduling; SHA rejected earlier stale-resolved acceptance. |
| `02018a84` | Permuter-class shift-pair / bitfield extract; SHA rejected earlier stale-resolved acceptance. |
| `0201904c` | Saturating low-half add; literals correct but register allocation and mask/sum rotation diverged. |
| `02022540` | Free-slot scan; compiler strength-reduced loop into byte-offset induction variable. |
| `02025880` | Leaf bit extraction; null path if-converted and temp registers swapped. |
| `02000d0c` | Store-order sibling; remained at two load instructions swapped. |
| `02036590` | Reached 3-instruction scheduling wall after local-order reshape; `cmp match,#0` hoisted before entry load. |
| `020480b4` | Guard collapse (`cmpne`) persisted after explicit-label reshape. |
| `02034a84` | Cold tail branch-vs-predicate plus register choice divergence; matches dossier permuter-class warning. |

Deferred ports:

- `0201bc3c` EUR is accepted, but USA/JPN ports were reverted. The region originals use raw `.word` BL encodings into ov007 init code; ordinary C calls resolve differently under the linker, and per-object resolved diff plus SHA rejected the ports.

## Cluster / dossier findings

- No multi-member clone cluster was cracked in this wave.
- The resolved-check upgrade paid off: stale dossier ground truth was caught for `0202e270` and `020452c4` before SHA acceptance.
- Per-object resolved files must be deleted/regenerated before comparing; stale `.resolved` artifacts can otherwise hide Mode A/B failures.

## Final gates

Final gates were run after all committed changes:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

## Remaining runway

Current dossiered MED runway still appears broad:

- Remaining unmatched MED candidates with dossiers: 372
- Remaining high-confidence MED candidates with dossiers: 4 (`0202a1cc`, `02034a84`, `020480b4`, `021b3e6c`)

The remaining high-confidence list is partly deceptive: two (`02034a84`, `020480b4`) were parked here for compiler scheduling/predicate behavior. The productive path for the next wave is likely either `0202a1cc` / `021b3e6c` first, or medium-confidence candidates with very explicit ground-truth tables/callees.
