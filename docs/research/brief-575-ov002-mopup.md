# Brief 575 — `ov002` mop-up

Date: 2026-07-15  
Branch: `claude/ov002-mopup-575`  
Source: `docs/research/campaign-analytics/post-ov002-runbook.md`, Wave 11

## Result

Wave 11 is fully drained in both regions. The prescribed dry-runs found no
remaining candidates, and the prescribed full runs confirmed the same state:

| Region | Dry-run candidates | Ships | Refuses | Verify failures | Gate failures | Deferred | Auto-commits |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| USA | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| JPN | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

Commands used the runbook's `ov002` scope and `--min-addr 0x021aa3c0`:

```text
python tools/batch_carve.py --version usa --overlay ov002 --srcdir src/usa/overlay002 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov002 --srcdir src/jpn/overlay002 --min-addr 0x021aa3c0 --batch 20 --limit 150
```

The runbook's `&&` separators were executed as separate commands because this
host's Windows PowerShell parser does not accept that separator syntax. The
commands and their order were otherwise unchanged. Both region delinks passed
before the carve checks. No bare `ninja` was run.

## Refuse ledger

There are no refused addresses to record: both zero-ship runs reported
`REFUSE 0`, with zero verify failures, gate failures, and deferred candidates.
The final state is therefore an empty ov002 residual population for USA and
JPN.

## Gate

Final gate: `python tools/gate3.py --no-tests` — passed (exit 0), including
the delink-dupe preflight and USA/JPN/EUR SHA-1 checks.
