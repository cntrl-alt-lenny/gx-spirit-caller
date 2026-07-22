[//]: # (markdownlint-disable MD013 MD041)

# Structural family census — strict anchor set

Snapshot: 2026-07-22. This replaces the original Brief 658 census as the
worklist-facing view. The original 91 families clustered around 8–28 B
exemplars and its completed audit found 0 VERIFIED / 54 SUSPECT / 37
AMBIGUOUS. This rebuild applies a larger-exemplar and real-anchor filter.

## Criteria and survival funnel

An anchor family survives only when all three conditions hold:

1. exemplar `.text` span is **at least 64 B**;
2. its exact relocation signature is non-empty (`sig > 0`); and
3. the exemplar is a current `complete` C/C++ TU in the committed EUR
   delinks tier, including `.legacy.c`, `.thumb.c`, and `.legacy_sp3.c`.

| Stage | Families | Meaning |
|---|---:|---|
| Original Brief 658 anchor families | 91 | baseline census |
| Exemplar ≥64 B | 42 | removes tiny-shape false anchors |
| Exemplar ≥64 B + `sig > 0` | 18 | removes empty-relocation ambiguity |
| All three criteria | **0** | no trustworthy propagation family currently survives |

This zero is the result, not a missing table: the only row previously audited
as VERIFIED, `A-26` (`020a32e4`), is 0x24 B and therefore fails the explicit
size floor. The 18 rows below pass size and signature but remain SUSPECT
because none currently resolves to a complete C anchor.

## Strict survivor set

There are no rows in the strict survivor set. Do not use the 18 near-survivors
below for zero-shot propagation; they are candidates for a future C match, not
currently anchored families.

## Near-survivors rejected only by the C-anchor test

| Family | Exemplar | Size | Reloc sig | Audit status | Rejection |
|---|---|---:|---:|---|---|
| A-38 | `0204320c` | 0x44 | 3 | SUSPECT | no complete C TU |
| A-40 | `02022540` | 0x40 | 1 | SUSPECT | no complete C TU |
| A-43 | `02038d2c` | 0x44 | 1 | SUSPECT | no complete C TU |
| A-44 | `0202d9a0` | 0x58 | 1 | SUSPECT | no complete C TU |
| A-51 | `0206eb08` | 0x44 | 1 | SUSPECT | no complete C TU |
| A-52 | `02067870` | 0x48 | 1 | SUSPECT | no complete C TU |
| A-60 | `0206da98` | 0x40 | 1 | SUSPECT | no complete C TU |
| A-61 | `0200fd1c` | 0x68 | 1 | SUSPECT | no complete C TU |
| A-79 | `02009a68` | 0x48 | 2 | SUSPECT | no complete C TU |
| A-80 | `0206bf94` | 0x48 | 1 | SUSPECT | no complete C TU |
| A-81 | `02084dc0` | 0x4c | 1 | SUSPECT | no complete C TU |
| A-82 | `020a3144` | 0x4c | 1 | SUSPECT | no complete C TU |
| A-83 | `0207034c` | 0x50 | 2 | SUSPECT | no complete C TU |
| A-84 | `0207092c` | 0x54 | 3 | SUSPECT | no complete C TU |
| A-85 | `02044c60` | 0x58 | 1 | SUSPECT | no complete C TU |
| A-86 | `02068890` | 0x6c | 1 | SUSPECT | no complete C TU |
| A-87 | `020125ac` | 0x70 | 2 | SUSPECT | no complete C TU |
| A-88 | `020900a0` | 0x74 | 4 | SUSPECT | no complete C TU |

The remaining 49 original rows fail the size or relocation test (or both),
and the 37 `sig=0` rows remain ambiguous by construction. `A-26` is the one
real current C anchor found by the earlier full audit, but its 0x24 B exemplar
is intentionally not promoted into this larger-exemplar worklist.

## Method and gate

This was a build-free transcription and filter of the committed
`family-census-2026-07.md` data: sizes and relocation counts came from its
complete-family index; C-anchor status came from its completed all-91 audit,
which checks current EUR `delinks.txt` source/status entries. No compiler,
ROM, `ninja`, or source/config/tool input was changed.

The next honest way to create a strict survivor is to land a genuinely matched
C exemplar of at least 64 B with at least one relocation, then rerun this
filter. Until then, the 18 near-survivors are a research queue, not a
propagation queue.
