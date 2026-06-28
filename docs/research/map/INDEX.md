# Function Map — GX Spirit Caller — Index

## Coverage

| Module | Total fns | Named | Matched(.c) | Ship(.s) | HIGH | MED | LOW |
|--------|-----------|-------|-------------|----------|------|-----|-----|
| main_a | 315 | 26 | 103 | 174 | 38 | 107 | 4 |
| main_b | 364 | 3 | 175 | 186 | 121 | 79 | 0 |
| main_c | 335 | 1 | 136 | 198 | 73 | 76 | 1 |
| overlay000 | 152 | 0 | 83 | 60 | 107 | 36 | 9 |
| overlay001 | 6 | 0 | 0 | 6 | 5 | 1 | 0 |
| overlay002_a | 1881 | 0 | 516 | 1353 | 99 | 1782 | 12 |
| overlay002_b | 105 | 0 | 13 | 92 | 13 | 92 | 0 |
| overlay003 | 35 | 1 | 14 | 20 | 34 | 0 | 0 |
| overlay004 | 301 | 1 | 99 | 201 | 85 | 197 | 0 |
| overlay005 | 87 | 5 | 53 | 34 | 71 | 7 | 9 |
| overlay006 | 406 | 1 | 226 | 169 | 82 | 68 | 0 |
| overlay007 | 34 | 0 | 23 | 11 | 28 | 6 | 0 |
| overlay008 | 92 | 1 | 21 | 70 | 90 | 2 | 0 |
| overlay009 | 35 | 0 | 17 | 18 | 35 | 0 | 0 |
| overlay010 | 107 | 0 | 48 | 56 | 88 | 16 | 0 |
| overlay011 | 207 | 1 | 114 | 92 | 120 | 54 | 8 |
| overlay012 | 24 | 1 | 7 | 16 | 21 | 2 | 0 |
| overlay013 | 16 | 5 | 1 | 10 | 15 | 1 | 0 |
| overlay014 | 33 | 3 | 7 | 23 | 4 | 29 | 0 |
| overlay015 | 75 | 7 | 32 | 36 | 63 | 6 | 4 |
| overlay016 | 81 | 37 | 37 | 44 | 75 | 6 | 0 |
| overlay017 | 60 | 0 | 29 | 31 | 50 | 8 | 0 |
| overlay018 | 29 | 0 | 20 | 9 | 29 | 0 | 0 |
| overlay019 | 44 | 0 | 19 | 25 | 39 | 5 | 0 |
| overlay020 | 49 | 0 | 20 | 29 | 49 | 0 | 0 |
| overlay021 | 40 | 4 | 24 | 12 | 39 | 1 | 0 |
| overlay022 | 15 | 0 | 0 | 15 | 15 | 0 | 0 |
| overlay023 | 3 | 0 | 0 | 3 | 3 | 0 | 0 |

## Module summaries

### main_a

`main_a` is the ARM9 main-module kernel: the lowest-level runtime bootstrap, IRQ/DMA/timer handler stubs, system-work singleton accessor, task-queue manager, linked-list primitives, and a large block of NitroSDK SVC/BIOS thunks. The first ~0x800 bytes (addr 0x02000086–0x0200078a) hold thumb-mode SVC stubs that are pure trampolines into BIOS calls (VBlankIntrWait, Div, CpuSet, LZ77/RL/Huff/CRC/Sqrt etc.).

### main_b

The 0x0201xxxx address block is the heart of the ARM9 main module, containing the mid-game logic layer for GX Spirit Caller. It owns the system-state singleton accessed via `GetSystemWork()` (a 0x92c-byte BSS struct at `data_02104f58`) and a dense family of getter/setter/bitfield wrappers operating on that struct at offsets 0x8d0–0x924.

### main_c

The 0x0202xxxx address block is the upper layer of the ARM9 main module for GX Spirit Caller. It divides cleanly into four subsystems.

### overlay000

Overlay000 is the **dual-screen display manager and card/character animation kernel** for the Yu-Gi-Oh! GX Spirit Caller main gameplay scene.

### overlay001

Overlay001 is a small display/task bootstrap overlay (6 functions, 448 bytes of code). Its primary role is to initialise the two NDS graphics engines for a particular game screen and register tasks with the Task system.

### overlay002_a

overlay002_a is the battle engine lower half of GX Spirit Caller's duel overlay (ov002), spanning 0x021aa4a0 to 0x02228fff. This module implements the full card-resolution and duel-state pipeline: it manages per-player card slot arrays (indexed by `(player & 1) * 0x868`), dispatches card effect events through the central command queue (`func_ov002_0229ade0`, event 0x31 with sub-codes 0–0xd+), maintains a pseudo-random number generator (LCG seeded in the duel-state block `data_ov002_022d016c`)...

