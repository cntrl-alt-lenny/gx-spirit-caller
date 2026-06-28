[//]: # (markdownlint-disable MD013 MD041)

# Vtable / Struct Dispatch Patterns

All identified patterns where a struct field is read and used as a `blx rN`
call target — i.e., a virtual function slot accessed through a struct pointer.
Grouped by which struct holds the slot and what offsets are used.

---

## Pattern A — State-machine dispatch (per-overlay global singleton)

The most pervasive pattern. Every overlay has a global "work object" with a
function-pointer slot. Each overlay installs a phase-handler there, then the
main tick function dispatches through it.

### A1. Main arm9 and most overlays — offset +0xb6c

```
Global:    data_021040ac  (= GlobalAudioState; see types/GlobalAudioState.md)
Slot:      +0xb6c  (function pointer)
Pattern:   ldr r0, &data_021040ac
           ldr r1, &fn_table
           ldr r0, [r0, #0xb6c]     ; load state index
           ldr r0, [r1, r0, lsl #2] ; table[index]
           blx r0
```

Overlays using this pattern: **ov001, ov004, ov008, ov011, ov012, ov013,
ov015, ov018, ov020, ov022, plus arm9 main.** Entry function per overlay:

| Overlay | Entry function |
|---------|---------------|
| ov001 | `func_ov001_021ca2f8` |
| ov004 | `func_ov004_021cb518` |
| ov008 | `func_ov008_021aafa4` |
| ov011 | `func_ov011_021d0afc`, `021d0b4c` |
| ov012 | `func_ov012_021cc01c` |
| ov013 | `func_ov013_021cb700` |
| ov015 | `func_ov015_021b5a14` |
| ov018 | `func_ov018_021ace14` |
| ov020 | `func_ov020_021ada1c` |
| ov022 | `func_ov022_021ab460` |

### A2. Some overlays — offset +0x0 (state index at field 0)

These overlays use `ldr r0, [r0]` (offset 0) instead of `+0xb6c`:

| Overlay | Entry function |
|---------|---------------|
| ov005 | `func_ov005_021acfb0` |
| ov009 | `func_ov009_021ad7d4` |
| ov014 | `func_ov014_021b26ec` |
| ov016 | `func_ov016_021b2824` |
| ov017 | `func_ov017_021b2c8c` |
| ov019 | `func_ov019_021b26d0` |
| ov021 | `func_ov021_021aa4a0` |
| ov023 | `func_ov023_021b2314` |

### A3. ov002 — two singleton variants

```
/* Variant 1: data_ov002_022d016c at +0xd18 (see DuelStateSingleton.md) */
func_ov002_021b08a8.s, func_ov002_021b07c8.s

/* Variant 2: data_ov002_022d008c at +0xd1c */
func_ov002_021b0a30.s
```

---

## Pattern B — Struct callback slots (live register, not global)

These are genuine OOP-style virtual slots — a struct pointer in a register
has multiple fn-ptr fields at different offsets.

### B1. `data_02191e60` event sink — offsets +0x20, +0x28, +0x38

A renderer/event-sink object accessed by ~11 functions in the `0x0201Fxxx` –
`0x020209xx` cluster:

```c
typedef struct EventSink {
    /* +0x000 – +0x01F  gap */
    void    (*f_20)(void *arg);   /* +0x020  callback A (null-checked) */
    /* +0x024 – +0x027  gap */
    void    (*f_28)(void *arg);   /* +0x028  callback B (null-checked) */
    /* +0x02C – +0x037  gap */
    void    (*f_38)(void *arg);   /* +0x038  primary handler (most-called) */
    void     *f_3c;               /* +0x03C  argument/context for f_38 */
    /* struct continues */
} EventSink;
extern EventSink data_02191e60;
```

Pattern in `func_0201f2f8.s` and related:
```s
ldr r2, [r0, #0x38]        ; r2 = data_02191e60.f_38
cmp r2, #0x0
beq .L_skip
blx r2
```

Functions that dispatch through `+0x38`: `func_0201f2f8`, `func_020209d0`,
`func_0201f900`, `func_0201fd70`, `func_0201fb8c`, `func_0201fcd0`,
`func_0201f514`, `func_0201ff44`, `func_020208c0`, `func_02020258`, `func_02020b4c`.

### B2. Entity/object `self` or `sl` — offsets +0x54, +0x58

```c
typedef struct Entity {
    /* +0x000 – +0x053  gap */
    void (*update)(struct Entity *self);   /* +0x054  update callback */
    void (*draw)(struct Entity *self);     /* +0x058  draw callback (null-checked) */
    /* struct continues */
} Entity;
```

- `func_0200d9fc.s`, `func_0200da18.s` — dispatch `sl->f_54` twice per call
- `func_0200dd3c.s`, `func_0200dd58.s` — null-checked `r4->f_58`
- `func_0200e9a8.s` — also hits +0x54 and +0xb0

### B3. ov011 `r6` struct — offsets +0x1c, +0x20

```c
typedef struct Ov011Handler {
    /* +0x000 – +0x01B  gap */
    void (*f_1c)(int, int, int);  /* +0x01C  called with args (r0,r1,r2=2) */
    void (*f_20)(void);           /* +0x020  called with no extra args */
} Ov011Handler;
```

`func_ov011_021d1514.s` — `r6` is arg0; calls `[r6+0x1c]` twice (different
args), then `[r6+0x20]` once.

### B4. ov010/ov015 `r7` struct — offset +0x14

```c
typedef struct Ov010Task {
    /* +0x000 – +0x00B  gap */
    void *f_c;          /* +0x00C  data arg passed as r0 to handler */
    /* +0x010 – +0x013  gap */
    void (*f_14)(void *);  /* +0x014  callback: called as f_14(r7->f_c) */
} Ov010Task;
```

`func_ov010_021b2924.s`, `func_ov015_021b2924.s` — identical pattern in
both overlays (code-sharing evidence).

### B5. ov005 `sl` struct — offsets +0x64, +0x68, +0x6c

```c
typedef struct Ov005Obj {
    /* +0x000 – +0x063  gap */
    void (*f_64)(void);   /* +0x064 */
    void (*f_68)(void);   /* +0x068 */
    void (*f_6c)(void);   /* +0x06C */
} Ov005Obj;
```

- `func_ov005_021ab858.s` — dispatches `sl->f_68` (null-checked), then `sl->f_64`
- `func_ov005_021ab6ac.s` — dispatches `r8->f_6c`

### B6. Various main structs

| Struct (register) | Offset | Call | File |
|-------------------|--------|------|------|
| `r5` | +0x0C | `blx r1` | `func_02021278.s` |
| `r5` | +0x30 | `blx r1` | `func_02022e90.s` |
| `r8` | +0xa48 | `blx r3` | `func_02005e04.s`, `02005e20.s` |
| `r4` | +0x30 (index, not ptr) | `blx r1` via table | `func_ov004_021d5b14.s` |

---

## Notes for C-matching

1. **All `blx rN` calls from struct fields require the struct member to be
   declared as a typed function pointer** — not `void *` cast at call site.
   mwcc generates different code for each.

2. **Null-checked slots** (pattern: `cmp rN, #0; beq skip; blx rN`) require
   the C source to null-check before calling:
   ```c
   if (obj->callback) obj->callback(arg);
   ```

3. **The `+0xb6c` dispatch** (Pattern A1) is always a table-indexed call, not
   a direct function-pointer load. The struct field is a `u32` state index, and
   the table base is a separate literal. MED candidates touching this pattern
   need both the struct typedef and the table declaration.
