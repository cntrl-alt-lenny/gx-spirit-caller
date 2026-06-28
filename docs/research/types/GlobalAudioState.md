[//]: # (markdownlint-disable MD013 MD041)

# GlobalAudioState

Large global singleton `data_021040ac` (BSS, ~0xAF8 bytes confirmed; field
accesses reach 0xC48, implying true size ≥ 0xC4C). Functions across at least
4 matched C files provide complementary windows into this struct.
Likely: NitroSDK sound / SND / SEQ manager state, or the game's
custom audio/scheduler layer.

## Confidence: MEDIUM-HIGH

Four matched C files, each with a distinct (partial) typedef for the same
global, together spanning offsets 0x000 to 0xC48. BSS size inferred from
symbol layout is ~0xAF8 (but field access at 0xC48 contradicts this — the
BSS region likely extends to cover the neighbouring symbol; true size is
probably 0xC50 or rounded to 0xD00).

## C Definition (union of all windowed typedefs)

```c
typedef struct GlobalAudioState {
    void          *f0;      /* +0x000  (pointer; written by func_020057dc) */
    int            f4;      /* +0x004  (probably padding; not accessed) */
    /* ... gap ... */
    int            f3c;     /* +0x03C  read by func_02000ec8 */
    /* ... gap ... */
    unsigned short f54;     /* +0x054  flags — same field in 3 matched files */
    /* ... gap +0x056..+0xB63 ... */
    int            fb64;    /* +0xB64  read by func_02000ec8 */
    int            fb6c;    /* +0xB6C  r/w by func_020057dc */
    int            fb70;    /* +0xB70  r/w */
    int            fb74;    /* +0xB74  r/w */
    int            fb78;    /* +0xB78  r/w */
    int            fb84;    /* +0xB84  r/w by func_02012cc8 */
    int            fb88;    /* +0xB88  r/w */
    int            fb8c;    /* +0xB8C  r/w */
    /* +0xB90..+0xB9F  gap */
    int            fba0;    /* +0xBA0  store */
    int            fba4;    /* +0xBA4  r/w */
    /* +0xBA8..+0xBAF  gap */
    int            fbb0;    /* +0xBB0  r/w */
    int            fbb4;    /* +0xBB4  store */
    /* +0xBB8..+0xBBB  gap */
    int            fbbc;    /* +0xBBC  store */
    int            fbc4;    /* +0xBC4  r/w */
    int            fbc8;    /* +0xBC8  store */
    /* ... gap ... */
    int            fc3c;    /* +0xC3C  r/w */
    int            fc40;    /* +0xC40  r/w */
    int            fc44;    /* +0xC44  r/w */
    int            fc48;    /* +0xC48  r/w */
    /* ... additional fields not yet seen ... */
} GlobalAudioState;         /* sizeof >= 0xC4C */
```

## Files and their view windows

| File | Offsets accessed |
|------|-----------------|
| `func_02000ec8.c` | 0x3C, 0xB64 |
| `func_0200ab28.c` / `func_0200ab6c.c` / `func_0200aae4.c` | 0x54 (u16 flags) |
| `func_020057dc.c` | 0x000 (ptr), 0xB6C, 0xB70, 0xB74, 0xB78 |
| `func_02012cc8.c` | 0xB84, 0xB88, 0xB8C, 0xBA0, 0xBB0, 0xBB4, 0xBBC, 0xBC4, 0xBC8, 0xC3C–0xC48 |
| `func_02012560.c` | 0xB84, 0xB88, 0xB8C, 0xBA0, 0xBA4, 0xBBC, 0xBC0, 0xC3C–0xC48 |

## Key fields identified

- **+0x000 `f0` (ptr):** likely pointer to active playback buffer or SEQ data
- **+0x054 `f54` (u16):** flags checked and set by 3 separate interrupt-sized
  functions — most likely a system-wide audio-enable / mode flags word
- **+0xB6C–0xB78:** four consecutive 4-byte counters/timers — playback
  position, sample count, or frame offset
- **+0xBB0/0xBB4/0xBBC:** frequently written together — likely channel volume
  registers or mixer coefficients
- **+0xC3C–0xC48:** four consecutive words r/w by two different functions —
  probably SEQ/channel parameters for a specific audio track

## Using functions

- `func_02000ec8` — checks 0x3C and 0xB64 (init / gate condition)
- `func_0200aae4`, `func_0200ab28`, `func_0200ab6c` — check/set `flags` at 0x54
- `func_020057dc` — writes 0x000 ptr, updates counters 0xB6C–0xB78
- `func_02012cc8` — main update/tick function, heavy 0xB84–0xC48 r/w
- `func_02012560` — secondary update; mirrors 02012cc8's range

## Notes

The neighbouring global `data_02104bac` (3 functions access `u16 flags` at
offset 0x54 from ITS base) is a different object at a different address —
do not confuse with GlobalAudioState's +0x054 field.
