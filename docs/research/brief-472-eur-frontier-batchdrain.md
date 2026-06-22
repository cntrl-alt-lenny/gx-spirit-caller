[//]: # (markdownlint-disable MD013 MD041)

# Brief 472 — pivot back to EUR frontier: batch-drain the residue + lane census

**Brief:** 472 (decomper). Park the USA/JPN `.s` drain; both agents on EUR to close
it out (EUR 83.59%). Take ov002 UPPER half (≥0x02234000) + the next-module
frontier per the brief-460 census. Scaffolder has ov002 lower.

## Result

- **15 EUR `.s` ships** across 6 overlays, via `tools/batch_carve.py`
  (auto-carve + gate + commit), each EUR `sha1` OK.
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`** (USA/JPN keep these in the
  gap → byte-identical; the carves are EUR-only).

| scope | shipped | commit |
|---|---:|---|
| ov012 | 5 | `63046ade` |
| ov013 | 5 | `63b11dab` |
| ov006 | 2 | `2ff377e1` |
| ov003 | 1 | `e0273d23` |
| ov018 | 1 | `4cf26656` |
| ov020 | 1 | `370d0326` |

## ⚠️ The brief-460 census was STALE — and the real frontier is its hard tail

The brief-460 census reported "main + all overlays = 0, ARM `.s` lane exhausted."
That was a **scope bug**: `batch_carve --min-addr` defaults to `0x02234000` (the
ov002 upper/lower guard), which filters out every main func (all `< 0x02234000`)
and most overlays → false 0s. Re-running the census with `--min-addr 0x0` for
non-ov002 scopes surfaced **~135 candidates**:

| scope | candidates | scope | candidates |
|---|---:|---|---:|
| main | 64 | ov013 | 5 |
| ov006 | 17 | ov016 | 5 |
| ov004 | 9 | ov017 | 4 |
| ov005 | 8 | ov014 | 3 |
| ov012 | 5 | ov019 | 3 |
| (ov003/007/009/018/020/021) | 1-3 each | ov002 upper | 2 |

**But the candidates are mostly the hard residue, not shippable.** Running the
real carve (asm_escape verify, not the heuristic dry-run):

- **main: 64 candidates → 0 ships** (53 refuse + 11 verify-fail). The 11
  verify-fails include `020a41f8` / `020a4b6c` — the exact reloc-mismatch funcs
  parked since brief 421. So main's ARM `.s` IS genuinely drained (brief-460 was
  right about main, wrong about *why* its count looked like 0).
- **overlays: ~104 candidates → 15 ships.** The rest split:
  - **~52 verify-fail** (ov005 8, ov006 11, ov016 5, ov017 4, ov007/009/014/019/021…)
    — `asm_escape`'s `to_mwasm`/objdump translation can't byte-reproduce these
    (the known opcode/reloc-coverage gaps).
  - **~68 refuse** (main 53, ov004 9, ov006 4, ov002 2) — `kind:data` / argpack /
    bytepack class (clean-C / data territory, not whole-function `.s`).

## What this means for the EUR finish (recommendation)

The **mechanical whole-function `.s` lane is at its tail** — 15 scattered ships
this wave, and what remains is two non-`.s` buckets:

1. **~52 verify-fail funcs = a TOOLING opportunity.** These are real ARM funcs
   that `asm_escape` can't yet byte-reproduce (to_mwasm opcode/reloc gaps). Each
   prior to_mwasm fix (stm/ldm, `-z`, strhls) unblocked a class. Investing in the
   next to_mwasm coverage gaps would convert a chunk of these 52 — the
   highest-leverage remaining `.s` work.
2. **~68 refuse = clean-C / permuter territory** (kind:data-absorbing, argpack,
   bytepack) — the decomp matching lane, not `.s`.

ov002 upper (my assigned half) is drained (2 refuse). So the EUR closeout from
~83.6% is now a **decomp/tooling problem, not a mechanical-`.s` problem**.

## Method

`batch_carve.py` per scope (`--min-addr 0x0`, `--gate-retries 3`, commit-on-pass).
Single-lane overlay delinks (no ov002 collision — scaffolder's on ov002 lower,
I'm on other overlays). Reaped stray `python` first.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
