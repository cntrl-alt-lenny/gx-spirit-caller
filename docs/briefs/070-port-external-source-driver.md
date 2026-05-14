### cloud/port-external-source-driver

**Goal:** Ship a robust `tools/port_external_source.py` that
handles the realistic upstream-source surface — `.map`-based
callee remapping, vendored primitive headers, struct-access
support — so brief 069's bulk-port wave can reach the 50-port
floor cleanly and self-extend to the 150+ ceiling.

**Context — what went wrong in brief 069 wave 1:**

Brief 069 (PR #436) shipped **10 byte-identical ports** —
below the 50-port floor. Honest below-floor handback. Root
cause is a **brain scoping miss in brief 069's spec**: I
listed `tools/port_external_source.py` as a brief 068
deliverable, but brief 068 (PR #432) shipped only the
*fingerprint* side (`tools/external_obj.py` + `--byte-scan`
CSV output). Decomper had to build an ad-hoc port driver
inline. The funnel they reported tells us exactly where the
ad-hoc driver pinches:

```text
Brief 068 CSV: 2,887 HIGH rows at 1.0000 byte-similarity
After de-stub + dedup + filter-already-matched:    455
After v3 conservative gate (ad-hoc driver):         14
After compile:                                      10
After byte-identity verify:                         10
```

The **2,887 → 14 collapse** is the constraint, not the precision.
The byte-fingerprint pipeline IS working (10/10 byte-identical
at compile). The bottleneck is how many upstream sources the
port driver can mechanically rewrite. The 441 candidates we
skipped at the v3 conservative gate are mostly:

- 164 use `->member` or nested `.field` (need vendored upstream
  headers)
- 36 use undefined macros (`reg_CP_DIVCNT`, `OS_CONSOLE_*`,
  `PXI_FIFO_TAG_*`)
- Many more fail on callee remap when alphabetical-upstream-
  order ≠ numerical-our-addr-order (the sort-pair heuristic
  trap)

Brief 070 closes those gaps in `tools/port_external_source.py`.

**Method:**

Three deliverables, each independently testable:

### Deliverable 1 — Pokediamond `.map` integration

The ad-hoc driver maps upstream function names to our
addresses via a sort-pair heuristic ("sort upstream calls
alphabetically; sort our reloc targets numerically; pair by
index"). That trap caught `func_0209295c OS_Init` in wave 1
(15 calls, mis-mapped).

Fix: pokediamond ships a `.map` file (its linker output) at
`pret/pokediamond/build/main.lsf` or similar. Parse it once
into a vendored `tools/_vendor/pokediamond/symbols.json`
mapping `(upstream_name) → (upstream_addr, upstream_size)`.

Then in `port_external_source.py`:

1. Look up each upstream `bl <target>` call's address.
2. Find OUR `func_<addr>` placeholder via byte-fingerprint
   against `external_obj.py`'s fingerprint table (already
   shipped in PR #432).
3. Substitute name. No sort-pair heuristic.

Same shape as `port_to_region.py`'s parallel-reloc data
symbol map (PR #419) — fingerprint resolution, not order
heuristic.

### Deliverable 2 — Primitive header vendoring

Upstream pokediamond headers we'd need:

- `arm9/lib/NitroSDK/include/nitro/types.h` (`u32`, `s16`, etc.)
- `arm9/lib/NitroSDK/include/nitro/hw/ARM9/mmap_*.h` (register
  defines)
- `arm9/lib/NitroSDK/include/nitro/os/common/*.h` (enums,
  small primitives)
- `arm9/lib/NitroSDK/include/nitro/spi/*.h`, `card/*.h`,
  `mi/*.h`, etc. as the bulk-port pool needs them

**Approach:** vendor minimally. Don't vendor every header —
vendor the **macros and enums** the bulk-port pool actually
references. Two passes:

1. **Static analysis pass** in `port_external_source.py`'s
   pre-flight: for each candidate, parse the upstream `.c`
   for identifiers that aren't function calls. Bucket by
   header origin via upstream `#include` analysis.
2. **Vendoring pass:** copy the identified header *fragments*
   into `libs/nitro/include/<category>.h` files. Avoid
   verbatim copies of large upstream headers — extract only
   the macros + enums + simple typedefs needed.

Keeps `libs/` tree clean. Decomper's pre-existing convention
is `libs/<lib>/include/` for headers (per CLAUDE.md).

### Deliverable 3 — Struct-access support

Pokediamond's NitroSDK functions use struct-member access
heavily (`thread->state`, `dma_ptr->dst`, etc.). Wave 1's
ad-hoc driver skipped these (164 of 455 candidates).

**Approach:** layered with deliverable 2. After header
vendoring identifies which structs the candidate touches,
the port driver:

1. Vendors the struct definition from upstream into
   `libs/nitro/include/<category>.h`.
2. Substitutes upstream type-aliases if they conflict with
   ours (rare; most NitroSDK types are universal).
3. Generates the port `.c` with the same struct accesses as
   upstream — they'll compile against the vendored header.

This is the single biggest unlock. 164/455 candidates → likely
30-50% of those byte-port cleanly if the structs match
upstream definitions (which they should, since the byte
fingerprint matched).

### Deliverable 4 (smaller) — Data-reference reloc handling

Wave 1's ad-hoc driver punted on data-reference relocs
(`OSi_ThreadIdCount → data_020c3f48` style). Need an
analogous lookup to deliverable 1 but for data symbols. Same
pattern: pokediamond's `.map` has data addresses; our
`config/eur/symbols.txt` has `data_<addr>` placeholders;
fingerprint-match doesn't quite apply (data has no
instructions) so we fall back to **address + size +
relocation-pattern** matching.

This is smaller than deliverables 1-3 but blocks ~50 of the
candidates we skipped.

**Non-scope:**

- ❌ The bulk-port wave itself — that's brief 071 (decomper
  rerun once 070 ships).
- ❌ Vendoring upstream `.c` source for any function we
  haven't directly ported. Headers only (for macros, enums,
  struct defs).
- ❌ MSL_C ports — brief 069 wave 1 didn't touch them; they
  use `2.0/sp1` (one SP rev off ours, not exact like
  NitroSDK). Defer to a future brief once NitroSDK pool is
  drained.
- ❌ pokeheartgold ports — same SP-rev concern. Defer.
- ❌ src/, AGENTS.md, state.md edits beyond the new tool +
  vendored headers.

**Success:**

- `tools/port_external_source.py` ships with a CLI that
  takes a brief 068 CSV row → writes `libs/nitro/<func>.legacy.c`
  + any header dependencies.
- Smoke test: re-runs brief 069's wave-1 candidate list
  through the new driver. The 14 → 10 funnel becomes
  significantly looser; aim for ≥ 50 of the 455 dedup'd
  candidates compiling and byte-matching.
- Unit tests cover each of the 4 deliverables.
- Markdown lint + ruff + tests-pass on CI.
- Re-run of brief 068's CSV → `port_external_source.py
  --dry-run` mode reports a candidate count ≥ 100 (≥ 50 needed
  for brief 071's port-wave floor).

**Branch:** `cloud/port-external-source-driver`

**Priority:** HIGH. Unblocks brief 071 (decomper cross-project
bulk-port wave 1 rerun). The 2887 HIGH-confidence rows from
brief 068 are sitting there; this brief is the gate to actually
landing them as cross-project matches.

**After this brief lands:**

1. Brain queues brief 071 (decomper bulk-port wave 1 rerun)
   consuming the v2 port driver. Target 50-150 ports same as
   brief 069's spec.
2. If brief 071 hits self-extend gates (≥ 0.80 precision AND
   ≥ 50 ports) → up to 2 follow-up waves draining the
   pokediamond NitroSDK pool.
3. Once pokediamond NitroSDK pool drains, brain queues brief
   072 (port driver MSL_C extension — handles one-SP-rev
   tolerance) + brief 073 (decomper wave consuming MSL_C
   pool).

## Brain's scoping-miss accountability

Brief 069's spec said `port_external_source.py` was a brief
068 deliverable. That was wrong — brief 068's actual scope
was only the fingerprint side. Decomper did the right thing
building an ad-hoc driver to surface the 10 wins; the floor-
miss is on brain's brief, not decomper's execution.

Future brief sequencing: when a brief's success depends on
*another* brief shipping a specific tool, the dependency
should be explicit in both briefs (block-on / unblocks
language) rather than implicit. State.md's "Next-brain TODO"
or AGENTS.md's open-briefs section is the right place to
flag those edges.
