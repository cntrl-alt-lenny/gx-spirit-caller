# Brief 474 — ov002 UPPER census + `asm_escape` self-reloc unlock

**Decomper, brief 474.** A fresh-main census and real `batch_carve` run confirm
that ov002 UPPER is exhausted: its only two remaining candidates both refuse as
`kind:data`. The brief's fallback tooling path then fixed a narrow relocation
comparator defect, converting all 7 self-pointer false negatives in the real
EUR `asm_escape` tail to byte-identical passes. No other-module source,
USA/JPN source, or delink manifest was changed.

## ov002 UPPER result

The authoritative unskipped census on fresh `origin/main` found:

| Candidate | Size | Result |
|-----------|-----:|--------|
| `func_ov002_022b867c` | `0x248` | `kind:data` REFUSE |
| `func_ov002_022b5590` | `0x3cc` | `kind:data` REFUSE |

The requested real driver run was:

```console
python -u tools/batch_carve.py --version eur --overlay ov002 \
  --batch 10 --limit 100 --gate-timeout 600 --call-timeout 60
```

Result: **SHIPPED 0 | REFUSE 2 | verify-fail 0 | deferred 0**.

Running the sorter on
`config/eur/arm9/overlays/ov002/delinks.txt` reported 3,372 blocks,
0 inversions, and no file change. The scaffolder's lower-half lane remained
untouched.

## Corrected mechanical-tail census

Brief 472's headline buckets were numerically close but conflated two different
failure classes. Re-probing all 118 remaining non-ov002 candidates without
changing source gives:

| Bucket | Count | Meaning |
|--------|------:|---------|
| Real `kind:data` refusals outside upper ov002 | 66 | 53 main + 13 overlays |
| ov002 UPPER refusals | 2 | the two candidates above |
| Real main `asm_escape` verify-fails | 11 | 7 self-reloc + 4 embedded data/table |
| Overlay placeholder misses | 41 | 4–8-byte symbols absent from every gap object |

Thus the reported **~68 refuses** is accurate (66 + 2), but the reported
**~52 verify-fails** is not a 52-function translator opportunity. Only 11 are
real whole-function translator/comparator failures. The other 41 return
“not found in build/eur/delinks” because they are tiny placeholder symbols
inside already-delinked units; they cannot be carved as independent `.s`
translation units.

## Root cause: self-pointer relocation spelling

Seven of the 11 real failures contain a literal-pool pointer to the function
currently being assembled:

- `func_02031d0c`
- `func_02047830`
- `func_0207a868`
- `func_0207ab68`
- `func_02093160`
- `func_020a41f8`
- `func_020a4b6c`

The original gap object records `R_ARM_ABS32 <function>`. For the emitted
standalone `.s`, mwasm canonicalises `.word <function>` to
`R_ARM_ABS32 .text`. `emit_asm` places the function at offset zero in that
standalone `.text` section, so both relocations resolve to the same address.
The old `diff_words` compared only relocation names and rejected the safe
canonicalisation as `.text vs <function>`.

The comparator now accepts exactly this equivalence when:

1. one relocation is `.text`;
2. the other is the function currently being verified; and
3. `bytes_match` explicitly supplies that function name.

It does not relax any other relocation comparison. A negative unit test proves
that `.text` still fails against a different function symbol.

## Unlock validation

All seven historical failures now pass the full build-dependent
`asm_escape.py --whole-function` assemble + byte-compare pipeline:

| Function | Words | Result |
|----------|------:|--------|
| `func_02031d0c` | 29 | byte-identical |
| `func_02093160` | 34 | byte-identical |
| `func_02047830` | 111 | byte-identical |
| `func_0207a868` | 192 | byte-identical |
| `func_0207ab68` | 195 | byte-identical |
| `func_020a4b6c` | 542 | byte-identical |
| `func_020a41f8` | 551 | byte-identical |

The four real failures still parked are embedded-data/table shapes:
`func_02099718`, `func_020b21ec`, `func_020b2d2c`, and
`func_020b3c78`. Those need pool/table-boundary detection rather than a
relocation-comparator exception.

## Verification

- `python -m unittest tests.test_asm_escape` — 45 tests OK.
- `python -m ruff check tools/asm_escape.py tests/test_asm_escape.py` — OK.
- EUR `python tools/configure.py eur && ninja sha1` — **OK**.
- USA `python tools/configure.py usa && ninja sha1` — **OK**.
- JPN `python tools/configure.py jpn && ninja sha1` — **OK**.

The tooling fix is region-neutral and available to later EUR, USA, and JPN
mechanical drains, while this PR deliberately ships no USA/JPN candidates.
