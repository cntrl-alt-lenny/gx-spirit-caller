# NitroSDK rename suggestions — brief 014 seed

_Generated 2026-04-23 by `cloud` on brain's request after named-tier
closed (brief 011-013)._

**Run provenance**:

- Tool: `tools/nitro_suggest_renames.py` (PR #99's usability-pass version)
- Dict: `tools/nitro_dict.py build` against `ntrtwl/NitroSDK` @
  [`e6fbeba`](https://github.com/ntrtwl/NitroSDK/commit/e6fbeba60332e660639ad664eda2dc85c0e14649)
  (HEAD as of 2026-04-23) — **1,752** function signatures across 45
  subsystems
- Config: `config/eur` @ main `981c442`
- Flags: all defaults (`--min-size 0x8 --min-callers 2`, failing
  modules skipped, LOW tier hidden)

## Headline finding — read this before the raw output below

**0 HIGH, 4 MEDIUM, 329 LOW tractable candidates.** Brain's
expected uplift from a re-run after named-tier closure didn't
materialize. The reason is a naming-convention mismatch in the
scorer, not a tool bug:

`nitro_suggest_renames` derives subsystem signal from **target's
NAMED CALLEES**. It only recognises a callee as "providing subsystem
signal" if the callee name matches the Nitro `PREFIX_Name` convention
(uppercase-letters + underscore + capital-letter, e.g. `OS_GetTick`,
`GX_LoadBG0Char`). The named symbols that closed brief 011-013:

| Tier | Names shipped | Match Nitro PREFIX_Name pattern? |
|---|---|---|
| 011 BIOS thunks | `SoftReset`, `Halt`, `Div`, `Mod`, `IntrWait`, `VBlankIntrWait`, `CpuSet`, `CpuFastSet`, `Sqrt`, `WaitByLoop`, `LZ77UncompReadNormalWrite8bit`, ... | **No** — they're bare names, no subsystem prefix |
| 012 non-thunks | `Entry`, `main`, `AutoloadCallback`, `__register_global_object` | **No** |
| 013 ov011 wrappers | `func_ov011_021ce324`/`021ce334` renamed to `__sinit_*`? (branch closed) | Placeholder shape |

Every one of these is either a bare name (no underscore-with-caps) or
uses the dsd-generated placeholder shape. **None trigger the subsystem-
signal heuristic**, so the scorer has nothing extra to work with post-
closure vs pre-closure. A re-run produces the same buckets it would
have before brief 011.

## What this means for brief 014 (rename cascade)

The `named_callee_subsystems` signal path only fires once a
**Nitro-convention-named function** exists in the call graph. Those
would come from:

- **A `BIOS_*` rename wave** on brief 011's thunks (e.g.
  `SoftReset` → `OS_SoftReset`, `Div` → `OS_Div`). NitroSDK has
  many `OS_*` names that match the thunk shapes.
- **A `libs/nitro/` header adoption pass** — committing SDK header
  decls so cross-module calls resolve to `OS_WaitVBlankIntr`
  etc. at link time.
- **A target-side rename** where placeholder callees in the worklist
  themselves become `PREFIX_Name` named.

In other words: this tool bootstraps well when there's already some
Nitro-named scaffolding. We don't have any yet. The 4 MEDIUM hits
below come purely from shape + caller-count signal — no subsystem
signal is contributing.

**Recommendation for brief 014**: before running the rename-cascade,
do a pass to Nitro-rename the BIOS thunks (`SoftReset` →
`OS_SoftReset`, etc.) so the next run of this tool has signal to
work with. That should move the needle from "4 MEDIUM / 0 HIGH" to
actually-discriminating HIGH-confidence suggestions.

## Raw suggester output

The 4 MEDIUM candidates all live in ov006 and share the 8-byte
leaf shape with 8-11 callers each. The "5 candidates all from CARD"
pattern is the scorer admitting it has no discriminating signal —
every 0-arg void Nitro function scores identically under the shape-
only heuristic, and it alphabetises on ties. Decomper should treat
these as "4 callers-dense helpers worth investigating" rather than
"rename these to CARD_*" — the CARD prefix is suggestion-noise.

---

Scanned **333** tractable unmatched function(s) against a dictionary
of **1,752** NitroSDK signatures.

**Confidence breakdown:** 🟢 **0 HIGH**, 🟡 **4 MEDIUM**, ⚪ **329
LOW**. LOW suggestions are hidden by default — re-run with
`--show-low-confidence` to surface them.

### 🟡 MEDIUM-confidence (4 of 4)

#### `ov006|0x021c9ef4` `func_ov006_021c9ef4` — size=0x8, out_degree=0, callers=11

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

#### `ov006|0x021c6990` `func_ov006_021c6990` — size=0x8, out_degree=0, callers=8

Shape hints: inferred args: **0**.

Same 5-candidate CARD list as above (scorer ties).

#### `ov006|0x021c757c` `func_ov006_021c757c` — size=0x8, out_degree=0, callers=8

Same 5-candidate CARD list.

#### `ov006|0x021cac30` `func_ov006_021cac30` — size=0x8, out_degree=0, callers=8

Same 5-candidate CARD list.

**Observation**: four near-identical shapes in ov006 (8 bytes, 0
callees, 8-11 callers). Almost certainly sibling functions emitted
by mwcc from the same C template — `tools/find_duplicates.py`
should cluster them. If so, matching one via a template pass
(`tools/propagate_template.py`) would close all four at once even
without a Nitro name.

## Suggested next steps for brain

1. **Scope brief 014 around BIOS-thunk Nitro-renaming first**
   (`SoftReset → OS_SoftReset`, `Halt → OS_Halt`, `Div → OS_Div`,
   `CpuSet → OS_CpuSet`, …). That seeds real subsystem signal for
   the next suggester run.
2. **Cluster the 4 ov006 helpers via `find_duplicates.py`**. If
   they share a call-graph fingerprint, one manual match →
   `propagate_template.py` closes the quad.
3. **Rerun this tool** after (1) + (2) land. Expect HIGH-confidence
   candidates to materialize as the named callee graph grows.

---

<sub>🤖 Generated by `tools/nitro_suggest_renames.py`. Confidence
labels derived from score gap + signal (callee subsystems, caller
count) — see `classify_confidence` for the heuristic.</sub>