### overlay002_b

overlay002_b is the upper half of GX Spirit Caller's duel battle engine overlay (ov002), spanning 0x02229000 to 0x0222ffc0 (105 functions, 0x10fc0 bytes). This section of the overlay houses a dense cluster of per-card effect state-machine handlers, each of which reads a global battle-state phase counter (`data_ov002_022ce288+0x5a8`) and dispatches on phase codes in the 0x60–0x80 range (equivalently 0x64, 0x77–0x80, 0x7a–0x80, etc.), driving the card-resolution pipeline through sequences of gu...

### overlay003

Overlay003 is the **card duel UI scene** overlay — it manages the full lifecycle of a two-player duel screen on the Nintendo DS. Its primary function (`func_ov003_021ca2bc`, size 0x18bc, the largest in the module) is a monolithic scene-setup routine that: allocates and configures BG tile layers on both engines, fills BG tile maps using `Bg_FillTileRect`, loads sprite/GFX data into VRAM banks, sets up a 4-stream GX FIFO push arrangement (`func_ov003_021ca254`), renders the name and deck-size t...

### overlay004

Overlay 004 is the game's **Trade/Communication UI and wireless networking layer** for Yu-Gi-Oh! GX Spirit Caller.

### overlay005

Overlay005 implements a **card-list / deck-selector UI widget** for the Yu-Gi-Oh! GX Spirit Caller DS game.

### overlay006

Overlay006 is the **duel-mode game-flow state machine** — the central runtime for a Yu-Gi-Oh! GX Spirit Caller duel session.

### overlay007

Overlay 007 implements the **puzzle-board cell-grid UI layer** for the sub-screen. It manages two work-block controllers (`data_ov007_022334d0` and `data_ov007_0223352c`) that each run independent 3-state machines (states 0/1/2 at `+0x34/+0x38` and `+0x08/+0x0c`).

### overlay008

Overlay 008 implements the **duel card-field and hand-display sub-system** for the Yu-Gi-Oh! GX Spirit Caller duel scene.

### overlay009

Overlay009 is the **duel-result / score-submission scene** — the screen that appears after a duel ends to reveal the outcome (win/lose), display accumulated LP differences, and commit the result to the persistent game state. The module owns two cooperating sub-objects: a *score controller* (stored at `data_ov009_021adc54`, ~0x40 bytes) that drives a 3-state fade-in animation and a touch/stylus detection loop, and an *entry panel controller* (at `data_ov009_021adc00`) that manages a single spr...

### overlay010

Overlay 010 is the game's **two-panel Spirit Card Selection / Duel Entry UI** — the screen where the player browses their active spirit cards across two independent scroll-list managers (referred to below as manager-A at `data_ov010_021b9884` and manager-B at `data_ov010_021b91b4`) before committing to a duel. The module owns a large BSS region (021b8xxx–021b9xxx) containing per-panel cursor and selection state, scroll-window geometry, object handle tables, and sub-engine display config.

### overlay011

Overlay011 is the **world-map / field-view overlay** — the in-game screen that shows the player navigating the game world. Its two large state blobs (`data_ov011_021d4000`, 0xC00+ bytes, and `data_ov011_021d403c`) hold the entire view state: scroll coordinates, view-mode (0=normal, 1=mini, 3=focus), blend/fade registers (`+0x2b0`, `+0x2bc`), actor-slot records for up to five on-screen entities, and ten coord-array slots (stride 0x28, base `data_ov011_021d4660`) tracking moving world objects.

### overlay012

Overlay012 is the **save-slot selection / title-screen UI overlay** for GX Spirit Caller. Its central role is presenting the player with one or more save-file panels (up to one visible at a time, keyed by a 4-bit slot index), handling stylus/button input to switch between them, triggering save-load operations (via `func_02018b48`/`func_02018b94`), and kicking off the correct intro transition when the player confirms a slot.

### overlay013

Overlay013 implements the **Duel Monster / Deck-slot selection UI** — a paginated overlay that lets the player browse available monsters in slot-grid form, pick one (or confirm an action), and animate a slide or fade transition between pages. The module owns two large BSS work-blocks (`data_ov013_021cbc00` / `data_ov013_021cbc3c`) that hold the UI state machine (page index, blend alpha in fixed-point, a handle for `Task_InvokeLocked`, and an 18-state sub-step counter packed into bitfields).

### overlay014

Overlay 014 implements a **paired-pane scene controller** for the touch-driven duel UI. Its core responsibility is managing two symmetrical display panes (pane-A at `data_ov014_02235094`, pane-B at `data_ov014_022350f4`) through their full lifecycle: initialisation, per-frame animation ticking, and teardown.

### overlay015

