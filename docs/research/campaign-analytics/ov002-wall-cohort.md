# ov002 verified wall cohort

Snapshot: Brief 654, checked against the committed EUR `src/overlay002/`
tree on 2026-07-22. This is a negative-result record: it prevents future
agents from treating the ov002 residue as an unexplored sweep pool. It does
not claim that every future compiler version must reproduce these walls.

## Reconciled cohort

The source tree contains 2,750 function `.s` files under
`src/overlay002/func_*.s`. Header evidence divides all 2,750 into three
documented cohorts:

| Cohort | Count | Address envelope | Evidence and disposition |
|---|---:|---|---|
| Brief-294 reg-alloc wall (P-16-class) | 2,719 | `0x021aa4a0`–`0x022bdf30` | Every header carries the specific “reg-alloc-walled functions with no C match (brief 294 endgame)” result. Keep as `.s`; do not schedule a blind C sweep. |
| Briefs 288/290 commutative-add/CSE wall (P-17) | 17 | `0x021e8b34`–`0x021f2ac8` | Every header names the `.s` escape hatch and the commutative add-operand/CSE diagnosis. One fresh re-test reconfirmed the wider register-allocation divergence. |
| C-34 duplicate-pool-slot residue | 14 | `0x021aba60`–`0x022b595c` | Headers identify Brief 207 C-34 candidates; Brief 654 independently verified duplicate same-symbol `.word` pool references. Keep as `.s`; inline `asm int` does not split mwasmarm’s pool slot. |
| **Function total** | **2,750** | | **2,719 + 17 + 14 = 2,750** |

There are also seven `src/overlay002/data/*.s` files. They are data bundles,
not function candidates, and are excluded from this function-cohort count.

The address envelopes above are minimum-to-maximum ranges, not claims that
every address in an interval is present. The exact non-P-16 members are:

- P-17: `021e8b34`, `021e97bc`, `021eb128`, `021eb300`, `021eb630`,
  `021ebf40`, `021ebfd0`, `021ee23c`, `021ef5a0`, `021efe44`, `021f0028`,
  `021f020c`, `021f1458`, `021f1504`, `021f208c`, `021f2138`, `021f2ac8`.
- C-34 residue: `021aba60`, `021c4c9c`, `021d9828`, `021e4ba8`,
  `021ef7b4`, `021efac8`, `021f2ca8`, `021ff6d0`, `0220eb00`, `022476e8`,
  `02247ad8`, `02247b6c`, `022a1870`, `022b595c`.

## Verification method

The census was mechanical:

1. Enumerate `git ls-files 'src/overlay002/func_*.s'`; this yields the 2,750
   function files. Read each complete header and classify only the explicit
   Brief 294, Brief 288/290, or C-34 evidence strings. The counts reconcile
   without treating the seven data `.s` bundles as functions.
2. For the Brief 288/290 cohort, Brief 654 freshly re-tested
   `func_ov002_021ebf40` using the accumulated bitfield, statement-order, and
   named-address levers. The result retained the documented
   `DIFF_ARG_MISMATCH` shape: instruction sequence was the same, but register
   allocation diverged throughout. This is corroboration of the negative
   header record, not a new claim that no source form could ever work.
3. For C-34, Brief 654 tried natural C twice and an `asm int` form on
   `func_ov002_02247ad8`; all retained the dual-pool-slot collapse. Grep
   cross-checks found the same duplicate same-symbol `.word` evidence in the
   seven giant C-34 candidates and `func_ov002_022476e8`.

## Operational conclusion

The remaining ov002 function pool is documented residue: 98.9% is the
Brief-294 cohort, 17 files are the newly named P-17-class cohort, and 14 are
C-34 `.s` residue. Future work should improve classifier visibility and
taxonomy references, not launch another blanket ov002 C-match wave. See
[Brief 654](../brief-654-ov002-sweep.md), [the P-17 taxonomy entry](../codegen-walls.md#p-17-briefs-288290-commutative-add-cse-reg-alloc-wall),
and the [byte-derived endgame ledger](endgame-ledger.md).
