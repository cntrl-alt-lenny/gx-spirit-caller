# Codegen-wall taxonomy audit

Queue item `q-walls-doc-audit` — snapshot **2026-07-22**. This is a
build-free audit of [`docs/research/codegen-walls.md`](../codegen-walls.md),
not a taxonomy rewrite.

## Method and headline result

I enumerated every `C-NN`/`P-NN` heading in the taxonomy (including the
C-39 sub-shapes), scanned the leading headers of every tracked `src/**/*.s`,
and counted each distinct taxonomy token. A token was counted once per file;
region ports therefore count independently. For the high-volume C-34 check,
I also counted whether the body contains a repeated `.word` operand as a
cheap proxy for the documented “two pool slots with the same value” cue. That
proxy is evidence for triage, not a proof of the original binary's pool
layout.

Only **7 of 66 taxonomy entries** are cited by code in current `.s` headers:

| Code | Header citations | Audit result |
|---|---:|---|
| C-8 | 1 | **MIS-FILED:** the cited body uses privileged `mcr`; this is an ISA/inline-assembly floor, not a C coercion. |
| C-23 | 1 | **SUSPECT:** the sole header calls itself a saturation-pattern case, while the body is also explicitly C-34 duplicate-pool and C-36 literal-tail territory. |
| C-31 | 4 | **ALIGNED:** headers say interwork veneer; the documented 8/12-byte shim cue is specific enough. |
| C-32 | 17 | **ALIGNED, but under-specified:** headers say cross-overlay BL; the decisive `module:none` relocation witness is absent from the prose. |
| C-34 | 116 | **OVERBROAD:** “C-34 candidate. Vanilla/Duplicate” is not the documented duplicate-pool witness; a body proxy finds it in only 37/116 files. |
| C-36 | 1 | **ALIGNED, but not a codegen wall:** this is a patcher/tooling trim trap with an `.s` shipping recipe. |
| P-11 | 1 | **ALIGNED:** the header identifies the medium-tier helper-call register-allocation plateau. |

The other **59 entries have zero current taxonomy-token citations**. That is
not evidence that their research is wrong; it means current headers use the
blanket cohort stamp, free-form prose, or no marker instead. They should not
be presented as actively cited taxonomy categories until a header carries a
specific recognition cue.

## Full entry census

The table includes every entry from the taxonomy. “No current citation” is a
real audit result, not a guessed classification.

### C entries

| Entry | Citations | Audit status |
|---|---:|---|
| C-1 | 0 | No current citation |
| C-2 | 0 | No current citation |
| C-3 | 0 | No current citation |
| C-4 | 0 | No current citation |
| C-5 | 0 | No current citation |
| C-6 | 0 | No current citation |
| C-7 | 0 | No current citation |
| C-8 | 1 | Mis-filed ISA/inline-assembly floor |
| C-9 | 0 | No current citation |
| C-10 | 0 | No current citation |
| C-11 | 0 | No current citation |
| C-12 | 0 | No current citation |
| C-13 | 0 | No current citation |
| C-14 | 0 | No current citation |
| C-15 | 0 | No current citation |
| C-16 | 0 | No current citation |
| C-17 | 0 | No current citation |
| C-18 | 0 | No current citation |
| C-19 | 0 | No current citation |
| C-20 | 0 | No current citation |
| C-21 | 0 | No current citation |
| C-22 | 0 | No current citation |
| C-23 | 1 | Suspect composite/mis-citation |
| C-24 | 0 | No current citation |
| C-25 | 0 | No current citation |
| C-26 | 0 | No current citation |
| C-27 | 0 | No current citation |
| C-28 | 0 | No current citation |
| C-29 | 0 | No current citation |
| C-30 | 0 | No current citation |
| C-31 | 4 | Aligned recognition cue |
| C-32 | 17 | Aligned, add relocation witness |
| C-33 | 0 | No current citation |
| C-34 | 116 | Overbroad/catch-all risk |
| C-35 | 0 | No current citation |
| C-36 | 1 | Tooling classification, not codegen |
| C-37 | 0 | No current citation |
| C-38 | 0 | No current citation |
| C-39 | 0 | No current citation |
| C-39a | 0 | No current citation |
| C-39b | 0 | No current citation |
| C-39d | 0 | No current citation |
| C-39e | 0 | No current citation |
| C-39f | 0 | No current citation |
| C-39g | 0 | No current citation |
| C-40 | 0 | No current citation |
| C-41 | 0 | No current citation |
| C-42 | 0 | No current citation |
| C-43 | 0 | No current citation |
| C-44 | 0 | No current citation |

### P entries

