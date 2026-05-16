### decomper/dtcm-pilot-cluster-e

**Goal:** First production data-tier wave. Cluster E
(DTCM/ITCM specials) per brief 113's taxonomy. **Highest-
leverage immediate next step** — small pool (~5-10
symbols), high payoff: **flips DTCM module FAILED → OK =
first 25/27 baseline since session start**.

**Context — what brief 113 said about cluster E:**

Cluster E covers symbols that live in DTCM (Data
Tightly-Coupled Memory) or ITCM (Instruction TCM)
sections. These are NOT in `.bss` / `.data` / `.rodata`
— they require special section attributes per the
mwccarm + mwldarm linker convention. Brief 113's
"workflow wall W5" flagged that **DTCM section attribute
syntax is TBD** — research during this wave is required.

Currently:
- `dsd check modules` reports **DTCM as FAILED** (one of
  the 3 checksum-failed modules: ARM9 main + DTCM +
  overlay 4).
- DTCM module checksum failure is likely from missing
  DTCM-section data symbols.
- Brief 113 estimates 5-10 DTCM-section symbols total
  (small pool — DTCM is tightly-bounded by design).

**Method:**

1. **Identify DTCM symbols in EUR baseline.**
   - `dsd report` should track per-module data symbol
     counts.
   - Cross-reference `config/eur/arm9/dtcm/symbols.txt`
     (if it exists per the dqix template) OR the
     overall `arm9/config.yaml` for DTCM section
     boundaries.
   - Goal: enumerate the 5-10 DTCM symbols by name +
     size + address.

2. **Research DTCM section attribute syntax (W5).**
   - The mwccarm + mwldarm convention for DTCM section
     placement is unclear from existing project docs.
     Options to investigate:
     - `__attribute__((section(".dtcm")))` — GCC
       convention.
     - `#pragma section "dtcm"` — mwcc-specific?
     - Per-file routing similar to `.legacy.c` (file-
       suffix-based section assignment).
     - SDK-provided macros (check `libs/nitro/include/`
       for DTCM-related typedefs).
   - **Cross-reference dqix** (primary template per
     CLAUDE.md) for DTCM section conventions.
   - Document the working syntax in `docs/research/
     dtcm-section-attribute.md` (or similar location).

3. **Write source for each DTCM symbol.**
   - Per brief 113's cluster E recipe: section attribute
     + SDK typedef where applicable.
   - Add appropriate `.c` files (location TBD — likely
     `src/main/dtcm/` or similar by convention).
   - Add delinks.txt entries pointing into the DTCM
     section.

4. **Build + verify.**
   - `python tools/configure.py eur && ninja rom`.
   - `dsd check modules` — DTCM should flip from
     FAILED → OK.
   - **Success condition:** `dsd check modules` shows
     **25 OK** (DTCM now in the OK column).

5. **Document the recipe.**
   - Add cluster E recipe to `docs/research/data-tier-
     scoping.md` (created in brief 113).
   - If new data-tier walls surface during the wave,
     start a new section in `codegen-walls.md` for
     data-tier wall classifications.

**Self-extend clause:**

If DTCM only requires 5 symbols and they all land,
optionally extend to ITCM if applicable (similar small
pool). No formal yield gate — this is a NEW kind of
wave (data-tier), so the brief-098-style "open the
floor" framing applies.

**Non-scope:**

- ❌ Cluster A / B / C / D waves (separate briefs).
- ❌ data_worklist.py v2 tooling (parallel brief 114).
- ❌ Function-tier work (back-burner during data-tier
  arc).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 5 DTCM data symbols ported (cluster E pool size).
- `dsd check modules` reports **25/27 OK** (DTCM in OK
  column).
- All 3 regions stay at the new 25/27 baseline (USA +
  JPN should also flip DTCM if the recipe is region-
  neutral).
- DTCM section attribute syntax documented in research
  notes for cluster A / B / C / D briefs to reference.
- Per-wave PR funnel + cluster E recipe table.

**Branch:** `decomper/dtcm-pilot-cluster-e`

**After this brief lands:**

1. **First 25/27 baseline this session** — visible
   progress moment. USA + JPN also flip DTCM if
   region-neutral (likely yes given DTCM is SDK-level).
2. **Cluster A `.bss` wave 1** (brief 116) inherits
   the section-attribute pattern. Per brief 113's
   estimate, brief 116 could be 50-100 symbols /
   6-10h decomper.
3. **Data-tier walls (if any) start a new
   `codegen-walls.md` section.** Brief 113 documented
   workflow walls W1-W5 but expected no codegen walls
   in scoping; brief 115 may surface real ones during
   application.
4. **Cross-region apply for DTCM** — if the recipe is
   region-neutral, the same source ports to USA + JPN
   trivially (no `port_to_region.py` needed for
   SDK-level data). Validate during the wave.
