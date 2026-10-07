# Batch 10: EUR main, 0x02020000-0x0202ffff, 256 B or less

Base `de2fe9f34`. Worker seat. 61 candidates from `wall_aware_headroom.py`.
The tool lists 0 confirmed-permanent files in range (also 0 without
`--exclude-attempted`), so there was nothing to retry on that list.

## Done

49 functions, 6,944 B, all default tier (mwcc 2.0), each 100% under
`fastmatch.py eur`, one commit each, each with a `shipped` ledger row:
02020398 020205ec 02020738 02020d00 02021660 02021a3c 02021bac 02022430
020224c0 02022540 020225b4 02022a80 02022af4 02023e58 02023eb8 020242d4
02024368 02025840 02025a10 02025f00 02026d50 02027e44 0202813c 02029204
02029458 02029624 020298f8 020299c4 02029a88 02029c30 0202a998 0202aa58
0202ab04 0202b1a8 0202b6e4 0202b74c 0202b9b0 0202b9ec 0202bb88 0202c270
0202c948 0202ce24 0202d2dc 0202d9a0 0202e358 0202e5ac 0202e60c 0202f164
0202f500.

No non-default tier shipped. No inline asm, pins or raw data. `volatile` is
used once: a pointer to volatile for MMIO in 02023eb8, where the original
re-reads the register. 0202b9b0 and 020242d4 use the symbols the original
names (`data_020be822`, `data_020be72c`). The reference check caught the first
form of 020242d4 and I fixed it. No callee declarations were bent.

## Checked

| Check | Exit | Output |
|---|---|---|
| gate3 `--scope all`, commit 2c6188a1f | 1 | `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`, `1330 passed, 15 skipped`, `GATE FAIL`, `gate3: GATE EXIT 1` |
| check_references (inside the gate) | 1 | 4 STALE lines, 0 `NEW:` |
| check_fake_matches (inside the gate) | 0 | `OK` |
| check_delink_dupes | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| validate_attempts | 0 | `"errors": 0` |
| check_match_invariants eur | 1 | `0 error(s), 13999 warning(s)` |

The gate fails only on these STALE baseline lines, for `.s` files I replaced
(Brain to delete):

- `[eur] src/main/func_020242d4.s: wrong-target at .text+0x88`
- `[eur] src/main/func_02024368.s: wrong-target at .text+0xc0`
- `[eur] src/main/func_02024368.s: wrong-target at .text+0xc4`
- `[eur] src/main/func_0202b9b0.s: wrong-target at .text+0x38`

`progress.py --version eur` Natural-C: 448,234 at base, 455,178 at the end.
The gain is 6,944 B, equal to the matched sizes.

## Not checked

USA and JPN beyond the gate. 1.2 tiers for the 49 shipped functions (the
default matched, so I did not try them). The gate was run once, on the final
code commit.

## Failed or blocked

Matched, then reverted to `.s` (fastmatch 100%, but they need the
`data_..._alias` recipe, whose reference line would be NEW; ledger `parked`
with score `unknown` because the validator rejects parked at 100):
02023f7c, 02027048. Symbols in `symbols.txt`, defined in no object.

C-34, no alias symbol exists for `data_0219a8dc` / `data_0219a8ec`, so the
original's second pool word cannot be produced (best default / legacy_sp3):
020234f8 25.8/0.0, 02024574 6.9/15.6, 020244e8 3.5/3.5.

Register allocation, not matched (best default / legacy / legacy_sp3):
02020814 89.5/4.5/4.8 (moveq/movne order), 02021c30 65.7/2.4/0.0,
02023188 31.4/23.1/23.7, 02024024 77.4/0.0/0.0, 02029b6c 30.0/7.5/7.7,
0202b12c 35.5/59.4/71.0, 0202ba38 78.3/32.0/78.3.
For 0202b12c and 0202ba38 a legacy tier scored at or above default; I did not
iterate further there.

Not an entry of another kind: none found.