| Entry | Citations | Audit status |
|---|---:|---|
| P-1 | 0 | No current citation |
| P-2 | 0 | No current citation |
| P-3 | 0 | No current citation |
| P-4 | 0 | No current citation |
| P-5 | 0 | No current citation |
| P-6 | 0 | No current citation |
| P-7 | 0 | No current citation; superseded in taxonomy by C-27 |
| P-8 | 0 | No current citation; promoted in taxonomy by C-25 |
| P-9 | 0 | No current citation; mask-form scope remains documented |
| P-10 | 0 | No current citation; superseded in taxonomy by C-29 |
| P-11 | 1 | Aligned recognition cue |
| P-12 | 0 | No current citation |
| P-13 | 0 | No current citation |
| P-14 | 0 | No current citation |
| P-15 | 0 | No current citation |
| P-16 | 0 | No current citation |

## Detailed findings

### C-8: reclassify the cited case as an ISA floor

`src/main/func_020928cc.s` explicitly says its loop contains privileged
`mcr p15, ...` and “is not accessible from C.” That matches the permanent
ISA-floor rule, not C-8's current placement under “coercible-with-knowledge.”
Proposed wording: move the recognition to the permanent ISA ledger (for
example `P-ISA`), with the rule “inline-asm wrapper only; do not iterate C
levers.” Keep a historical C-8 alias if old reports use it, but do not let a
C-8 header imply a source-form recipe exists.

### C-23: reserve the code for its stated MMIO cue

The C-23 criterion is narrow: nearby volatile MMIO constants plus the
mwcc-2.0 base-fold and `ANDS`→`TST` peepholes. The only current C-23 header is
`func_02023478.s`; its own prose identifies a duplicate pool (`C-34`) and a
literal-tail trim trap (`C-36`), not the four-register MMIO block. Proposed
wording: cite that file as `C-34 + C-36 composite`, and reserve C-23 for a
header that names the MMIO block or records the corresponding relocation/body
witness.

### C-31 and C-32: the criteria are good, the citation format is thin

The four C-31 headers all identify mwldarm interwork veneers, and the 17 C-32
headers identify cross-overlay hardcoded BLs. Those uses agree with the
taxonomy. Proposed header forms should add the mechanical witness:

* C-31: `shim=8B/12B`, mode (`.thumb`/`.arm`), and `ldr; bx; .word` shape.
* C-32: `reloc=module:none` (or an explicit unresolved cross-overlay target)
  plus the `.word` BL location.

This prevents a generic “hardcoded BL” or “short veneer” from being cited as
the wrong family.

### C-34: the current citation is a catch-all risk

All 116 C-34 headers use a short label such as “C-34 candidate. Vanilla” or
“C-34 candidate. Duplicate”; they do not record the documented two-load,
same-value, distinct-pool-slot witness. A mechanical body scan found a
repeated `.word` operand in **37/116** files and none in **79/116**. The scan
does not prove the 79 are false—some pool values are expressed through other
assembly forms—but it does prove that the current header label is too weak to
justify the full criterion.

Proposed wording: split `C-34 candidate` from `C-34 confirmed`, and require
the header to record the two pool offsets and symbol/value (or a relocation
equivalent). If the evidence is only a source-shape guess, use an unclassified
`C-N?`/candidate note instead of C-34. This is especially important because
C-34 is cited 116 times while every other active code is cited 17 times or
fewer.

### C-36: move the category boundary toward tooling

C-36's documented mechanism is `patch_section_align.py` trimming a literal
tail incorrectly; the fix is a delinks-aware patcher guard. The `.s` recipe is
real, but no compiler lever changes the generated function. Proposed wording:
move it under a `T-*` tooling/packaging section and make the source header say
“tooling trim trap,” reserving C-NN for compiler codegen coercions.

### P-11: aligned, but avoid umbrella expansion

The one current P-11 header says “medium-tier P-11” and its body is a normal
helper-call function. That matches the documented size/register-allocation
plateau. Keep the narrower discriminator in the entry: normal pool loads,
normal BL relocs, and a 0x5c–0x74 body. Do not use P-11 as a generic label for
any register mismatch; P-4/P-8 and the specific C promotions remain separate.

## Specific rewording proposals (taxonomy unchanged here)

1. Add a required “recognition witness” field to every future wall header:
   code, size range, and one body/relocation cue. A bare `C-34 candidate`
   label is insufficient.
2. Reclassify C-8's `mcr` example into the permanent ISA ledger.
3. Correct `func_02023478`'s citation to the C-34/C-36 composite and reserve
   C-23 for the MMIO base-fold/ANDS→TST criterion.
4. Split C-34 into `candidate` versus `confirmed`, requiring the duplicate
   pool witness for the latter; this addresses the 116-file catch-all risk.
5. Move C-36 to a tooling/packaging family and rename its header cue
   accordingly.
6. Require C-31/C-32/P-11 headers to carry their objective shape witnesses;
   their current prose labels are directionally correct but not sufficient
   for an automated audit.

No taxonomy entry was rewritten by this queue item.
