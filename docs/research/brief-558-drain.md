# Brief 558 — USA/JPN `ov002` drain and post-`ov002` sweep

Date: 2026-07-12  
Branch: `claude/usajpn-drain-558`

## Result

`ov002` is DRAINED: yes.

| Lane | Shipped | Refuse | Verify/gate failures | Zero-ship confirmation |
| --- | ---: | ---: | ---: | --- |
| USA `ov002` | 107 | 0 | 0 | yes |
| JPN `ov002` | 223 | 0 | 0 | yes |

The USA run completed in six green auto-committed batches. JPN completed in
the two bounded passes required by `--limit 150`, for twelve green batches in
total. One `C-absorbed, base+offset-recoverable` candidate was reported as
absorbed-routed in each regional drain and shipped successfully.

### `ov002` floor ledger

No candidates remained refused at the zero-ship confirmations. Floor
addresses: none.

## Post-`ov002` sweep

Commands were copied from `docs/research/campaign-analytics/post-ov002-runbook.md`
with `python` substituted for `python3.13`; per-module minimum addresses were
kept exactly as specified.

| Wave | USA shipped | JPN shipped | Result |
| --- | ---: | ---: | --- |
| Wave 1 — `ov000`, `--min-addr 0x021aa3c0` | 85 | 85 | done |
| Wave 2 — `ov008`, `--min-addr 0x021aa3c0` | 71 | 71 | done |

All four sweep runs were clean: zero refusals, verification failures, gate
failures, and deferred candidates.

## Gates

- `python tools/configure.py usa && ninja delink`: passed.
- `python tools/configure.py jpn && ninja delink`: passed.
- `python tools/gate3.py --no-tests`: passed for EUR, USA, and JPN.

All `batch_carve.py` batches used `--batch 20`, ran their internal `ninja
sha1` gate, and auto-committed only green batches.
