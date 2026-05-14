# libs/ region-naming — cross-apply decision (brief 073)

**Verdict:** ⭐ **Approach A — per-region rename to match EUR's port
names — extended to cover data symbols.** Ships
`tools/cross_apply_libs_port.py` automating the per-region work.
Smoke-tested on `libs/nitro/func_02007218.legacy.c`: all three
regions (EUR / USA / JPN) hold 24/27 module baseline after the
cross-apply.

## Problem statement

Brief 064 part 2 (PR #419) carved `libs/` as region-neutral —
`configure.py`'s filter (PR #420) makes all three regions' builds
walk `libs/`. Brief 069's spec promised:

> "Each port unlocks EUR + USA + JPN simultaneously since `libs/`
> is region-neutral."

Brief 071 wave 2 (PR #445) surfaced the gap: the libs/ port `.c`
files **declare EUR-keyed symbol names** (`func_<eur_addr>`,
`data_<eur_addr>`) but USA + JPN have **different placeholder
names at the byte-equivalent addresses**. The shared `.c` file's
declarations don't resolve against USA's / JPN's `symbols.txt`,
so the linker fails (or — worse — adding the delinks entry
without renaming the symbol cascades into 27 module checksum
failures as in PR #445).

Concrete example from this brief's smoke-test:

| Region | Function at byte-equivalent addr | Data symbol |
|---|---|---|
| EUR | `func_02007218` @ 0x02007218 | `data_020c3f48` |
| USA | `func_020071fc` @ 0x020071fc | `data_020c3e68` |
| JPN | `func_020071fc` @ 0x020071fc | `data_020c3e68` |

Our `libs/nitro/func_02007218.legacy.c` declares `func_02007218`
and references `data_020c3f48` — fine for EUR, broken for USA +
JPN.

## Approach A vs B (brief 073's split)

The brief sketched two paths:

### Approach A — per-region rename to EUR's port names

Rename USA's `func_020071fc` → `func_02007218` (and analogous data
symbol). Same for JPN. EUR keeps its names unchanged.

- ✅ Mechanical, well-understood — uses existing
  `tools/rename_symbol.py`.
- ✅ Doesn't touch the 87 existing port `.c` files.
- ✅ Smoke-tested end-to-end in this brief: all 3 regions hold
  24/27.
- ⚠️ Semantic noise — `func_02007218` in USA's `symbols.txt`
  pretends to be at 0x02007218 when it's really at 0x020071fc.
  The naming carries a region-specific tell.

### Approach B — refactor libs/ to upstream NitroSDK names

Rename `libs/nitro/func_02007218.legacy.c` to declare
`OSi_GetUnusedThreadId` (the upstream NitroSDK name). Then rename
all three regions' symbols.txt to use the same NitroSDK name.

- ✅ Long-term clean: `libs/nitro/` becomes semantically
  meaningful.
- ✅ Symbol-archaeology bonus — 87 placeholders → 87 NitroSDK
  names "for free" (the upstream name is already known per
  brief 070's byte-fingerprint index).
- ⚠️ Bigger one-time refactor: 87 port `.c` files modified +
  87 × 3 = 261 symbol renames.
- ⚠️ Risk surface: cross-TU reference cascade could miss
  references in `src/<region>/` files.

## Smoke-test result — Approach A extended

**Worked example**: `libs/nitro/func_02007218.legacy.c` (ported
from pokediamond's `arm9/lib/NitroSDK/src/OS_thread.c::OSi_Get_
UnusedThreadId`).

### Pass 1: function rename only (insufficient)

The initial Approach A as scoped in brief 073 covered only the
function-name rename. Result on USA build:

```text
mwldarm.exe: Undefined : "data_020c3f48"
mwldarm.exe: Referenced from "func_02007218" in func_02007218.legacy.o
mwldarm.exe: alert: Link failed.
```

The port also references `data_020c3f48` (EUR address). USA's
linker can't resolve it — USA's data symbol is at
`0x020c3e68`. **Approach A as initially scoped is incomplete.**

### Pass 2: function + data rename (works)

Extended Approach A to also rename the byte-equivalent data
symbol via `port_to_region`'s parallel-reloc map (PR #419 —
exact same bridge port_to_region uses cross-region). For each
data symbol the port references, the parallel-reloc map gives
us the byte-equivalent target-region address. Rename that.

Smoke-test on `func_02007218.legacy.c` after Pass 2:

| Region | Symbols.txt rename | Delinks entry | Module-check OK |
|---|---|---|---|
| **EUR** | (unchanged — port uses EUR names) | (pre-existing) | **24/27** ✓ |
| **USA** | `func_020071fc` → `func_02007218`; `data_020c3e68` → `data_020c3f48` | `libs/nitro/func_02007218.legacy.c @ 0x020071fc` | **24/27** ✓ |
| **JPN** | `func_020071fc` → `func_02007218`; `data_020c3e68` → `data_020c3f48` | `libs/nitro/func_02007218.legacy.c @ 0x020071fc` | **24/27** ✓ |

All 3 regions retain their 24/27 baseline. The cross-apply on
this single port contributes match-equivalents to USA + JPN —
the 3× compounding multiplier brief 073 was aiming for.

## Decision: Approach A extended

**Recommendation: Approach A, extended to cover data symbols.**

The smoke-test makes it work end-to-end with manageable scope:
the existing 87 ports don't need `.c`-file refactoring; the
per-region work is fully mechanical via the new tool.

Approach B remains a long-term option (semantically cleaner) but
would require:

1. Lookup each port's upstream NitroSDK name (have it from brief
   070's `upstream_to_local_index` — cached + queryable).
2. Refactor 87 `.c` files to declare upstream names.
3. Rename in 3 regions' symbols.txt.
4. Audit `src/<region>/` for any references to the old
   `func_<addr>` names that would need cascading.

That's a much bigger refactor scope. Approach A's smoke-test
result shows we get the 3× multiplier without taking on Approach
B's risk surface, so Approach A is the right starting point.

**Approach B remains the right long-term move** for symbol
hygiene — defer to brief 076+ once the 87-port batch lands via
Approach A and we have telemetry on how often the EUR-address
naming actually trips decomper iteration.

## Tooling — `tools/cross_apply_libs_port.py`

Automates the per-region work for one port:

```bash
# Cross-apply ONE port to USA + JPN
python tools/cross_apply_libs_port.py \
    libs/nitro/func_02007218.legacy.c

# Dry-run preview
python tools/cross_apply_libs_port.py <port> --dry-run

# Specific regions
python tools/cross_apply_libs_port.py <port> --regions usa

# JSON output for batch wrappers
python tools/cross_apply_libs_port.py <port> --format json
```

Per region, the tool:

1. Parses the port filename for the EUR address.
2. Locates the byte-equivalent placeholder via `find_region_siblings`'s
   HIGH candidate (sim ≥ 0.99) — refuses if multiple candidates tie
   (mirrors PR #448's `callee-ambiguous` defensive shape).
3. Renames the function symbol via `tools/rename_symbol.py`.
4. Scans the port's `.c` source for `data_<addr>` references.
5. For each, looks up the byte-equivalent target-region address
   via `port_to_region.derive_data_address_mapping` (PR #419's
   parallel-reloc map). Renames each data symbol via
   `rename_symbol.py`.
6. Appends a `libs/nitro/<port>.legacy.c` entry to the target
   region's `delinks.txt` at the region-local address.

Idempotent: re-running on an already-cross-applied port is safe
(the delinks-append checks for an existing entry; the rename
fails cleanly if the new name is already in use).

Refuses cleanly when:

- The byte-equivalent placeholder isn't uniquely identifiable
  (multiple HIGH candidates in the target region).
- A data ref has no parallel-reloc match (reloc tables differ
  structurally — would need manual remap).
- A rename collides with an existing symbol name.

## Pilot batch — what's next

This research PR ships the tool + one worked example
(`func_02007218.legacy.c`).

Brief 075 picks up the **full 87-port batch**. Per-port
verification (each port × 3 regions × `ninja rom` + `dsd check`)
is significant manual labour; brain's call on whether to scope
brief 075 as cloud-mechanical or decomper-driven.

### Estimated pilot timing

For the 87-port batch:

- Cross-apply: ~ seconds per port (tool is fast)
- Rebuild + verify USA + JPN: ~ 5-10 minutes per port (each
  needs `ninja rom` + `dsd check modules` to confirm 24/27
  baseline holds)

Total wall-clock: ~ 10-20 hours of build cycles. Decomper-driven
parallelization across multiple sessions seems right.

### Per-port risk

The smoke-test surfaced one extension (data refs). Other ports
may surface more:

- Ports referencing data symbols across multiple modules
  (parallel-reloc map covers same-module only; cross-module
  data refs would need a different bridge).
- Ports with no clean byte-equivalent in USA/JPN (rare — the
  byte-fingerprint pipeline already confirms the pairing).
- Ports whose USA/JPN equivalent has been hand-renamed by
  decomper to something other than `func_<addr>` (the rename
  would collide). The tool refuses cleanly here; manual remap
  is needed.

## Brain accountability (carried from brief 073 spec)

> The "small follow-up" guidance in state.md + the brief 071
> wave-2 instructions was wrong. The .c-file-declares-EUR-addr
> vs USA-symbols.txt-has-USA-addr conflict is genuinely brief-
> sized work that needed its own scoping pass.

This research adds a second accountability item: brief 073's
spec described Approach A as "function rename only", but the
data-symbol problem is the same shape and needs the same
treatment. The extended tool covers both; future brief
scoping should treat data references with the same care.

## Artifacts shipped in brief 073

- `tools/cross_apply_libs_port.py` — per-port cross-apply
  automation (Approach A extended).
- `docs/research/libs-region-naming.md` — this doc.
- Smoke-test evidence: `func_02007218.legacy.c` worked example
  with all 3 regions at 24/27.

## Pilot evidence — actual config edits in this PR

The smoke-test renames and delinks entries for
`func_02007218.legacy.c` ARE included in this PR, NOT reverted.
That's the worked-example for brief 075's pilot batch and the
3-region 24/27 evidence.

Brief 075 picks up the remaining 86 ports.
