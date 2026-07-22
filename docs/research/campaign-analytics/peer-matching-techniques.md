# Peer matching techniques: new additions only

Snapshot: 2026-07-22. This is a mechanical peer-project review for the
remaining C-match lane. It deliberately excludes techniques already recorded
in `docs/research/reshape-recipes/imported-sm64ds.md`,
`docs/research/cross-project-feasibility.md`, `recipe-gotchas.md`, and
`codegen-walls.md`, as well as the queue's explicitly dead m2c, `-ipa`,
`#pragma thumb`, and inert `opt_*` paths.

## Verdict

No peer supplied a new source-level lever that is evidenced to defeat this
project's mwccarm 2.0/sp1p5 register-allocation wall. The new haul is two
tool/process techniques, both compiler-neutral and directly useful:

| technique | peer evidence | mwccarm 2.0/sp1p5 applicability |
|---|---|---|
| linked relocation-destination oracle | sm64ds `linkcheck.py` reconstructs linked ARM relocation slots, then compares the linked function to ROM; it catches wrong callees/globals, addends, relocation kinds, and ARM→Thumb interworking hidden by wildcarded unlinked compares | **HIGH.** This is orthogonal to reshaping and directly addresses false-green/unknown-callee risk in our C lane. It cannot make a wall match, but it can be a post-match gate for every new C TU. |
| machine-readable near-miss corpus + instruction-level diff retrieval | sm64ds keeps compiling near-misses in `nearmiss/db.jsonl`, ranks small divergences, and uses `fdiff.py` to show relocation-aware instruction differences | **HIGH.** The compiler is the same family and the method needs only our existing compile/diff artifacts. It reduces repeated setup for 1–4-instruction residues and makes “try one more reshape” evidence reusable; it is not a regalloc unlock by itself. |

## 1. Linked relocation-destination oracle

The sm64ds project documents a blind spot in ordinary matching: relocation
slots must be wildcarded in an unlinked object comparison, so a candidate can
have the right instruction shape while calling the wrong function or global.
Its `tools/linkcheck.py` resolves each relocation, writes the real ARM encoding,
and compares the linked bytes. It explicitly models nonzero relocation addends,
ARM→Thumb interworking, veneers, and byte-identical twins. The peer reports
that this audit found and corrected wrong destinations rather than merely
improving a percentage.

Source: [sm64ds link-verification notes](https://github.com/tangosdev/sm64ds-decomp/blob/main/notes/link-verification.md)

### What to borrow

Add a local post-match audit around the existing `dsd`/linker artifacts:

1. take one newly matched C TU;
2. resolve every relocation in its linked object through the region/module
   symbol table;
3. compare the linked function bytes to the ROM range;
4. classify a mismatch as wrong destination, addend/interworking/veneer, or
   genuinely different instruction bytes.

The important new property is destination verification, not another fuzzy
match score. It is especially valuable for cross-region and SDK work, where a
human-readable callee name can be correct-looking but point at an alias or
wrong overlay. The peer's implementation is a design reference only; no peer
code was copied.

## 2. Near-miss database as a reusable asset

sm64ds makes near-misses first-class data instead of discarding every failed
compile. Its contribution guide describes `nearmiss/db.jsonl` records carrying
the function, address, candidate C, and divergence count; `nearmiss_db.py` can
list the smallest gaps, while `fdiff.py` prints the exact relocation-aware
instruction differences for a stored candidate.

Source: [sm64ds contributing guide](https://github.com/tangosdev/sm64ds-decomp/blob/main/CONTRIBUTING.md), especially its “Easy pickings: the near-miss database” section; the repository's [nearmiss directory](https://github.com/tangosdev/sm64ds-decomp/tree/main/nearmiss).

### Applicability

This fits mwccarm 2.0/sp1p5 without changing compiler flags. A record should
contain at least:

- region/module/address/size and source path;
- compiler tier and exact flags;
- candidate source or a content-addressed scratch reference;
- instruction diff count and mismatch classes;
- whether the gap was later shipped, parked, or superseded.

The existing repo has dossiers, `verify.py` output, and many prose near-miss
notes, but no peer-style queryable corpus that lets a later agent start from
the closest compiling candidate. This would be valuable for the non-wall tail
and honest about the wall tail: a repeated same-register mismatch becomes
evidence for parking, while a recurring one-instruction source-shape mismatch
becomes a recipe candidate.

## Peer survey and screened-out material

| project | observed practice | new to this tree? | disposition |
|---|---|---|---|
| [pret/pokeheartgold](https://github.com/pret/pokeheartgold) | per-build MWCC versioning, including a project default of 2.0/sp2p2 and a separate 1.2/sp2p3 object rule; component build/check targets | **No.** The SP split and external SDK implications are already recorded in `cross-project-feasibility.md` and our legacy per-TU routing. | Keep as a reminder that a compiler-version override is a targeted experiment only, not a general regalloc lever. |
| [pret/pokediamond](https://github.com/pret/pokediamond) | explicit ARM9/overlay source/object ordering, manual `asmdiff.sh` range comparison, and pinned MWCC matching workflow | **No.** Our delinks/configure/objdiff and existing byte-diff dossiers cover the same operational role; its NitroSDK source/SP findings are already mined. | No new adoption. |
| [pret/pmd-sky](https://github.com/pret/pmd-sky) | `extract_function`, scratch-first decompilation, `make tidy`/matching verification, and contributor guidance that points to a shared debug-symbol project | **No.** Our scaffold/carve flow, dossiers, Ghidra/decomp.me notes, and naming ledgers already cover these steps; the external debug corpus is game-specific. | No new adoption. |
| [zeldaret/ph](https://github.com/zeldaret/ph) | issue-based file claims, partial-progress PRs, objdiff, decomp.me export, and a documented C++ static-initializer/destructor workflow | **No.** We already have queue claims, objdiff/decomp.me, and sinit/`__register_global_object` documentation. | No new compiler lever. |
| [tangosdev/sm64ds-decomp](https://github.com/tangosdev/sm64ds-decomp) | pinned mwccarm 1.2/sp2p3; automatic templates; AI/claim coordination; linked relocation oracle; near-miss database | **Partly.** The template, compiler-idiom, and coordination material is already mined; the linked oracle and near-miss database are genuinely absent. | Adopt the two techniques in §§1–2; do not import peer C. |

The peer project guides confirm the common standard—compile with the pinned
original toolchain and accept only byte-identical output—but do not justify a
new pragma or compiler switch for our 2.0/sp1p5 hard tail. The honest result is
therefore **2 new techniques, 0 new regalloc levers**.

## Provenance boundary

This report mines public project documentation and repository metadata only.
It does not copy peer C, SDK source, ROM data, or extracted assets. Any future
implementation should borrow the verification/data-model idea and write the
tooling and source against this repository's own ROM and symbols.
