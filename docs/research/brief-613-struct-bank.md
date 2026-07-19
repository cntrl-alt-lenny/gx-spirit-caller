# Brief 613 - full-tree struct-bank mining

## Result

The brief-609 miner was scaled to batch all requested symbols in one
`objdump` pass over the EUR delink tree and to update `ov002_core.h` with
guarded context-only declarations. The real-build declarations remain in
their original types. Three new layouts were emitted; the two existing
brief-609 layouts were analyzed and left authored as-is because their new
zero-offset evidence overlaps existing narrower members.

The header contains 11 `data_ov002_*` declarations. Five have direct
constant-offset field evidence in the miner. Six are count, ring, alias, or
otherwise non-field tables and produced no direct accesses:
`022cf17c`, `022cf178`, `022cf184`, `022cf1a4`, `022cd744`, and
`022ce720`.

| Symbol | Access sites | Observed offsets | Disagreements | Action |
|--------|-------------:|-----------------:|--------------:|--------|
| `data_ov002_022cf16c` | 51 | 17 | 1 | New guarded layout |
| `data_ov002_022ce950` | 661 | 9 | 2 | New guarded layout |
| `data_ov002_022cd3f4` | 888 | 39 | 0 | New guarded layout |
| `data_ov002_022d016c` | 2081 | 56 | 2 | Existing layout preserved |
| `data_ov002_022ce288` | 1949 | 46 | 2 | Existing layout preserved |

The zero-offset parser fix recognizes both `[base]` and `[base, #0]`.
Rendering now omits an overlapping field instead of shifting later members.
For example, a disputed word at `+0` overlapping a known halfword at `+2`
is reported but not emitted as a sequential C member. This keeps m2c's
context offsets honest and leaves the ambiguous access as an unnamed field.

## Context canary

The guard audit passed:

```text
extern_struct_outside_context= []
extern_struct_count=5
origin_data_declarations=11
else_data_declarations=5
real_build_declarations_unchanged=True
```

The five `#else` branches contain the original `char[]` declarations. The
other six data declarations remain plain original declarations outside a
context block because they were not mined as field layouts. No real-build
declaration was changed to a struct.

## m2c before/after probes

Each probe used the real EUR delink object and `m2c_feed.py --m2c --context`.
The before draft used the origin header; the after draft used the guarded
mined header.

| Function | Before | After |
|----------|--------|-------|
| `func_ov002_021aba60` | `data_ov002_022cd3f4->unk0` | `data_ov002_022cd3f4.f_0` |
| `func_ov002_0225ca60` | `data_ov002_022cd3f4->unk4` | `data_ov002_022cd3f4.f_4` |
| `func_ov002_0225ee48` | `data_ov002_022cd3f4->unk4` | `data_ov002_022cd3f4.f_4` |
| `func_ov002_0225b338` | `data_ov002_022cd3f4->unk4 = temp_r4` | `data_ov002_022cd3f4.f_4 = temp_r4` |
| `func_ov002_021d0860` | `data_ov002_022ce950->unk0` | `data_ov002_022ce950.f_0` |
| `func_ov002_021ce59c` | `data_ov002_022ce950->unk0` | `data_ov002_022ce950.f_0` |
| `func_ov002_021ced48` | `data_ov002_022ce950->unk6` | `data_ov002_022ce950.f_6` |
| `func_ov002_021af5a0` | `data_ov002_022cf16c->unk4` | `data_ov002_022cf16c.f_4` |

All 8 probes returned `rc=0`. The `022cf16c` draft also contains an
unnamed `+0` access, which is the intentional overlap case described above;
its other accesses render as named fields.

## Verification

```text
python3.13 -m pytest tests/test_build_struct_bank.py -q
26 passed in 0.03s

python3.13 -m ruff check tools/build_struct_bank.py tests/test_build_struct_bank.py
All checks passed!
```

The task is wine-free. No ROM build, SHA1 gate, or Wine invocation was run.
