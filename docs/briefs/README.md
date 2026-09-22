# Brief lifecycle

A brief moves through five states. The state is written on the brief itself as a
`Status:` line, and is also encoded in which directory the file sits in — so
"what is in flight?" is answered by listing a directory, not by reading
carefully.

| Status | Lives in | Means |
|---|---|---|
| `queued` | `active.md` | Written, not started. |
| `active` | `active.md` | Being executed now. |
| `delivered` | `delivered/` | Execution finished and the work exists. **Not reviewed, not accepted.** |
| `accepted` | `archive/` | Reviewed, adjudicated, merged. |
| `rejected` | `archive/` | Adjudicated and not merged. Kept — rejected rounds are the more informative half of this directory. |

## Naming

```
<NNN>-<YYYY-MM-DD>-<slug>.md
```

Zero-padded sequence number first, then the date, then a short slug. The number
is the primary sort key and never changes as the file moves.

## Two rules that are easy to break

- **`archive/` means adjudicated.** Never park a delivered-but-unreviewed round
  there to free up the active slot. A cold session listing `archive/` would count
  it as finished.
- **Never queue a brief whose correctness depends on an unadjudicated round.**
  Rescope, or wait.

## Archiving honestly

Archive the brief **as it was actually received**. If it was amended mid-round,
append the amendment rather than editing the original text — a brief silently
improved after the fact is useless as evidence about how the round really went.
The outcome is appended when it moves to `archive/`.
