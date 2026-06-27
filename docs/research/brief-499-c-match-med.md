[//]: # (markdownlint-disable MD013 MD041)

# Brief 499 — C-match MED campaign wave

Branch: `decomper/c-match-med-b499`

Input: `docs/research/c-match-prep/INDEX.json`, filtered to MED tier class C/D candidates. Scaffolder owns HIGH class A/B; this wave stayed in MED.

## Result

| bucket | funcs |
|---|---:|
| MED candidates attempted | 327 |
| EUR candidates that first-pass matched | 74 |
| shipped after USA/JPN port + verification | 50 |
| deferred / restored to `.s` | 277 |
| MED candidates still unattempted | 2372 |

Deferred split:

| reason | funcs |
|---|---:|
| EUR objdiff non-match | 242 |
| EUR compile reject | 11 |
| EUR matched but parked after USA/JPN port refusal | 24 |

The 24 parked ports are ov002 candidates whose target ports still need symbol/data mapping work, mostly unresolved ov002 BSS/data siblings. I restored those EUR matches to `.s` so this PR only carries the verified 3-region intersection.

## Shipped set

By module:

| module | funcs |
|---|---:|
| main | 41 |
| ov002 | 8 |
| ov006 | 1 |

Addresses:

- main: `02001cd0`, `02001ef4`, `02004fb8`, `02006228`, `020097a4`, `0200a68c`, `0200a8b0`, `0200c74c`, `02018cdc`, `02018d58`, `02018e00`, `02018e40`, `0201a4dc`, `0201a530`, `0201bbc8`, `0201bea8`, `0201e8c4`, `02027ddc`, `0202b360`, `0202de9c`, `02031838`, `02031b38`, `020322e8`, `020366b0`, `02038270`, `0203c650`, `0204827c`, `02052fb0`, `02053024`, `02053dfc`, `0206896c`, `0207d29c`, `0207dca8`, `020808b8`, `02088000`, `020918d0`, `02091a0c`, `020920bc`, `02092154`, `02092388`, `0209268c`
- ov002: `021f6304`, `021f6704`, `0220dba4`, `022123fc`, `0227d684`, `022963c4`, `022965c0`, `02296ac0`
- ov006: `021b6250`

Each shipped EUR source was ported to both `src/usa/...` and `src/jpn/...`, with the matching target `.s` removed and delinks changed to the new `.c`/`.legacy.c`.

## Verification

Final gates:

| region | objdiff gate | sha1 gate |
|---|---|---|
| EUR | full `ninja -j4 report`: 50/50 shipped units at 100% | `gx-spirit-caller_eur.nds: OK` |
| USA | `ninja -j4 objdiff` + postprocessors + 50-unit changed-source subset report: 50/50 at 100% | `gx-spirit-caller_usa.nds: OK` |
| JPN | `ninja -j4 objdiff` + postprocessors + 50-unit changed-source subset report: 50/50 at 100% | `gx-spirit-caller_jpn.nds: OK` |

Note: full USA/JPN `objdiff-cli report generate` still panics in an unrelated baseline unit (`objdiff-core` ARM index underflow). The changed-unit subset reports were generated from the completed full-region `objdiff.json` after `objdiff_filter_panic_units.py`, `objdiff_resolve_relocs.py`, and `patch_arm_mapping_symbols.py`, and every shipped source was 100%.

## Runway

The MED pool still has 2372 unattempted candidates. The practical next lane is main-heavy MED C/D or a tooling/data-symbol pass for ov002 ports; the ov002 C bodies can match in EUR, but several cannot currently port safely because target-region BSS/data siblings are unresolved by `port_to_region.py`.
