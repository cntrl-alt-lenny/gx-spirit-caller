# Naming plan — INDEX

Generated 2026-06-28 from docs/research/map/NAMES.md + per-overlay _names_*.md files.

## Scope

Only functions currently named `func_XXXXXXXX` or `func_ovNNN_XXXXXXXX` in
`config/eur/arm9/symbols.txt` (or per-overlay equivalents) are included.
Functions that already carry non-generic names in symbols.txt are excluded:

Excluded (already named in arm9/symbols.txt):
`VBlankIntrWait`, `LZ77UnCompReadByCallbackWrite16bit`, `RLUnCompReadByCallbackWrite16bit`,
`Div`, `CpuSet`, `BitUnPack`, `Mod`, `HuffUnCompReadByCallback`, `WaitByLoop`,
`IsDebugger`, `LZ77UnCompReadNormalWrite8bit`, `CpuFastSet`, `Halt`, `GetCRC16`,
`RLUnCompReadNormalWrite8bit`, `IntrWait`, `Sqrt`, `SoftReset`, `Entry`,
`AutoloadCallback`, `BuildInfo`, `main`, `Task_InvokeLockedIrq`, `Task_PostLocked`,
`Task_InvokeLocked`

## Module summary

| file | module(s) | HIGH | MED | LOW | total |
|---|---|---|---|---|---|
| main-naming.md | Runtime_, StateMain_, CardSlot_, CardField_, Card_, IRQ_, Gfx_, SysInit_, SysMain_, Task_, Str_, Net_, Render_, Overlay_, SysWork_, Duel_, Mtx_, Match_, NARC_, Obj_, DB_, BattleObj_, Track_, Anim_, Sprite_, SpiritObj_, CardCtx_, CardCtx2_, CardDisplay_, Main_, Util_ | ~165 | ~275 | ~10 | ~450 |
| overlay-naming.md | Ov000_ | 44 | 1 | 0 | 45 |
| overlay-naming.md | Ov005_ (CardList_, CardEntry_) | 43 | 0 | 0 | 43 |
| overlay-naming.md | Ov006_ (State1-8, CardSlot_, CardPool_, Slot_, Pool_, DuelObj_, Battle_, Engine_, Deck_) | 130 | 0 | 0 | 130 |
| overlay-naming.md | Ov007_ (WorkA, WorkB, Cell, CursorBlock, Table) | 37 | 0 | 0 | 37 |
| overlay-naming.md | Ov009_ (ScoreCtrl, BgCtrl, EntryPanel, SceneCtrl, HitTest, Scene) | 40 | 0 | 0 | 40 |
| overlay-naming.md | Ov011_ (ViewState, TileClass, ScrollState, CellHandle, Blend) | 60 | 0 | 0 | 60 |
| overlay-naming.md | Ov012_ (spirit slot selection, OAM, GPU) | 20 | 2 | 0 | 22 |
| overlay-naming.md | Ov013_ (OAM task, page enumerate, activate, step) | 9 | 2 | 0 | 11 |
| overlay-naming.md | Ov015_ (Scroller, ScrollPos, TextPrinter, Glyph, Tile, VRAM, Scene) | 55 | 0 | 0 | 55 |
| overlay-naming.md | Ov021_ (Display, GlyphLayout, CardGrid, LCG, Capture, Scene) | 40 | 0 | 0 | 40 |
| **TOTAL** | 30 modules | **~643** | **~280** | **~10** | **~933** |

## How to apply (byte-neutral)

Each rename is a two-step operation:
1. `git mv` the source file from `func_XXXXXXXX.c` → `ProposedName.c`
2. Regex-replace the old symbol name across `config/` and `src/`

The rename does NOT change compiled output because:
- The symbol name in symbols.txt determines what the linker emits
- The .c filename has no effect on object code
- No header guards or includes reference `func_XXXXXXXX` by convention

### Recipe (per function)

```bash
OLD=func_02001174  # example: Mtx_Multiply3x3
NEW=Mtx_Multiply3x3
OV=                # leave empty for arm9 main; set to e.g. ov006 for overlays

# 1. Rename the .c file (arm9 main)
git mv src/main/${OLD}.c src/main/${NEW}.c

# 1b. For overlay functions:
# git mv src/overlay006/${OLD}.c src/overlay006/${NEW}.c

# 2. Replace symbol name in config/eur arm9 symbols.txt (main)
#    (use PowerShell on Windows — sed corrupts UTF-16)
(Get-Content config/eur/arm9/symbols.txt) -replace "\b${OLD}\b", "${NEW}" |
  [System.IO.File]::WriteAllLines(
    (Resolve-Path config/eur/arm9/symbols.txt),
    $_,
    [System.Text.UTF8Encoding]::new($false))

# 2b. For overlay functions replace in overlay symbols.txt:
#    config/eur/arm9/overlays/${OV}/symbols.txt (same PowerShell pattern)

# 3. Replace in any .c/.s/.h files that reference the old name:
Get-ChildItem -Recurse -Include *.c,*.s,*.h src,config |
  ForEach-Object {
    (Get-Content $_.FullName) -replace "\b${OLD}\b", "${NEW}" |
      [System.IO.File]::WriteAllLines(
        $_.FullName,
        $_,
        [System.Text.UTF8Encoding]::new($false))
  }
```

### Gotchas

- `.s` files may call the function by its assembly label — always search `src/` for the old name before declaring done.
- `config/eur/arm9/symbols.txt` uses UTF-16 LE on disk (Windows line-endings). Use `WriteAllLines` + `UTF8Encoding($false)` as shown above; do NOT use PowerShell `>` redirect or `Set-Content` without `-Encoding utf8` — both corrupt or truncate the file.
- For USA/JPN ports (`src/usa/`, `src/jpn/`) also replace in `config/usa/**` and `config/jpn/**` symbols files.
- Verify after rename: `ninja check` (dsd symbol consistency) should pass with 0 errors. Do NOT run `ninja` (full build) as part of the naming pass — it is out of scope for a byte-neutral rename.
- Do NOT rename data symbols (`data_XXXXXXXX`). This plan covers only function symbols.

## Files

- [main-naming.md](main-naming.md) — arm9 main rename table (~450 entries)
- [overlay-naming.md](overlay-naming.md) — overlay rename table (~483 entries)
