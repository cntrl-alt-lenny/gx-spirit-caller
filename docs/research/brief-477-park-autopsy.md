[//]: # (markdownlint-disable MD013 MD041)

# Brief 477 - park-class autopsy and bounded asm_escape disassembly

**Brief:** 477 (scaffolder, wine-free tooling). Census the accumulated
`asm_escape` parks across EUR/USA/JPN, classify the live failures from native
`arm-none-eabi-objdump` evidence, and fix the dominant recoverable class without
running `batch_carve`, mwasmarm, or any SHA gate.

## Headline - the dominant live class is function-boundary overrun

The live non-REFUSE park population on current main is **20 region/function
instances**. The largest class is **8 boundary overruns**: `parse_objdump`
stopped only at a following symbol whose name started with `func_`, so it
swallowed adjacent named SDK routines or data such as `BuildInfo`,
`GetSystemWork`, `OS_DisableIrq`, `Fill32`, and `Copy32`.

That produced two failure modes:

1. a verify/assemble failure when the swallowed payload was data (`BuildInfo`);
2. a byte-green standalone object whose `.text` section was larger than the
   exact delink range, followed by a full-ROM gate failure.

The fix makes the configured `symbols.txt` size authoritative for original
disassembly and emission. The standalone emitted object remains unbounded in
verification, so any accidental trailing payload is now caught by a new word
count check.

## Census

### Inputs and stale-record cleanup

| source | raw records | live on current main | finding |
|---|---:|---:|---|
| `build/known_verifyfail_ov002.txt` | 134 | **0** | all 134 now have exact ov002 source + delink blocks; the build-local list is entirely stale |
| USA main build-local verify list | 4 unique | 4 | all remain uncarved |
| JPN main build-local verify list | 8 lines / 4 unique | 4 | each function was written twice (`name` and `name verify-fail`) |
| brief-474 EUR main residue | 4 | 4 | all remain uncarved |
| brief-473 USA/JPN gate residue | 4 per region | 4 per region | all remain uncarved; brief 475 re-isolated the two JPN members reached in that wave |

The current delink/source audit found **0/4 EUR**, **0/8 USA**, and **0/8 JPN**
known non-REFUSE candidates carved.

Documented `kind:data` parks are tracked separately because they are real
preflight REFUSEs, not comparator recovery candidates:

- 68 EUR instances from brief 474 (66 outside upper ov002 + 2 upper ov002);
- 2 USA main instances from brief 473;
- 1 USA ov006 + 1 JPN ov006 instance from brief 475.

That is **72 known REFUSE instances** across the three regions/modules.

### Live non-REFUSE signatures

| signature | instances | functions | verdict |
|---|---:|---|---|
| configured-range overrun into a non-`func_` symbol | **8** | USA+JPN `func_02000b64`, `func_02018ae0`, `func_020936a8`, `func_020943b0` | dominant; fixed here |
| `svc` spelling and single-register push/pop encoding | 6 | USA+JPN `func_020b40cc`, `func_020b40e0`, `func_020b40f4` | still parked |
| embedded in-function table / code-data boundary | 4 | EUR `func_02099718`, `func_020b21ec`, `func_020b2d2c`, `func_020b3c78` | still parked; needs table-boundary support |
| symbol-name address differs from configured address | 2 | USA+JPN `func_020a60a8` | still parked; batch driver must use `symbols.txt` address, not the name suffix |

`func_020a60a8` is named as though it starts at `0x020a60a8`, but both USA and
JPN `symbols.txt` place it at `0x020a5fb4` with size `0x18`. Its emitted bytes
compare clean; the delink geometry is wrong when the driver derives the address
from the name.

## Native real-object evidence

The bounded parser was applied to the real USA/JPN gap objects. Old unbounded
word counts versus configured-range counts:

| function | configured size | old words | bounded words |
|---|---:|---:|---:|
| `func_02000b64` | `0x4` | 18 | **1** |
| `func_02018ae0` | `0x14` | 8 | **5** |
| `func_020936a8` | `0x14` | 16 | **5** |
| `func_020943b0` | `0x1c` | 18 | **7** |

The JPN failed `.asm.o` files survived for the last three. Before this patch,
the comparator returned no differences because both parsed streams included
the same adjacent routines. With the bounded original plus the new count
guard, those old objects are correctly RED:

```text
func_02018ae0: word count differs: mine=8 orig=5
func_020936a8: word count differs: mine=16 orig=5
func_020943b0: word count differs: mine=18 orig=7
```

## Tool fix

`tools/asm_escape.py` now:

1. accepts an optional authoritative size in `parse_objdump`;
2. reads that size from the module's `symbols.txt`;
3. bounds original parsing/emission to exactly that range;
4. parses the standalone emitted object without a bound;
5. makes `diff_words` reject unequal word counts before comparing bytes and
   relocations.

This is deliberately narrow. It does not reinterpret embedded tables, change
relocation equivalence, or relax byte checks.

## Tests and limits

Two pure-Python regressions were added:

- positive: a four-byte function followed by `BuildInfo` emits only `bx lr`;
- negative: an emitted stream with one extra word is rejected RED.

Validation:

```text
python3.13 -m unittest tests.test_asm_escape
Ran 47 tests - OK

python3.13 -m unittest tests.test_asm_escape tests.test_batch_carve
Ran 72 tests - OK

python3.13 -m ruff check tools/asm_escape.py tests/test_asm_escape.py
All checks passed!

git diff --check
OK
```

Per brief, no `batch_carve`, mwasmarm, Wine process, `configure.py`, or
`ninja sha1` command was run. The eight real boundary-class instances require a
downstream decomper/PC re-attempt to prove full byte recovery and region gates.

## Persistent park-list verdict

No tracked park manifest was added in this wave. The local evidence shows why a
raw file copy would be unsafe: EUR's 134-entry list is 100% stale and JPN's list
duplicates every entry. A durable manifest should be generated from current
delinks/source state and consumed by `batch_carve`; committing today's scratch
files without that refresh contract would preserve the re-test problem rather
than solve it.
