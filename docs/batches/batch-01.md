# Batch 01: Worker summary

Scope: EUR main, `.s`-only functions of 256 bytes or less, never attempted,
in 0x02030000-0x0203ffff (`wall_aware_headroom.py`, 92 candidates). I worked
in address order from 0x0203058c to 0x020358cc and attempted 37 functions:
31 match at 100%, 6 are parked. Each match is its own commit, recorded with
`record_shipped.py`. The parks are restored to `.s` with `park_one.py`
(ledger row only, no `.s` or `delinks.txt` diff).

## Matched (31 functions, 3,608 B)

| Function | Size | Function | Size |
|---|---|---|---|
| func_0203058c | 76 | func_02033770 | 72 |
| func_020312a0 | 184 | func_020337b8 | 68 |
| func_0203194c | 84 | func_02033864 | 68 |
| func_020319a0 | 208 | func_020338b8 | 64 |
| func_02031ab0 | 76 | func_020339d4 | 116 |
| func_02031ba0 | 124 | func_02033d78 | 112 |
| func_02031d98 | 232 | func_02033f40 | 112 |
| func_02031ebc | 132 | func_02033fb0 | 100 |
| func_02031f9c | 84 | func_020341b0 | 136 |
| func_020320f8 | 184 | func_02034270 | 128 |
| func_0203276c | 84 | func_02034a84 | 168 |
| func_02032ac4 | 108 | func_02034bd8 | 92 |
| func_02032b30 | 204 | func_020358cc | 136 |
| func_02032c78 | 80 | func_020332a4 | 100 |
| func_02033718 | 88 | func_020334cc | 112 |
| func_020336cc | 76 | | |

## Attempted, not matched (6, parked)

| Function | Size | Best (fastmatch) | Park class | What is left |
|---|---|---|---|---|
| func_02031c1c | 112 | 78.6% | P-20-dual-register-swap | `ip`/`lr` and `r2`/`ip` swap; 9 variants tried |
| func_02032998 | 68 | 76.5% | P-20-dual-register-swap | `r2`/`r3` swap around the +0x1fc sub-object base |
| func_020326d4 | 80 | 70.0% | address-fold | mwcc folds the +0x1fc base into `[rN, #0xe7c]` |
| func_02033ac0 | 160 | 15.0% | fold-predication-alloc | the `extra ? extra->buf : 0` select reuses the zero register |
| func_02033a48 | 56 | 14.3% | address-fold | +0x314 base and a 64-bit store split across two bases |
| func_02032d70 | 200 | 4.0% | address-fold | only the +0x314 base register differs; the score is low because every offset after it shifts |

## Checks, run on c9eb28e74

`python tools/gate3.py --scope all --log <scratch>/gate_c9eb28e74.log`
returned exit 0. The AGENTS.md log check printed:

```text
13627 [eur] SHA1 PASS
39225 [usa] SHA1 PASS
64824 [jpn] SHA1 PASS
64864 1330 passed, 15 skipped, 132 subtests passed in 22.27s
64867 ==================== GATE PASS ====================
64868 gate3: GATE EXIT 0
```

No region SKIP lines appeared. The "15 skipped" are pytest skips.

- `python tools/check_delink_dupes.py`:
  `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)`
- `python tools/check_match_invariants.py --version eur`:
  `Found 13999 issue(s): 0 error(s), 13999 warning(s).` It exits 1, which
  means warnings only.
- `python tools/validate_attempts.py`: exit 0. It prints only pre-existing
  `shape-conflict` notes for ov002 rows.
- `python tools/check_fake_matches.py`: `check_fake_matches: OK`, with
  baseline entries unchanged at 4.
- `python tools/progress.py --version eur`: Natural-C went from 414,738 B to
  418,346 B (17.38% to 17.53%), a gain of 3,608 B. That equals the sum of the
  31 shipped rows in the ledger.

## For the Verifier: constructs to look at

All of these are honest C that the lint accepts. Each one reproduces
something that is in the original code. I list them so they get reviewed
on their own merits, not on the lint's say-so.

- **func_02031ebc, func_020320f8:** `&l->tail != 0 && l->tail == ...` is a
  null check on a member's address. It reproduces the original
  `adds r, base, #0xc; beq`, which most likely comes from an inlined helper
  that takes a pointer.
- **func_0203194c:** the check
  `((unsigned long long)x & 0xffffffff00000000ull) != 0` can never be true,
  but it guards a call to func_02093bfc that the original makes, so the
  check is in the binary.
- **func_02033770:** `o->flags &= ~0x40000;` appears twice, because the
  original has two `bic #0x40000` in a row.
- **func_02032b30:** an explicit `flag = (...) ? 1 : 0; if (flag == 0)`
  intermediate, the lever documented for func_020338f8 in codegen-walls.
- **func_02034bd8:** the literal `0x08f00004` is a plain pool word in the
  original, with no relocation.
- **func_02034a84:** compares the argument against the addresses of
  `data_0219b760` and `data_0219c408`. Both are real relocations in the
  original.
- **func_02034270:** uses a flexible array member (`bits[]`) at +0x440.
- **Struct types:** each file declares its own local struct types (padding
  plus named fields) for shared objects such as the 0xeb4-flags object and
  `data_0219adb8`/`data_0219adcc`. The field names are descriptive guesses,
  not established names.

## Limitations and blockers

- No tool defect blocked any function, and no tools were changed. I did not
  use `cmatch_loop.py`; every draft was written by hand and iterated with
  `fastmatch.py`.
- Three of the parks share one pattern, the sub-object base register:
  mwcc sometimes keeps `o + 0x1fc` or `o + 0x314` as a base and sometimes
  folds it into the offset. func_020332a4 matched by going through a pointer
  to the nested struct, but the same approach did not work for 020326d4,
  02033a48 or 02032d70.
- 55 of the 92 candidates were not reached. The next one in address order
  is func_0203671c.
