[//]: # (markdownlint-disable MD013 MD041)

# GlobalData02104bac

Global variable at `0x02104BAC` with a `u16 flags` field at offset +0x54.
Accessed by at least three matched C functions in `src/main/`, each with
an identical windowed typedef. Likely a system control / status flags word
for a subsystem that initializes 0x54+ bytes of state before writing flags.

## Confidence: HIGH

Three independently matched C files define the same typedef and access the
same field at the same offset.

## C Definition

```c
typedef struct GlobalData02104bac {
    char           _pad[0x54]; /* +0x000  padding (unaccessed) */
    unsigned short flags;      /* +0x054  system status / control flags */
    /* fields beyond +0x056 unknown */
} GlobalData02104bac;

extern GlobalData02104bac data_02104bac;
```

## Layout evidence

| Offset | Width | R/W | Source file |
|--------|-------|-----|-------------|
| +0x054 | u16 | r/w | `func_0200aae4.c`, `func_0200ab28.c`, `func_0200ab6c.c` |

## Using functions

- `func_0200aae4` — reads/writes `data_02104bac.flags`
- `func_0200ab28` — reads/writes `data_02104bac.flags`
- `func_0200ab6c` — reads/writes `data_02104bac.flags`

## Notes

The `flags` field at +0x54 is the only observed access — the first 0x54
bytes are either initialized by an early startup function not yet matched,
or they are part of a contiguous struct that begins earlier in memory.
The +0x54 offset (84 bytes) is large for pure padding; there may be 21
additional 4-byte fields (or a mix) in the gap.
