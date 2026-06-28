# Brief 502 — C-match HIGH wave 3

**Branch:** `scaffolder/c-match-high-502`
**PR:** #1040 (draft → ready)
**Gate:** `configure.py <ver> && ninja sha1` — all three regions OK

## Outcome

- **25 new EUR HIGH C-matches** confirmed via sha1 gate
- **~25 USA/JPN ports** (3-region sha1 OK on all batches)
- **18 USA/JPN re-ports** of wave-2 EUR matches (Task 1, backfill)
- **4 parked** as un-forceable at `-O4,p`

## EUR confirmed matches

| Addr | Notes |
|------|-------|
| `02000e34` | |
| `02005b38` | |
| `020062cc` | |
| `0201ac1c` | |
| `0201b5d0` | |
| `0201b770` | |
| `0201d07c` | |
| `0201d0e8` | |
| `0201d428` | |
| `0201d4b4` | |
| `0201d530` | |
| `0201d910` | |
| `0201ed08` | |
| `0201f11c` | |
| `0201f1b8` | |
| `0201f68c` | |
| `020200d8` | |
| `020201b8` | |
| `020201ec` | |
| `02020880` | |
| `02020c94` | |
| `02021064` | |
| `020210b8` | |
| `0202147c` | hoist `q` before guard |
| `02027144` | |

## Parked (un-forceable class)

| Addr | Reason |
|------|--------|
| `02020130` | double-pool-load CSE: same global loaded into r0 and r4; MWCC always CSEs to one load |
| `02023fec` | double-pool-load CSE: `data_0219a8e4` loaded twice; cannot force two separate pool entries |
| `02001e5c` | r1-intermediate double-negation: MWCC -O4 folds `!(q && *q)` into r0, skips r1 scratch |
| `0200592c` | volatile ptr r0/r1 swap: `a` always assigned r0 (used first in store block); swap un-forceable |

## Skip list inherited from wave 2

`func_020091f4 func_02009278 func_0200efe0 func_0200f01c func_0200fdc0 func_02011178 func_0201a824`

## Commit log

| SHA | Description |
|-----|-------------|
| `2a3cd8e5` | Task 1 — re-port 18 wave-2 EUR matches to USA/JPN |
| `9d42ae9d` | EUR batch 1 — 4 HIGH C-matches |
| `eae88511` | batch 1 — USA/JPN ports |
| `3d8c5a6e` | EUR batch 2 — 5 HIGH C-matches |
| `ee3b884d` | batch 2 — USA/JPN ports |
| `3a119ac7` | EUR batch 3 — 5 HIGH C-matches |
| `2cb0349f` | batch 3 — USA/JPN ports |
| `d0b56c09` | EUR batch 4 — 4 HIGH C-matches |
| `613ee205` | batch 4 — USA/JPN ports |
| `41645296` | EUR batch 5 — 4 HIGH C-matches |
| `a69c0bf0` | batch 5 — USA/JPN ports |
| `a0cde8f6` | EUR batch 6 — 4 C-matches (1 new + 3 wave-1 era) |
| `d06b2f4f` | batch 6 — USA/JPN ports |
| `3cc748c5` | EUR batch 7 — 2 HIGH C-matches |
| `bd74e172` | batch 7 — USA/JPN ports |

## Final sha1

```
EUR  gx-spirit-caller_eur.nds: OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
USA  gx-spirit-caller_usa.nds: OK  (9e53dcc74d8a9db4de6b655d62a1da6f5e9c2a83)
JPN  gx-spirit-caller_jpn.nds: OK  (761fbfc62f4fe74f867e973a5eda91b8e86424f6)
```
