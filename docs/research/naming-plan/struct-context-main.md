[//]: # (markdownlint-disable MD013 MD041)

# SystemWork — field offset reference for dossier agents

`SystemWork` (`data_02104f58`) is the arm9 main system-state singleton
returned by `GetSystemWork()`.  It is a flat BSS struct of confirmed size
**0x92c bytes** (from `src/main/bss/data_main_bss.s`, line `.space 0x92c`).
189 callers across main read or write it via `GetSystemWork() + offset`.

The fields below are confirmed from matched `.c` files in `src/main/`.
All offsets are decimal or hex relative to the struct base.

---

## Field table

| Offset | Width | R/W | Bitfield / meaning | Confirmed by |
|--------|-------|-----|--------------------|--------------|
| `+0x810` | `void*` | store | Sub-object handle pointer (stored result of `__sinit_ov007_021b2f64`); also base of a 0x20-byte marshalling buffer written by `Copy32` | `func_0201bba4`, `func_0201bea8`, `func_0201bf04`, `SysWork_ClearField0x810` |
| `+0x814` | `s32` | r/w | Gets written to 0 by `func_0201b7fc`; read by `func_02018b48`; written by `func_02018b34`. Likely a mode or phase index. | `func_02018b48`, `func_02018b34`, `func_0201b7fc` |
| `+0x81c` | `s32` | r/w | Bitfield word: bits 0..3 (4-bit field) inserted/extracted by `func_0201c198`. | `func_0201c198` |
| `+0x8d0` | `s32` | r/w | Dense bitfield word. Confirmed sub-fields: bits 0..3 (4-bit, `func_02019160` set / `func_02019124` get byte 2 / `func_020195ec` get nibble 12..15 / `func_02019594` set nibble 12..15); bits 12..15 (4-bit nibble); bits 16..23 (u8, `func_0201913c` set). | `func_02019160`, `func_02019124`, `func_020195ec`, `func_02019594`, `func_0201913c` |
| `+0x8d4` | `s32` | r/w | Dense bitfield word. Sub-fields: bits 0..15 unsigned u16 (`func_02019034`); signed byte-2 extract `(v<<8)>>24` (`func_02019664`); signed top-byte `v>>24` (`func_0201969c`); top-byte set `func_0201967c`; byte 16..23 set `func_02019640`. Also written by `func_0201b7fc` (clear bits 16..23). | `func_02019034`, `func_02019664`, `func_0201969c`, `func_0201967c`, `func_02019640`, `func_0201b7fc` |
| `+0x8d8` | `s32` | read | **Enable/gate bit:** bit 0 is a master enable flag tested by every dispatch function in the `func_0201345c`–`func_02014c3c` family. A zero bit 0 causes early return. Used as `:1 bitfield` — the canonical extraction is `lsl#31; lsr#31` (NOT `& 1`). | `func_02013aa0.s`, `func_02013b4c.s`, `func_02014bf4`, `func_02014630.s`, `func_020142b4.s`, many others |
| `+0x8dc` | `s32` | r/w | Receives the u16 low slice of `state[0x8d4]` when bit 1 of `state[0x8e0]` is clear (`func_0201b7b4`). Also read as a second parameter by several `.s` dispatch functions (e.g. `func_020142b4`, `func_0201406c`, `func_02014814`, `func_02014630`, `func_02014b28`). | `func_0201b7b4`, `.s` dispatch family |
| `+0x8e0` | `s32` | r/w | Bitfield word used as a two-bit flag register: bit 1 (mask `0x2`) is a "busy / in-callback" guard set before and cleared after `func_0201bddc` calls; bit 7 (mask `0x80`) is a separate 1-bit flag. Reading bit 1 guards the `func_0201b7b4` copy of `0x8d4→0x8dc`. | `func_0201b60c`, `func_0201b630`, `func_0201b7b4`, `func_0201bea8`, `func_0201bf04` |
| `+0x8e4` | `s32` | r/w | Multi-byte status field. Top 7 bits `>>25` give a scale index multiplied by a table value (`func_0201a0b8`). Byte 2 `(v<<8)>>24` is compared against 0xf as a threshold guard (`func_0201a3b8`, `func_0201a454`). Top byte `bits 24..31` and byte 2 `bits 16..23` have independent bit-clear functions. | `func_0201a0b8`, `func_0201a388`, `func_0201a3a0`, `func_0201a3b8`, `func_0201a454` |
| `+0x8e8` | `s32` | r/w | 8-bit field at bits 11..18. Clear function uses mask `0xfff807ff`. Set/clear pair: `func_02018a38` (insert), `func_02018a64` (clear). | `func_02018a38`, `func_02018a64` |
| `+0x8f4` | `s32` | r/w | Bitfield flag word. Bits are set via `func_0201b708` (OR), cleared via `func_0201b730` (AND~), and read/masked via `func_0201b770`. Returns a pointer to this word at `func_0201b75c` (referenced by `func_02013aa0.s` and `func_02013b4c.s` for OR 0x2000 / AND ~0x2000 operations). | `func_0201b708`, `func_0201b730`, `func_0201b770`, `func_0201b75c` |
| `+0x8f8` | `s32` | r/w | Dense bitfield word. Confirmed sub-fields: bit 11 (`func_0201a430` set, `func_0201a454` test); bit 15 (`func_02018b70` set); bit 16 (`func_02018b58` get); bits 19..21 3-bit field (`func_0201ab44` get, `func_0201ab5c` set); bit 8 (`func_02013a64` OR 0x100). | `func_0201a430`, `func_0201a454`, `func_02018b58`, `func_02018b70`, `func_0201ab44`, `func_0201ab5c`, `func_02013a64` |
| `+0x8fc` | `s32` | r/w | 1-indexed bit-array: bit `(n-1)` set by `func_0201abb0(n)`, cleared by `func_0201abd4(n)`, tested by `func_0201abfc(n)`. Semantics: per-slot enable flags, likely slots 1..8. | `func_0201abb0`, `func_0201abd4`, `func_0201abfc` |
| `+0x900` | `s32` | r/w | Multi-bit flag word. Byte 0 `(v<<24)>>24` returned by `func_0201ab2c`. Bit 24 `(v<<7)>>31` tested as a block-gate by `func_0201bbc8` and `func_0201a4dc`. Bits 19..21 + bit 21 cleared by `func_0201b7fc`. | `func_0201ab2c`, `func_0201a4dc`, `func_0201bbc8`, `func_0201b7fc` |
| `+0x908` | `fx32` | read | X-coordinate point 0 in a 2D distance pair (subtracted from `+0x910` to get dx in `SysWork_GetPointDistance`). | `SysWork_GetPointDistance` |
| `+0x90c` | `fx32` | read | Y-coordinate point 0 in a 2D distance pair (subtracted from `+0x914` to get dy). | `SysWork_GetPointDistance` |
| `+0x910` | `fx32` | read | X-coordinate point 1 in a 2D distance pair. Also used as linked-list head in `data_0218dbc8` context (`func_0200fd84`) — note that reference is on a different global, not SystemWork. | `SysWork_GetPointDistance` |
| `+0x914` | `fx32` | read | Y-coordinate point 1 in a 2D distance pair. | `SysWork_GetPointDistance` |
| `+0x918` | `s32` | read | Adjacent u32 getter: `func_0201be98` reads and returns this field. Checked == 0 by `func_0201bbc8` as a guard condition. Part of the `0x918/0x91c/0x920` adjacent triple. | `func_0201be98`, `func_0201bbc8` |
| `+0x91c` | `s32` | r/w | Round/phase counter (values 0..N): incremented by `func_02018fa0`, returned by `func_02018f80`. Upper-bound guard `>2` used by `func_02013a64`. Enum values seen: 0, `0x20000`, `0x40000`, `0x60000`, `0x80000` (from `func_0200f854.s` dispatch table — indicates this is also used as a bitmask). | `func_02018f80`, `func_02018fa0`, `func_02013a64`, `func_0200f854.s` |
| `+0x920` | `s32` | r/w | **Dispatch selector (mode/state enum):** read by `func_02018f90` getter, tested by switch in `func_02013aa0.s`, `func_02013b4c.s`, `func_02014bf4`. Values 0..10 in dense jump-table context (`func_02013b4c`) and 1/2/3 in compare-chain context (`func_02013aa0`). Written by `func_0200f854.s` alongside `0x91c` and `0x924`. | `func_02018f90`, `func_02013aa0.s`, `func_02013b4c.s`, `func_02014bf4`, `func_0200f854.s` |
| `+0x924` | `s32` | r/w | **Sub-state selector:** nested dispatch inside `func_02013aa0.s` when `state[0x920]==1`. Values 1/2/3; case 1 promotes itself to 3 then falls through. Written alongside `0x91c` and `0x920` by `func_0200f854.s`. | `func_02013aa0.s`, `func_0200f854.s` |
| `+0x928` | `s32` | read | Read as `data_02104f4c+0x928` by `func_0201934c.c` (a separate global, not SystemWork itself). Noted here for disambiguation. | `docs/research/c-match-prep/0201934c.c` |
| `+0x930` | `s32` | r/w | Written by `func_0200f854.s` from the stack arg at `[sp+0x18]`. | `func_0200f854.s` |
| `+0x934` | `s32` | r/w | Written by `func_0200f854.s` based on the second argument dispatch table (values 0, 0x4000, 0x8000, 0x10000, 0x14000, 0x18000). | `func_0200f854.s` |
| `+0x938` | `s32` | r/w | Written alongside `0x93c` and `0x918/0x91c/0x920/0x924` by `func_0200f854.s`. | `func_0200f854.s` |
| `+0x93c` | `s32` | r/w | Paired with `0x938` in `func_0200f854.s`. | `func_0200f854.s` |

---

## Stride-24 sub-array at base+0 (indexed via `func_02019210`)

Several functions use a stride-24 (`0x18`) sub-array at the very start of
SystemWork (offset 0 from the base pointer), indexed by `func_02019210(key)`.
The entry pointer is `GetSystemWork() + (func_02019210(k) - 1) * 24`.

| Entry offset | Width | Meaning | Confirmed by |
|-------------|-------|---------|--------------|
| `+0x00` | ? | Base of entry | address arithmetic |
| `+0x0c` (entry field) | `s16` | Signed 16-bit value; sign-extended with `(x<<16)>>16`; tested `<=0` | `func_02018cdc` |
| `+0x10` (entry field) | `s32` | Bit 0 is a 1-bit flag (set/clear by `func_02018e00`); bits 8..11 extracted by `func_020191dc` | `func_02018d98`, `func_02018dcc`, `func_02018e00`, `func_020191dc` |
| `+0x14` (entry field) | `u8` | Byte at entry+0x14; returned signed or unsigned | `func_02019604` |
| `+0x15` (entry field) | `u8` | Byte at entry+0x15 | `func_02019604` |
| `+0x16` (entry field) | `u8` | Byte at entry+0x16 | `func_02019604`, `func_020195b8` |
| `+a1+0x14` (variable) | `u8` | Byte at entry+a1+20 (variable offset + 20); returned unsigned | `func_020195b8` |

The entry struct is best typed as:

```c
typedef struct SysWorkEntry {     /* sizeof = 0x18 */
    /* +0x00..+0x0b: unknown fields */
    short  f0c;    /* +0x0c: signed 16-bit value */
    /* +0x0e..+0x0f: pad */
    int    f10;    /* +0x10: bitfield — bit0 enable flag, bits 8..11 sub-field */
    unsigned char f14;  /* +0x14 */
    unsigned char f15;  /* +0x15 */
    unsigned char f16;  /* +0x16 */
    unsigned char f17;  /* +0x17 */
} SysWorkEntry;
```

`func_02018bc0` computes entry addresses directly: `base + (idx-1) * 0x18`,
not `base + (idx-1) * 0x18 + some_struct_offset`.

---

## "dst+8" pattern

In the `func_02013aa0` / `func_02013b4c` family, `dst` is an `int*` argument
pointing to a caller-supplied status word buffer. The write target
`dst[2]` (i.e. `*(int*)(dst + 8)`) receives packed status codes like
`0x00010100`, `0x00020300` etc.  This is **not** a SystemWork field; it is
an output parameter of these dispatch functions.  The `dst+8` notation in
prep-file risk notes refers to this parameter write.

---

## "o->f50 / o->f4c" pattern

These field names appear in `docs/research/c-match-prep/02022608.c` and
refer to fields of `data_02197434` (a separate per-slot table at a different
global address), **not** SystemWork fields.  Specifically:

- `data_02197434[a0].f48` — read and optionally written to `*a1`
- `data_02197434 + 0x4c + (a0 << 4)` — returned as a pointer

These are unrelated to `GetSystemWork()`.

---

## Sub-struct at +0x810 (32-byte marshalling buffer)

`SysWork_ClearField0x810` zeroes 32 bytes starting at `+0x810` via `Fill32`.
`func_0201bea8` and `func_0201bf04` both call `Copy32(w+0x810, a, 0x20)` to
copy an external 32-byte record into this region before invoking a callback.
The buffer spans `+0x810..+0x82f`.  `func_02018b94` returns a pointer
to `+0x810` directly (the address-taker idiom).

---

## Summary of confirmed struct bounds

| Region | Confirmed access range | Notes |
|--------|----------------------|-------|
| Low sub-array | `+0x000..+0x017` × N entries at stride 0x18 | indexed; exact count unknown |
| Flag/mode word cluster | `+0x810..+0x82f` | 32-byte marshalling buffer |
| Bitfield word cluster | `+0x8d0..+0x8fc` | 13 confirmed 32-bit words |
| Distance / coord pair | `+0x900..+0x914` | fx32 point pair + flag word |
| State machine triple | `+0x918..+0x924` | phase + mode + sub-mode |
| Dispatch/timer words | `+0x930..+0x93c` | 4 words, role partially inferred |
| Struct total size | `0x92c` bytes | confirmed from BSS reservation |