Overlay015 is a **scrollable text/card-list display** overlay — the primary render layer that implements a vertically scrolling list widget (a scroller object), draws stylized card/glyph cells into VRAM-backed tile windows, and manages the two status-value fields shown alongside it. The scroller struct (anchored at `+0x54`/`+0x5c`/`+0x60`/`+0x68`/`+0x70`) drives scroll-target computation, dirty-bit management, and momentum animation.

### overlay016

Overlay 016 is the **deck/card-list viewer** overlay — the browsable screen where the player inspects card collections, likely the Duel Deck editor or card catalogue UI. Evidence: it maintains a sorted list of card records (each 0x54 bytes), performs quicksort-style swaps and comparisons on a field at +0x0c (sort key), renders a scrollable grid of card art sprites via dual OAM object builders (layer 1 and layer 2), draws card stat panels (ATK/DEF/Level as 0–99 two-digit numbers), renders a pa...

### overlay017

Overlay 017 implements a dual-screen card shop/selection scene for Yu-Gi-Oh! GX Spirit Caller.

### overlay018

Overlay018 implements the **dual-screen card selection / Life Points counter UI** used during duels in Yu-Gi-Oh! GX Spirit Caller.

### overlay019

Overlay 019 implements a paired dual-scene UI sequence — most likely a duel/opponent result or card-selection flow that requires both DS screens to operate in sync. The module manages two independent scene objects (`data_ov019_021b5e70` = scene-A, `data_ov019_021b6848` = scene-B) throughout their full lifecycle: per-frame update, input hit-testing, number-sprite rendering, glyph staging, and teardown.

### overlay020

Overlay 020 is the **Deck Edit / Collection Browse** screen — the UI layer that lets the player build and inspect their dueling deck. The overlay manages two side-by-side card-list panels (the player's collection and the current deck), renders their tilemap rows into VRAM, and handles stylus hit-testing against the card-slot grid.

### overlay021

Overlay021 is the **Name Entry / Duel-Name Selection** scene — the UI screen where the player inputs or selects a duelist name (or opponent name) before a duel. The module owns two parallel sub-state machines driven by `Scene_Update`: one (021aaa40) manages the scrolling glyph-list that animates in from the sub-screen (it builds a circular strip of up to 80 name-card entries, scrolls them to a capture-register-backed VRAM surface on the DSi sub LCD, and signals completion); the other (021ab09...

### overlay022

Overlay022 is a **Duelist Card / Name-Reveal scene** — a display overlay that manages the visual presentation of a set of 13 "character slot" cards on the DS main screen, together with animated VRAM colour-rotate effects on the sub-screen. Its role in the overlay roster is confirmed by ov010/ov015's comment that a cross-overlay call at `021aa4a0` resolves across the group {ov000, ov002, ov005, ov008, ov009, ov018, ov020, ov021, ov022}: all members of that set are game-flow scene overlays shar...

### overlay023

overlay023 is a tiny 3-function overlay (0x021b2280–0x021b236b) that implements a self-contained callback-dispatch state machine, structurally identical to the dispatcher families seen in ov004, ov006, and related overlays. The overlay owns a small BSS block: `data_ov023_021b23a0` (8 bytes — state index + reset slot) and `data_ov023_021b23a8` (0x58 bytes — scratch/context buffer), plus a rodata-like `data_ov023_021b2380` function-pointer table.

## Files in this directory

- INDEX.md
- NAMES.md
- _names_main_a.md
- _names_main_b.md
- _names_main_c.md
- _names_overlay000.md
- _names_overlay001.md
- _names_overlay002_a.md
- _names_overlay002_b.md
- _names_overlay003.md
- _names_overlay004.md
- _names_overlay005.md
- _names_overlay006.md
- _names_overlay007.md
- _names_overlay008.md
- _names_overlay009.md
- _names_overlay010.md
- _names_overlay011.md
- _names_overlay012.md
- _names_overlay013.md
- _names_overlay014.md
- _names_overlay015.md
- _names_overlay016.md
- _names_overlay017.md
- _names_overlay018.md
- _names_overlay019.md
- _names_overlay020.md
- _names_overlay021.md
- _names_overlay022.md
- _names_overlay023.md
- main_a.md
- main_b.md
- main_c.md
- overlay000.md
- overlay001.md
- overlay002_a.md
- overlay002_b.md
- overlay003.md
- overlay004.md
- overlay005.md
- overlay006.md
- overlay007.md
- overlay008.md
- overlay009.md
- overlay010.md
- overlay011.md
- overlay012.md
- overlay013.md
- overlay014.md
- overlay015.md
- overlay016.md
- overlay017.md
- overlay018.md
- overlay019.md
- overlay020.md
- overlay021.md
- overlay022.md
- overlay023.md
