# Factory 1017 review

Reviewed commit c1f222e1a (brain/factory-1017, base bd058e9de). Verifier worktree only; main checkout untouched.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 483 A + 483 D + 3 M (`delinks.txt`, `attempts.tsv`, `reference_baseline.txt`); all under `src/overlay002`; every delinks change is one header flip for a shipped function |
| forbidden constructs grep | asm / pragma / register / data directives / section attrs: 0; `volatile`: 0 in new files |
| `check_fake_matches.py` | `check_fake_matches: OK` (exit 0) |
| `check_delink_dupes.py` | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `validate_attempts.py` | exit 0; first 3,776 rows byte-identical to base; +1,186 rows (484 shipped, 702 parked) |
| ledger | 483 `.c` = 483 shipped rows; 187 parked-only funcs all best score above 0; `func_ov002_0224ee48` is `.s` with a `tool-anomaly` row |
| `gate3.py --scope all --log <outside>` | `[eur] [usa] [jpn] SHA1 PASS`, `check_references: OK`, `1330 passed, 15 skipped`, `GATE PASS`, `gate3: GATE EXIT 0` |
| `progress.py --version eur` | Natural-C 580,654 B; gain 76,208 B = sum of 483 shipped sizes, exactly |
| fastmatch on the 40 sampled files | 40/40 `100.0% OK` |

## Sample

`random.Random(1017).sample` of the sorted added `.c` list; all 40 read next to their `.s`. Names are in `git diff --diff-filter=A`; first: 02220f00, 022a6cc4, 0224e018, 02211708, 021e1bf8, 0228da54, 021c229c, 02205dc8.

## Findings

No BLOCKER.

**SHOULD FIX**
- Needless arithmetic constants: `func_ov002_0224e390.c:38` (`0x868 - 0x28c`), `02287348.c:22`, `02291f00.c:26`, `021c1954.c:16` (`0x17e4 + 0x42`), `021c92fc.c:12`. I replaced them with the plain values (0x5dc, 0x1826, 0x1860) and both files still matched 100%. They are source obfuscation, not needed.
- Extern prototypes ignore callee definitions: heuristic scan, 161 of 267 checkable declarations differ from the callee's `.c` in argument count or void/int return (e.g. `func_ov002_0229cd5c`, `func_0202e2f8`, `func_ov002_021c8940`). 14 callees are declared with different argument counts in different new files. Separate TUs, so it compiles, but it records wrong signatures.

**NOTE**
- `data_ov002_022cf16c` is redeclared with several types (char[], int[], struct arrays). 234 of 483 files use `pad[...]` arrays; some are sized to reach an offset (`Side` in `0224bf3c`).
- `goto` in 5 files; match-shaped idioms such as `p->b = 1; p->c = p->b` (`02220904`), a `+ 0xffff` halfword add (`02211708`), recomputing `(1 - bit0) & 1` three times (`02202240`).
- `func_ov002_021b004c` returns `u32 *` but callers declare `struct E *` or `int`.
- Parked tops (98.4% to 96.4%) are one swapped `add` operand or register letter.

**UNPROVEN CLAIM**
- Factory logs call the top parks "instruction-selection"; I could not confirm that class.

## Parked retries

I re-ran the factory's drafts for the 8 top parks; scores reproduced for 7. `021e8b34`'s saved draft gives 52.8%, not the logged 97.2%, so the best draft was not preserved. I tried 4 variants on `021f2138` and 2 on `022496b4`: no match. I did not give the other 6 a full 20 minutes; this is not evidence they are walls.

## Prompt improvements

1. Require externs to be copied from the callee's `.c` or a shared header.
2. Forbid constant arithmetic; the plain value must be tried first.
3. Ask for one canonical declaration of each shared data symbol.
4. Keep the best draft, not the last.

## Not checked

JPN/USA behaviour beyond gate3; semantic correctness of struct field names; 443 unread functions.

## Verdict

The gate and my independent fastmatch say every sampled function matches its original and the diff is scoped exactly as claimed, with no hidden asm or `volatile`. The defects are cosmetic honesty and signature hygiene, not match fraud. I would merge, with the constants and prototypes as follow-up. Confidence in the 443 unread: high on byte-correctness (gate), moderate on naturalness, since the 40-function sample shows the same style issues throughout.
