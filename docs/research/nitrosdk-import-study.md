# NitroSDK matched-C import feasibility study

**Brief 659 — snapshot 2026-07-22**

This is a feasibility study, not an import. No peer source is copied into
this repository. Counts below are evidence-backed estimates from the current
tree and the cited peer repositories; they are not a claim that every
recognisable SDK function is byte-matchable.

## Executive verdict

**PARTIAL GO:** run a small, signature-gated NitroSDK identification pilot,
but do not reopen the old bulk-port thesis as a 300–600-function shortcut.

For the **2,462-function main candidate pool**, the defensible estimate is
**about 100 plausible NitroSDK/MSL candidates**, with a broad range of
**70–150** and **medium-low confidence**. The lower end is the previously
measured, recognisable SDK floor; the upper end allows for some of the
unclassified leaf functions to be CRT/MSL. The call graph rules out treating
the whole pool as SDK: most candidates are game code.

The practical **new** import opportunity is smaller, approximately **30–70
functions**, because the repository already contains 100
`libs/nitro/*.legacy.c` ports and the earlier cross-project waves already
harvested much of the highest-confidence pool. A 20–30-function pilot is
worth doing if provenance is cleared first. Estimated effort is half a day
to one day for signature generation and census, 2–5 days for the pilot, and
roughly 1–3 weeks for a 70–100-function endgame if the source and toolchain
pass the pilot. A failed provenance or precision gate should close the lane.

## 1. What share of `main` looks like SDK/MSL?

### Existing names are a floor, not a discovery mechanism

The EUR ARM9 symbol file already names the obvious platform layer: 18
BIOS/SWI functions, CRT bootstrap symbols, IRQ/OS helpers, filesystem
helpers, and an SND symbol. Those are not hidden candidates. The local Nitro
README's appendix records 51 `__sinit_*` names and says that no unmatched
official NitroSDK-prefix or MSL functions remained named at that census.
The remaining pool is therefore predominantly `func_<address>` and must be
identified by bytes, structure, or call-graph evidence rather than by an
`OS_`/`GX_` name.

Sources: [`config/eur/arm9/symbols.txt`](../../config/eur/arm9/symbols.txt),
[`libs/nitro/README.md`](../../libs/nitro/README.md).

### The call graph says “mostly game code”

Brief 280 classified **2,025** of the earlier main `<0x100` cohort:

| Call-graph class | Count | Reading |
|---|---:|---|
| Calls at least one game `func_` | 1,540 | Game-code evidence |
| Leaf/no call | 438 | SDK/MSL candidate or game leaf |
| Calls only named/SDK functions | 15 | SDK-adjacent |
| Other | 32 | Unresolved by that classification |

That gives an upper bound of about **453 non-game-callers**, not 2,025 SDK
functions. The current brief's 2,462 pool is a newer worklist and is not
silently substituted for the older measured cohort; the older result is the
available full call-graph census.

The same study found two recognisable clusters:

* about **28 CP/divider/square-root MMIO** functions;
* about **45 GX/OS MMIO leaves**;
* an unknown share of roughly 380 remaining pure-compute leaves that could
  be CRT/MSL, but could equally be small game helpers.

Those observations support a confident floor of **70–100** SDK-shaped
functions and a cautious ceiling of **150** in the current main pool. They
do not support “a meaningful majority.” Confidence is **medium-low** because
the candidate list has not been matched against an external SDK object pool
and the unclassified leaves are intrinsically ambiguous.

### What the existing `libs/nitro` history tells us

The tree already has **100 `*.legacy.c` files**, concentrated as follows:

| Existing port source family | Files |
|---|---:|
| `pokediamond` `FX.c` | 54 |
| `pokediamond` matrix/GX/OS/MI/FS/CARD and related files | 45 |
| `pokeheartgold` OS-thread source | 1 |
| **Total** | **100** |

