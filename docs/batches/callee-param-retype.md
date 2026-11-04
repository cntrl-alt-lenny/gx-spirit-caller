# Batch callee-param-retype

Worker summary for Verifier SHOULD FIX 1 and the empty-parens NOTE in
`docs/batches/factory-1103-night-review.md`. No generated code changes.

## Done

Each callee's definition, every `extern` of it (including `prototypes.h`
and `ov002_core.h`) and every call site now use its pointer signature.

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

Callers holding a pointer in an `int` local or field now type it as a
pointer. Four `func_ov002_0227adb8` callers get it from an `int`-returning
producer and cast that with `(void *)`.

All 8 empty-parens externs the review listed now have prototypes:
`func_0200974c`, `func_ov002_021ca2b8` and `func_ov002_0229c7f8` are
defined at their true arity, and six callers stopped passing ignored extra
arguments.

Totals at the gated commit: 326 files, 362 `(int)` casts removed,
empty-parens externs in `src/` 508 → 416.

## Checked

- Every touched object matches its `origin/main` build in section bytes,
  relocations and global symbols. The comparer fails on a deliberate change.
- Compiled with warnings on, no new `illegal implicit conversion`.
- First gate, at `0b4e39e2e`, log check:

```text
$ python tools/gate3.py --scope all --log <log>      (exit 0)
1540 [eur] SHA1 PASS
27138 [usa] SHA1 PASS
52737 [jpn] SHA1 PASS
52777 1328 passed, 17 skipped, 132 subtests passed in 29.07s
52780 ==================== GATE PASS ====================
52781 gate3: GATE EXIT 0
```

- `check_match_invariants.py --version eur`: `0 error(s)` (13999 standing
  placeholder-name warnings). `check_fake_matches.py`: `OK`.

## Review fixes

From `docs/batches/callee-param-retype-review.md` (FIX FIRST):

- `func_0205ae4c`/`func_0205ae8c` are `(void *ctx, char *, char *)`, as
  is the rest of the `func_0205ffc0` family. The two caller externs and
  `prototypes.h` match, and their 42 calls drop `(int)` casts.
  `prototypes.h` also matches `func_0206ee18` and `func_02063e0c`.
- `func_020644a4` returns `unsigned int` in every extern. Its callers
  `func_0206371c` and `func_02063808`, and `func_02063808`'s caller
  `func_02063548`, pass the buffer as a pointer.
- Definitions behind the pointer externs from round one, with every extern
  of them, now take pointers:
  - receive chain `func_0206d148` → `func_0206d0b0` → `func_0206ceb8`
    (and its request record) / `func_0206cfa0`, as
    `unsigned short *port, unsigned int *addr`
  - `func_020453fc`, which calls `void *` allocator hooks
  - dispatcher `func_02063ca4` and its handlers: `func_02064158`,
    `func_020640c0`, `func_02063e0c` → `func_02061c5c`,
    `func_02061798`, `func_02061b60`
  - `func_02063ae0`
  - `func_02060cbc`, which now uses plain `char`
- `func_02063288` declares `func_020643d8(void *self)`, the view its
  siblings use; its code is unchanged. `func_02064158` declares the
  ignored second slot as the `void *` it passes.

Every touched object (350) is identical to its `origin/main` build. Gate
at `a91778367`:

```text
$ python tools/gate3.py --scope all --log <log>      (exit 0)
1040 [eur] SHA1 PASS
1167 [usa] SHA1 PASS
1294 [jpn] SHA1 PASS
1334 1328 passed, 17 skipped, 132 subtests passed in 22.13s
1337 ==================== GATE PASS ====================
1338 gate3: GATE EXIT 0
```

## Not checked

USA/JPN ports keep their old prototypes (the gate covers them).

## Failed or blocked

- `func_020643d8` (review's `func_02063288.legacy_sp3.c:19`): reverted.
  A one-parameter definition moves `func_020640c0`'s `state` load from r3
  to r1. Callers pass one, two or four arguments.
- `func_020643ec` keeps its `void *` second and third parameters. Typing
  them `int` swaps a `moveq`/`movne` pair in `func_02063620` under every
  spelling tried.

Follow-ups: `func_02094fa0`, `func_020453b4` and `func_02060604` still take
pointers as `int`. Also: `func_ov002_021b9b64` returns `int`;
`func_0206ee18` and `func_020643d8` have per-caller arity views; the
`prototypes.h` header names a generator that #1630 retired.

Batch `callee-param-retype`, seat Worker.
