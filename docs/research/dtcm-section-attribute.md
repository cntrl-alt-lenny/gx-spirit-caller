# DTCM section attribute — workflow wall W5 resolution

_Brief 115 (DTCM pilot — cluster E). First production data-tier wave._

## TL;DR

DTCM data is placed via **mwasmarm `.data` section + dsd LCF auto-routing**
— no `__attribute__((section))` or `#pragma section` needed. The
mwldarm-generated LCF pulls the `.data` section of any input `.o`
claiming a DTCM address range into the `.dtcm` output section.

Files go under `src/dtcm/` (EUR-only per configure.py's region rule).
Cross-region application requires per-region IRQ-handler symbol naming
in `symbols.txt` first — see "Region neutrality" below.

## Investigation summary

The brief listed four options to investigate:

1. **`__attribute__((section(".dtcm")))` (GCC convention)** — not tested;
   mwccarm doesn't follow GCC attribute syntax for sections.

2. **`#pragma define_section DTCM ".dtcm" ... + #pragma section DTCM begin/end`
   (mwcc convention)** — works for code (`.init` section example:
   `src/overlay009/sinit_ov009_021ad8c0.c`). Not needed for DTCM data
   because the simpler "just use `.data`" path works.

3. **Per-file routing similar to `.legacy.c`** — not tested; would
   require a configure.py extension.

4. **SDK-provided macros** — `libs/nitro/include/nitro/os.h` has no
   DTCM-section macro. NitroSDK uses linker script + section
   attributes downstream; mwldarm handles the placement via LCF.

## The working recipe

### Step 1 — `.s` file (not `.c`)

mwcc emits **one `.data` section per global variable** (objdump shows
`.data` repeated for each variable). The dsd-generated LCF expects a
single `.data` section containing all DTCM symbols in address order.
Multiple `.data` sections produce wrong byte layout post-link.

The fix: use a hand-written `.s` file with one `.data` section
containing all symbols in address order. Located at `src/dtcm/`.

### Step 2 — mwasmarm syntax

mwasmarm doesn't accept GAS-style `.syntax unified` / `.include
"macros/function.inc"` directives. Use the simpler form:

```asm
; comment uses semicolon, not //

        .extern OtherSymbol
        .extern AnotherSymbol

        .data

        .global my_data_symbol
my_data_symbol:
        .byte 0xff, 0xff, 0xff, 0xff
        .word OtherSymbol            ; reloc'd by linker

        .global my_table_symbol
my_table_symbol:
        .word OtherSymbol
        .word AnotherSymbol
```

Key syntax notes:

- `.extern <name>` declares an external symbol that the linker will
  resolve. **Required for any `.word <name>` reference** to compile —
  mwasmarm doesn't auto-recognize undeclared symbols.
- `.global <name>` exports a symbol from this TU.
- `.byte` for byte arrays, `.word` for 32-bit values (incl. addresses
  → linker emits relocations).
- `.space <N>` zero-fills N bytes (used for `.bss`).
- `.data` / `.bss` switches sections.

### Step 3 — delinks.txt entry

Add a TU claim to `config/<ver>/arm9/dtcm/delinks.txt`:

```
src/dtcm/dtcm_data.s:
    complete
    .data start:0x027e0000 end:0x027e0600
    .bss start:0x027e0600 end:0x027e0620
```

dsd's `lcf` generator then routes my `.o`'s `.data` section into
the `.dtcm` output section, replacing the gap file's content.

### Step 4 — Stable cross-module relocations

Pointers to functions or data symbols whose address differs per-region
(e.g., `OSi_IrqHandlerTimer0` at 0x02090484 EUR / 0x02090388 USA) should
use the SYMBOL NAME (`.word OSi_IrqHandlerTimer0`) — mwldarm resolves
per-region.

Pointers to data symbols that are STABLE across regions (e.g.,
`data_ov004_022901f7` at 0x022901f7 in all 3 baseroms) but where the
local SYMBOL resolves to a different address due to overlay layout
shift in the current build (overlay 4 fails baseline) should use the
LITERAL ADDRESS (`.word 0x022901f7`) to bypass the broken symbol
resolution.

This is a workaround until overlay 4 module matches baseline.

## Region neutrality (current limitations)

The recipe lands DTCM **byte-identical only in EUR** for now. USA +
JPN remain at 24/27 because:

1. **`src/dtcm/` is EUR-only** per `configure.py`'s rule: source
   paths without a `src/<region>/` prefix only build under EUR.
   Moving to `libs/dtcm/` (region-neutral path) fails because:

2. **USA + JPN `symbols.txt` lack the IRQ-handler SDK names**
   (`OSi_IrqHandlerTimer0`, `OS_DefaultIrqHandler`, etc.). The linker
   refuses with "Undefined : OSi_IrqHandlerTimer1" when building USA
   or JPN.

The fix path for USA + JPN parity:

1. Cross-region apply the IRQ handler names to USA + JPN
   `symbols.txt` (per-region rename — function bodies are identical,
   just at different addresses).
2. Move `src/dtcm/dtcm_data.s` → `libs/dtcm/dtcm_data.s`
   (region-neutral path).
3. Add `libs/dtcm/dtcm_data.s` claim to all 3 regions'
   `dtcm/delinks.txt`.

This is a follow-up brief — out of scope for brief 115's pilot goal
("first 25/27 baseline in EUR").

## Results

| Region | Baseline before | After | Change |
|---|---|---|---|
| EUR | 24/27 | **25/27** | DTCM: FAILED → OK ✅ |
| USA | 24/27 | 24/27 | (blocked on IRQ symbol naming) |
| JPN | 24/27 | 24/27 | (blocked on IRQ symbol naming) |

EUR DTCM is now byte-identical against `extract/eur/arm9/dtcm.bin`
(1536 bytes, 5 symbols: 4 `.data` + 1 `.bss`).

## Symbols matched in this wave

| Symbol | Kind | Size | Address |
|---|---|---:|---|
| `data_027e0000` | data | 0x10 | 0x027e0000 |
| `data_027e0010` | data | 0x11 | 0x027e0010 |
| `data_027e0021` | data | 0x57f | 0x027e0021 |
| `OSi_IrqCallbackTable` | data | 0x60 | 0x027e05a0 |
| `OSi_IrqCheckBuf` | bss | 0x20 | 0x027e0600 |

`OSi_IrqCallbackTable` holds 24 function pointers (one per IRQ source
bit) referencing 9 distinct handlers: `OS_DefaultIrqHandler` + 4 timer
handlers + 4 DMA handlers + 2 null trailing slots.

`data_027e0021` contains an embedded 32-bit pointer at offset 0x73
(absolute 0x027e0094) referencing `data_ov004_022901f7` — kept as
literal `.word 0x022901f7` to bypass the overlay-4-baseline-failure
symbol resolution issue.

## Reusability for cluster A/B/C/D

The recipe (`.s` + `.data` + dsd auto-routing) generalizes to other
data-tier waves:

- **Cluster A (`.bss`)**: same recipe — `.bss` directive + `.space`
  for zero-init. No external relocs needed (BSS is uninit).
- **Cluster B/C (small scalars / arrays in `.data`)**: same recipe.
  Likely doable in `.c` if symbols can be batched into a single TU
  via `#pragma section` — needs A-tier work to confirm.
- **Cluster D (jump tables / large initialized arrays)**: same `.s`
  recipe. Function-pointer arrays follow the OSi_IrqCallbackTable
  pattern.

Brief 116 (cluster A `.bss` wave) inherits this recipe directly.