The files are region-neutral legacy-tier ports, and their comments record
source paths such as `pokediamond:arm9/lib/NitroSDK/src/FX.c`. The git history
shows the prior cross-project waves landing 10, then 64, then 13, then 12
ports (plus later symbol-resolution cleanup), while several waves were
explicitly below their precision/floor target. This is important negative
evidence: the lane was investigated and did produce real wins, but its
realised yield is far below the original 300–600 estimate.

Relevant history and prior assessment:

* [`cross-project-feasibility.md`](cross-project-feasibility.md) documents
  the original 300–600 estimate, the 99-file pokediamond NitroSDK pool, and
  the exact `1.2/sp2p3` legacy-tier observation.
* [`brief-280-main-sdk-sourcemine-triage.md`](brief-280-main-sdk-sourcemine-triage.md)
  narrows the main opportunity to a modest SDK-shaped minority and records
  the 7/8-instruction DIV/MMIO pilot.
* [`brief-069-cross-project-bulk-port-wave-1.md`](../briefs/069-cross-project-bulk-port-wave-1.md),
  [`brief-071-cross-project-bulk-port-wave-1-rerun.md`](../briefs/071-cross-project-bulk-port-wave-1-rerun.md),
  and [`brief-074-cross-project-bulk-port-wave-3.md`](../briefs/074-cross-project-bulk-port-wave-3.md)
  record the actual wave gates and their outcomes.

The ports are not evidence that all remaining `func_` files in `main` are
SDK. They are evidence that the obvious shared library families were already
the first targets, and that future work needs a stronger identification gate.

### Recognisable idioms are useful but not proof

The strongest local clues are fixed DS hardware accesses: divider/square-root
registers, GX register helpers, interrupt masking, and small OS/MMIO leaves.
These can prioritize a source comparison. They cannot establish provenance
or guarantee a match: the DIV-result pilot matched 7 of 8 instructions, with
`ANDS` versus `TST` remaining, and the nearby quotient function used the other
form. The last instruction can therefore still require exact source/compiler
conditions or hand coercion.

## 2. Peer survey

The links below point to the source trees inspected on 2026-07-22. “Has
matched C” means the project contains C intended for its own byte-matching
build; it does not mean that the source is licensed for transplantation.

