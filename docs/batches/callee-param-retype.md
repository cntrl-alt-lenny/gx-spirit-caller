# Batch callee-param-retype

Worker summary for Verifier SHOULD FIX 1 and the empty-parens NOTE in
`docs/batches/factory-1103-night-review.md`. No generated code changes:
every touched object was compared with its `origin/main` build, and the
three-region gate passed.

## Done

Retyped each callee's definition to its real pointer signature, every
`extern` of it (including `include/game/prototypes.h` and
`src/overlay002/ov002_core.h`), and dropped the casts at all call sites.

| Callee | New signature |
|---|---|
| `func_0205ffc0` | `int (void *p, char *msg)` |
| `func_02058070` | `int (void *ctx, void *buf, char *s)` (some callers used its result) |
| `func_020a6d54` | `void (const char *expr, const char *file, const char *func, int line)`: assert. The format string `data_021027fc` names the fields |
| `func_020ace00` | `int (const char *s)`: `strtol(s, 0, 10)` |
| `func_02060c9c` | `char *(char *s, char *name)`: forwards both to `func_02060cbc` |
| `func_020453cc`, `func_02045470` | realloc chain, `void *p` in and out |
| `func_0208e420` | `void (void *m)`: passes the FIFO address to `GX_SendFifo48B(src, dst)` |
| `func_0206d1f0` | port/address out-parameters as `unsigned short *` / `unsigned int *` |
| `func_ov002_022b00fc` | unused first parameter typed as the caller's `int *` |
| `func_02061670`, `func_02061578`, `func_02064208`, `func_02063854` | packet buffer as a pointer |
| `func_020628b0` | connection object as `void *self` |
| `func_ov002_0227adb8` | second parameter `void *` |

Where a caller held the pointer in an `int` local or field, that local or
field is now a pointer, e.g. `State *state` in `func_02055a84`/`func_02055420`
and `char *baseB` in `func_0200cb50`/`func_0200c874`. Four
`func_ov002_0227adb8` callers get the pointer from an `int`-returning
producer such as `func_ov002_021b9b64`; they now cast that `int` with
`(void *)`.

Empty-parens externs: 7 of the review's 8 now have real prototypes.
`func_0200974c` (`unsigned int (void)`), `func_ov002_021ca2b8`
(`int (int a)`) and `func_ov002_0229c7f8` (`int (int arg)`) were redefined
at their true arity, with every caller's extern updated. Six callers that
passed ignored extra arguments now pass one. The three callback-only
externs take their definitions' prototypes. Two other local externs in
touched files now match their definitions: `func_02058038` and
`func_020644a4`.

Totals at the gated commit: 326 files, 362 `(int)` casts removed,
empty-parens externs in `src/` 508 → 416.

## Checked

- Per object: compiled every touched unit and compared `.text`/data bytes,
  relocations and global symbols, ignoring DWARF, with the `origin/main`
  build. All identical. The comparer went red on a deliberate change
  (`0x100` → `0x101`).
- Recompiled each touched file with warnings on. It adds no
  `illegal implicit conversion`; the counts in the files that already had
  one match `origin/main`.
- Gate at ``0b4e39e2e``, log check:

```text
$ python tools/gate3.py --scope all --log <log>      (exit 0)
1540 [eur] SHA1 PASS
27138 [usa] SHA1 PASS
52737 [jpn] SHA1 PASS
52777 1328 passed, 17 skipped, 132 subtests passed in 29.07s
52780 ==================== GATE PASS ====================
52781 gate3: GATE EXIT 0
```

- `check_match_invariants.py --version eur`: `0 error(s)`, 13999
  placeholder-name warnings, none naming a touched file.
- `check_fake_matches.py`: `OK`. `fw.py check`: `0 error(s)`, the 16
  standing word-count warnings.

## Not checked

USA/JPN ports of these functions keep their old prototypes. The gate
covers them, but I did not retype them. Not checked by eye beyond compile:
the callers changed only by an extern line.

## Failed or blocked

- `func_020643d8` (review's `func_02063288.legacy_sp3.c:19`): reverted.
  A one-parameter definition moves `func_020640c0`'s `state` load from r3
  to r1, since the original keeps r1 live for the call. Its callers pass
  one, two or four arguments, so no single prototype fits all.
  `func_02063854` declares it with its four parameters.

Follow-ups, same defect one level down: `func_020453fc`, `func_0206d148`
→ `func_0206cb6c`/`func_0206d0b0`, `func_02063ca4`, `func_02063ae0`,
`func_02061798`, `func_02061b60`, `func_02094fa0`, `func_020453b4`,
`func_02060604`. Also `func_ov002_021b9b64` returns `int`, and the header
of `prototypes.h` names a generator that #1630 retired.

Batch `callee-param-retype`, seat Worker.
