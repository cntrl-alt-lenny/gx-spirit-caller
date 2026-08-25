# Ledger chronology audit

**Status:** build-free audit, 2026-08-24. The companion tool is
`tools/audit_ledger_contradictions.py`.

## Ordering rule

`attempts.tsv` is an event log, so file order is not event chronology. For
backfilled briefs matching `PR#<number>:<sha>`, the PR number is the ordering
key. A repeated group with a ship/park conflict is `CONTRADICTORY` only when
all rows have distinct, usable provenance and the ordered events really put a
park after a ship. If provenance cannot establish the sequence, the result is
`AMBIGUOUS` rather than a guessed contradiction.

The live audit is reproducible with:

```text
python tools/audit_ledger_contradictions.py
```

On this snapshot it reports 50 `LEGITIMATE`, 0 `CONTRADICTORY`, and 7
`AMBIGUOUS` repeated groups. These are output observations, not test
contracts; rerun the command after ledger changes.

The two reported false positives now resolve as legitimate park-then-ship
sequences because their park rows carry the lower PR number:

| group | park PR | ship PR | result |
| --- | ---: | ---: | --- |
| `main/0x02033b60` | 1414 | 1435 | `LEGITIMATE` |
| `ov002/0x021b34f4` | 1414 | 1425 | `LEGITIMATE` |

`ov007/0x021b2e00` is also `LEGITIMATE`: its same-brief parked row is marked
`tool-anomaly`, followed by a shipped row. That is consistent with an
infrastructure retry, not two competing wall judgements.

## Timestamp recommendation

A future append-safe UTC event-timestamp column would be worthwhile for
same-brief retries and non-backfilled history, but it should be added only
through the established writer paths with blanks for historical rows. This
change does not add one: the available PR provenance fixes the demonstrated
false positives, while an invented timestamp would create a stronger-looking
but unsupported chronology for old rows.
