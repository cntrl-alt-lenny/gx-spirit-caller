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