| Project | Matched NitroSDK/MSL C and location | SDK/compiler evidence | Completeness / import reading |
|---|---|---|---|
| [pret/pokediamond](https://github.com/pret/pokediamond) | **Yes, broad tree:** `arm9/lib/NitroSDK/src/` contains CARD, FS, FX, GX, MATH, MI, OS, PXI, RTC, SND, WIFI, WM and CRT-related units. | The local compatibility audit records the NitroSDK/libnns subtree at **mwccarm 1.2/sp2p3**, the same legacy tier used here; top-level game code is 2.0/sp1. | Strongest candidate donor by coverage and compiler match. The local survey counted 99 NitroSDK C files plus 4 libnns files, but later waves show that source availability does not equal target matches. |
| [pret/pokeheartgold](https://github.com/pret/pokeheartgold) | **Yes, partial/substantial:** `lib/NitroSDK/src/`, with `mi/` and `os/` trees visible in the inspected source layout. | Main project is recorded locally as **mwccarm 2.0/sp2p2**; its separately identified `nitrocrypto` path uses 1.2/sp2p3. | Useful secondary source and naming/API reference. Main SDK C is not a drop-in for the legacy tier without compiler/source validation. |
| [pret/pmd-sky](https://github.com/pret/pmd-sky) | **Yes, structured SDK C:** `lib/NitroSDK/src/` includes `fs`, `fx`, `gx`, `mi`, `os`, `snd`, plus CP, GX assembly, math, PXI and RTC units. | The project's [decompiling-a-function guide](https://github-wiki-see.page/m/pret/pmd-sky/wiki/Decompiling-a-function) documents DS ARMv5TE and **mwccarm 2.0/sp2p2**. | The inspected repository exposes a real SDK source surface but no reliable single completion percentage for the SDK subset. Treat it as a candidate/reference pool, not assumed drop-in code. |
| [tangosdev/sm64ds-decomp](https://github.com/tangosdev/sm64ds-decomp) (the former `bmanus2-dotcom` location redirects here) | **Not shown as a NitroSDK donor:** the inspected tree is organised around `src/`; no NitroSDK source directory was found in the repository page search. | Pins **mwccarm 1.2/sp2p3**, with ARM946E/C99 matching flags close to this repo's legacy context. | Valuable same-compiler methodology and clean-room norm, not a demonstrated NitroSDK/MSL source pool. Its README reports 10,592/11,349 functions (93.3%) for that game. |
| [n64decomp/sm64](https://github.com/n64decomp/sm64) | **No DS/NitroSDK donor:** its `lib` SDK code is an N64/MIPS analogue. | Different platform and compiler family. | Methodological/licensing analogue only; no direct import value for this lane. |

The peer survey therefore confirms that readable SDK C exists in the DS
decomp ecosystem, especially in pokediamond and pmd-sky. It does **not** show
that a ready-made, same-game, same-version, openly reusable source pool is
available for this repository.

## 3. Licensing and provenance

The inspected default branches of **pokediamond**, **pokeheartgold**, and
**pmd-sky** did not expose a repository `LICENSE` file. That is a provenance
blocker, not permission to copy: GitHub's [licensing guidance](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository)
states that without an explicit license, default copyright applies and other
users do not receive a general reuse license merely because the repository is
public.

NitroSDK itself is Nintendo-proprietary technology. A peer's reverse-engineered
C may be clean-room work, but absent an explicit license or written permission
there is no safe assumption that its source text can be imported here. The
local [`libs/nitro` README](../../libs/nitro/README.md) already states the
appropriate project posture: reverse-engineer and document facts; do not copy
copyrighted code.

The [sm64ds-decomp README](https://github.com/tangosdev/sm64ds-decomp) is a
useful norm-setting example: its original work is MIT-licensed, but it
explicitly separates that license from Nintendo material and says the clean
rule is to import knowledge and write the code. Its [MIT license](https://raw.githubusercontent.com/tangosdev/sm64ds-decomp/main/LICENSE)
does not license code from the pret repositories or Nintendo's SDK.

Recommended provenance rule:

1. Do not copy peer `.c` text into this repository on the basis of a GitHub
   URL, matching symbols, or a decomp-community convention.
2. Use peer trees for public facts: names, module boundaries, API signatures,
   structure layouts, compiler settings, and independently observable
   byte/signature evidence.
3. Import peer C only after a project-specific license/permission review.
   Otherwise re-author the function from the target binary and those
   source-independent facts, preserving our own provenance notes.

This is the main reason the verdict is partial rather than an unconditional
GO: the likely technical payoff is real, but the source-reuse right is not
established for the most promising donors.

## 4. Proposed mechanism

### Identification: external ELF signatures

Brief 569 validated the local `dsd sig` family and the earlier external-ELF
route is the right identification half for this lane:

1. Build a peer SDK translation unit with the peer's own SDK headers,
   compiler revision, and flags. Keep the **per-TU relocatable `.o`**; a
   linked aggregate object is not an equivalent signature input.
2. Run `dsd sig new-elf` on that external `.o` to produce a reloc-masked
   signature for each named function.
3. Apply the signatures read-only to our EUR modules first, then USA/JPN and
   overlays. A unique hit is an identification candidate; multiple hits are
   clone families; no hit is simply no evidence.
4. Record the address, module, source function, compiler tier, and signature
   result before any naming or source edit. Keep the first pass dry-run and
   collision-aware.

This is an identification primitive, not a license bypass and not a byte
match by itself. Signatures mask relocations and are intentionally useful for
finding a likely function; they cannot prove that the peer's C will compile
to our bytes.

### Import or re-author after identification

For a source whose provenance is cleared, the implementation path is:

1. Compare the peer source's exact function and all relevant headers/macros
   against our target's module, data, relocations, and compiler tier.
2. Hand-adapt include paths, typedefs, register declarations, static/global
   names, and callee/address mappings into a region-neutral `libs/nitro`
   source or the appropriate source tier.
3. Compile and compare with objdiff/SHA1. Treat a near-miss as a normal
   compiler-coercion task, not as an automatic import.
4. For an unlicensed peer, discard the source text and re-author from the
   binary plus independently documented facts. The signature can still
   identify the target, but it cannot justify copying implementation text.

Near-drop-in cases are plausible for pokediamond's NitroSDK subtree because
its recorded 1.2/sp2p3 setting matches our `.legacy.c` tier. They are not
guaranteed: even a same-SP source can differ in SDK revision, headers,
preprocessor defines, static-data layout, or function selection. The local
DIV pilot is the concrete warning: canonical source reached 7/8 identical
instructions, but the final `ANDS`/`TST` choice differed.

### Failure modes to budget explicitly

* **SDK/version drift:** NitroSDK revisions change inline helpers, volatile
  access forms, structure declarations, and default macros.
* **Compiler drift:** pokediamond's SDK is the best legacy-tier fit;
  pokeheartgold and pmd-sky's documented 2.0/sp2p2 paths are not equivalent
  to 1.2/sp2p3. MSL_C in pokediamond is recorded at 2.0/sp1, also not the
  legacy tier.
* **Codegen shape:** register allocation, peepholes, dead-load retention,
  ANDS/TST, ARM/Thumb routing, and inline assembly can leave a one-instruction
  wall after semantic identification.
* **Target drift:** a peer's function may be an SDK revision or game-specific
  wrapper with the same name but different body; region-specific addresses,
  overlay placement, and callee renames must be resolved independently.
* **Data and relocations:** an external `.o` signature is more informative
  than source text alone, but pool constants, static storage, and relocation
  targets still require target-side verification.
* **Duplicate bodies:** masked signatures can resolve to multiple functions;
  these are useful family evidence but not safe automatic names or imports.

## 5. Pilot and stop conditions

Run a **20–30-function** pilot, stratified across the main SDK-shaped MMIO
families and the strongest peer/toolchain combinations. The pilot should
report, separately, unique signature hits, ambiguous families, no-hits,
byte-identical results, and near-misses. It should not silently turn an
unlicensed source into a vendored implementation.

Proceed to a larger lane only if both gates pass:

* provenance is explicit for every source actually imported, or all
  implementations are independently re-authored; and
* the pilot shows at least **80% byte-identical output** in the intended
  source/compiler tier, with the remainder bounded to cheap, repeatable
  coercions.

If either gate fails, close the import lane and keep only the signature census
as an identification aid for ordinary hand-RE. That outcome is useful: it
prevents repeating the old optimistic 300–600 estimate.

## 6. Final assessment

| Question | Assessment |
|---|---|
| Plausible SDK/MSL share of main's 2,462 candidates | **~100**, range **70–150**, medium-low confidence |
| Likely new importable functions after existing ports | **~30–70** |
| Best technical source | `pret/pokediamond` NitroSDK subtree at the legacy compiler tier |
| Best non-source reference | `pret/pmd-sky` SDK layout/idioms and `sm64ds-decomp` clean-room methodology |
| Main blocker | No explicit reuse license found for the three pret repositories inspected |
| Verdict | **PARTIAL GO:** signature-gated pilot; no bulk import commitment |
| Effort | 0.5–1 day census, 2–5 days pilot, 1–3 weeks only if the gates pass |

The thesis is technically credible in a narrow form: a few dozen main
functions may be identifiable as shared NitroSDK/MSL code, and pokediamond's
legacy compiler tier makes some of those unusually promising. It is not
credible as a cheap, broad readable-C unlock without first solving provenance
and demonstrating pilot precision on this target.
