# libs/nitro/

Vendored / reverse-engineered Nintendo DS SDK code.

## Scope

`libs/nitro/` is where code that ships with the NitroSDK lives. It is *not*
game code — decomp'd game functions go under `src/`.

This directory is consumed by `tools/configure.py`: any subdirectory named
`include/` is automatically added to the compiler search path, so headers
placed under `libs/nitro/include/nitro/*.h` can be included as
`<nitro/foo.h>` from anywhere in the tree.

## Current contents

Only header declarations, no `.c` sources yet. Headers are added as we need
them for decomp — not preemptively, so we don't drift from whatever symbol
names actually appear in `config/<ver>/**/symbols.txt`.

- `include/nitro/types.h` — primitive integer / fixed-point / BOOL typedefs
  (`u8` / `u16` / `s32` / `vu32` / `fx32` / `BOOL` / `TRUE` / `FALSE` / …).
- `include/nitro/swi.h` — declarations for the 18 Nintendo DS BIOS
  (software interrupt) thunks that appear at the top of ARM9 main:
  `VBlankIntrWait`, `IntrWait`, `CpuSet`, `CpuFastSet`, `Div`, `Mod`,
  `Sqrt`, `Halt`, `SoftReset`, `WaitByLoop`, `IsDebugger`, `GetCRC16`,
  `BitUnPack`, `LZ77UnCompReadByCallbackWrite16bit`,
  `LZ77UnCompReadNormalWrite8bit`, `RLUnCompReadByCallbackWrite16bit`,
  `RLUnCompReadNormalWrite8bit`, `HuffUnCompReadByCallback`.
- `include/nitro/os.h` — OS-subsystem core types. Enums + typedefs
  only (no function prototypes yet): `OSArenaId`, `OSHeapHandle`,
  `OSTick`, `OSIrqMask`, `OSLockWord`, and opaque forward
  declarations for `OSMutex` / `OSThread` / `OSThreadQueue`.
  Added to scaffold data-tier identity work — see
  `docs/research/data-tier-scouting.md` for the top `data_worklist`
  candidates that would bind to these types.

## Naming

Use the NitroSDK-official module prefixes when you add new files:

| Prefix  | Module                                  |
|---------|-----------------------------------------|
| `OS_*`  | operating system core (interrupts, arenas, threads) |
| `GX_*`  | 2D graphics (BG, OBJ, palette, VRAM banks) |
| `G2_*` / `G3_*` | 2D / 3D graphics submodules      |
| `FX_*`  | fixed-point math                        |
| `MI_*`  | memory / DMA                            |
| `FS_*`  | filesystem                              |
| `CARD_*`| game card / eeprom / backup             |
| `PAD_*` | input                                   |
| `SND_*` | sound                                   |
| `PXI_*` | ARM7 ↔ ARM9 IPC                         |
| `TP_*`  | touch panel                             |
| `RTC_*` | real-time clock                         |
| `WM_*`  | wireless                                |

One header per module: `libs/nitro/include/nitro/os.h`,
`libs/nitro/include/nitro/gx.h`, etc. Implementation files go next to the
header under `libs/nitro/os/`, `libs/nitro/gx/`, etc. — mirror whatever
subdivision the real SDK uses when in doubt.

## References

- [dqix libs/nitro](https://github.com/StanHash/dqix/tree/main/libs)
  — another dsd-based project; cross-reference their headers for function
  signatures we haven't figured out yet.
- [NitroSDK-Decomp](https://github.com/Arisotura/NitroSDK-Decomp)
  and related community projects — signatures and behavior of individual
  SDK functions. We reverse-engineer, we do not copy copyrighted code.
- Martin Korth's [GBATEK](https://problemkaputt.de/gbatek.htm) is the
  canonical BIOS reference for the SWI thunks in `swi.h`.

## Appendix: current named-symbol survey (EUR)

What `dsd init` actually labelled in
`config/eur/arm9/**/symbols.txt` as of the last bootstrap run:

| Category                   | Named | Location                                          |
|----------------------------|-------|---------------------------------------------------|
| BIOS / SWI thunks          | 18    | arm9 main `0x02000086–0x020007ea` (this header)   |
| CRT bootstrap              | 3     | `Entry`, `AutoloadCallback`, `main` (→ libs/runtime/) |
| `__sinit_*` static initializers | 51 | across 15 overlays (→ libs/runtime/ README has the table) |
| NitroSDK `OS_*/GX_*/FX_*/MI_*/FS_*/PAD_*/SND_*/…` | **0** | unlabelled — show up as `func_0xxxxxxx` |
| MSL libc / math            | 0     | unlabelled                                        |

The NitroSDK and MSL counts of zero don't mean they aren't in the
binary — most of the arm9 ~2 MB of code is SDK/libc. It means nobody
has identified them yet. Expect them to surface one at a time during
matching, at which point headers land here as `nitro/os.h`,
`nitro/gx.h`, and so on.

Re-run the survey after any bulk `dsd apply` or overlay fix:

```bash
# count named (non-`func_`/non-`data_`) symbols per overlay
grep -rh '^[A-Za-z_][A-Za-z0-9_]* kind:function' config/eur \
    | grep -Ev '^(func|data|_dsd)_' | awk '{print $1}' | sort | uniq -c | sort -rn
```
