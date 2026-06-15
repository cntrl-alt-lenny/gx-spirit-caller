[//]: # (markdownlint-disable MD013 MD041)

# Brief 415 - ov004 hard residue diagnose-and-drain

**Brief:** 415 (decomper). Re-census ov004 after the brief-413 sweep, split the
162 remaining uncarved `.text` functions into RE/C, `.s`-carveable, and
tooling-blocked buckets, then ship the carveable set from a fresh main branch.
Use brief-406 `asm_escape --classify-data` before every carve, park only on
REFUSE, and run the three-region SHA gate.

## Headline

This wave ships **138 ARM whole-function `.s` carves** in ov004. Each shipped
function was preflight-clean under:

```
python3.13 tools/asm_escape.py <func> --classify-data --version eur
python3.13 tools/asm_escape.py <func> --whole-function --version eur --out ...
```

and the second command reported byte-identical output against the delinked
object before the file was added to `src/overlay004` and delinked.

The 162 `.text` residue split as:

| Bucket | Count | Outcome |
|--------|------:|---------|
| ARM `.s`-carveable | 138 | Shipped |
| kind:data REFUSE / C-absorbed data | 9 | Parked |
| Thumb emitter/assembler blocked | 4 | Parked |
| Thumb corridor SHA-blocked after clean per-function carve | 11 | Parked |
| RE/C giants shipped as C | 0 | No C attempt started after preflight routed the remaining candidates to `.s` or tooling-blocked buckets |

`__sinit_ov004_02209a5c` is still unmatched in `.init`; it is outside the 162
`.text` cohort named by the brief and was not touched.

## Shipped ranges

All rows below are sorted by address. Status for each row: classify-data OK,
whole-function `.s` byte-identical vs delinked `.o`, delinked at the exact range.

| Function | Range | Size |
|----------|-------|-----:|
| `func_ov004_021c9dd4` | `0x021c9dd4..0x021c9eec` | `0x118` |
| `func_ov004_021c9ef0` | `0x021c9ef0..0x021c9f94` | `0x0a4` |
| `func_ov004_021c9fcc` | `0x021c9fcc..0x021ca0a4` | `0x0d8` |
| `func_ov004_021ca0a4` | `0x021ca0a4..0x021ca128` | `0x084` |
| `func_ov004_021ca128` | `0x021ca128..0x021ca198` | `0x070` |
| `func_ov004_021caedc` | `0x021caedc..0x021cb060` | `0x184` |
| `func_ov004_021cb518` | `0x021cb518..0x021cb568` | `0x050` |
| `func_ov004_021cb63c` | `0x021cb63c..0x021cb778` | `0x13c` |
| `func_ov004_021cb778` | `0x021cb778..0x021cb834` | `0x0bc` |
| `func_ov004_021cb834` | `0x021cb834..0x021cb940` | `0x10c` |
| `func_ov004_021cb940` | `0x021cb940..0x021cb9e4` | `0x0a4` |
| `func_ov004_021cb9e4` | `0x021cb9e4..0x021cbf38` | `0x554` |
| `func_ov004_021cc014` | `0x021cc014..0x021cc0e0` | `0x0cc` |
| `func_ov004_021cc0e0` | `0x021cc0e0..0x021cc21c` | `0x13c` |
| `func_ov004_021cc21c` | `0x021cc21c..0x021cc2a4` | `0x088` |
| `func_ov004_021cc2a4` | `0x021cc2a4..0x021cc2f0` | `0x04c` |
| `func_ov004_021cc49c` | `0x021cc49c..0x021cc63c` | `0x1a0` |
| `func_ov004_021cc63c` | `0x021cc63c..0x021cc74c` | `0x110` |
| `func_ov004_021cc7bc` | `0x021cc7bc..0x021cc97c` | `0x1c0` |
| `func_ov004_021cc97c` | `0x021cc97c..0x021cca30` | `0x0b4` |
| `func_ov004_021cca30` | `0x021cca30..0x021cced8` | `0x4a8` |
| `func_ov004_021cced8` | `0x021cced8..0x021cd3b4` | `0x4dc` |
| `func_ov004_021cd3b4` | `0x021cd3b4..0x021cd6c4` | `0x310` |
| `func_ov004_021cd6c4` | `0x021cd6c4..0x021cd924` | `0x260` |
| `func_ov004_021cd924` | `0x021cd924..0x021cda8c` | `0x168` |
| `func_ov004_021cda8c` | `0x021cda8c..0x021cdd1c` | `0x290` |
| `func_ov004_021cdd38` | `0x021cdd38..0x021cde38` | `0x100` |
| `func_ov004_021cde38` | `0x021cde38..0x021cded0` | `0x098` |
| `func_ov004_021cded0` | `0x021cded0..0x021ce1bc` | `0x2ec` |
| `func_ov004_021ce1ec` | `0x021ce1ec..0x021ce364` | `0x178` |
| `func_ov004_021ce364` | `0x021ce364..0x021ce4a8` | `0x144` |
| `func_ov004_021ce4a8` | `0x021ce4a8..0x021ce9b8` | `0x510` |
| `func_ov004_021ced78` | `0x021ced78..0x021cedf8` | `0x080` |
| `func_ov004_021cedf8` | `0x021cedf8..0x021cf070` | `0x278` |
| `func_ov004_021cf070` | `0x021cf070..0x021cf3a8` | `0x338` |
| `func_ov004_021cf3a8` | `0x021cf3a8..0x021cf600` | `0x258` |
| `func_ov004_021cf638` | `0x021cf638..0x021cfb84` | `0x54c` |
| `func_ov004_021cfbec` | `0x021cfbec..0x021cfc64` | `0x078` |
| `func_ov004_021cfc64` | `0x021cfc64..0x021cfd6c` | `0x108` |
| `func_ov004_021cfd6c` | `0x021cfd6c..0x021cfe08` | `0x09c` |
| `func_ov004_021cfe08` | `0x021cfe08..0x021d0168` | `0x360` |
| `func_ov004_021d0168` | `0x021d0168..0x021d02f4` | `0x18c` |
| `func_ov004_021d03ec` | `0x021d03ec..0x021d0530` | `0x144` |
| `func_ov004_021d0530` | `0x021d0530..0x021d05f4` | `0x0c4` |
| `func_ov004_021d05f4` | `0x021d05f4..0x021d06ac` | `0x0b8` |
| `func_ov004_021d06ac` | `0x021d06ac..0x021d0e98` | `0x7ec` |
| `func_ov004_021d0e98` | `0x021d0e98..0x021d0f98` | `0x100` |
| `func_ov004_021d0f98` | `0x021d0f98..0x021d1118` | `0x180` |
| `func_ov004_021d1118` | `0x021d1118..0x021d1264` | `0x14c` |
| `func_ov004_021d1308` | `0x021d1308..0x021d1360` | `0x058` |
| `func_ov004_021d1448` | `0x021d1448..0x021d1a38` | `0x5f0` |
| `func_ov004_021d2628` | `0x021d2628..0x021d2aac` | `0x484` |
| `func_ov004_021d2aac` | `0x021d2aac..0x021d2c40` | `0x194` |
| `func_ov004_021d2c40` | `0x021d2c40..0x021d2ec4` | `0x284` |
| `func_ov004_021d2ec4` | `0x021d2ec4..0x021d3390` | `0x4cc` |
| `func_ov004_021d3390` | `0x021d3390..0x021d3578` | `0x1e8` |
| `func_ov004_021d38c4` | `0x021d38c4..0x021d3a58` | `0x194` |
| `func_ov004_021d3a7c` | `0x021d3a7c..0x021d3b74` | `0x0f8` |
| `func_ov004_021d3bc0` | `0x021d3bc0..0x021d3c88` | `0x0c8` |
| `func_ov004_021d3c8c` | `0x021d3c8c..0x021d3d2c` | `0x0a0` |
| `func_ov004_021d3de4` | `0x021d3de4..0x021d3e9c` | `0x0b8` |
| `func_ov004_021d3f44` | `0x021d3f44..0x021d4004` | `0x0c0` |
| `func_ov004_021d4044` | `0x021d4044..0x021d40bc` | `0x078` |
| `func_ov004_021d40bc` | `0x021d40bc..0x021d4190` | `0x0d4` |
| `func_ov004_021d4190` | `0x021d4190..0x021d4238` | `0x0a8` |
| `func_ov004_021d427c` | `0x021d427c..0x021d42f8` | `0x07c` |
| `func_ov004_021d42f8` | `0x021d42f8..0x021d43a0` | `0x0a8` |
| `func_ov004_021d43a0` | `0x021d43a0..0x021d441c` | `0x07c` |
| `func_ov004_021d441c` | `0x021d441c..0x021d44cc` | `0x0b0` |
| `func_ov004_021d44cc` | `0x021d44cc..0x021d4584` | `0x0b8` |
| `func_ov004_021d4584` | `0x021d4584..0x021d46a4` | `0x120` |
| `func_ov004_021d46a4` | `0x021d46a4..0x021d47bc` | `0x118` |
| `func_ov004_021d4804` | `0x021d4804..0x021d4870` | `0x06c` |
| `func_ov004_021d4870` | `0x021d4870..0x021d48bc` | `0x04c` |
| `func_ov004_021d48bc` | `0x021d48bc..0x021d4914` | `0x058` |
| `func_ov004_021d49b4` | `0x021d49b4..0x021d4a48` | `0x094` |
| `func_ov004_021d4a48` | `0x021d4a48..0x021d4ad4` | `0x08c` |
| `func_ov004_021d4ae4` | `0x021d4ae4..0x021d4ba8` | `0x0c4` |
| `func_ov004_021d4ba8` | `0x021d4ba8..0x021d4d8c` | `0x1e4` |
| `func_ov004_021d4d8c` | `0x021d4d8c..0x021d4e08` | `0x07c` |
| `func_ov004_021d4e0c` | `0x021d4e0c..0x021d5004` | `0x1f8` |
| `func_ov004_021d5004` | `0x021d5004..0x021d512c` | `0x128` |
| `func_ov004_021d512c` | `0x021d512c..0x021d52a0` | `0x174` |
| `func_ov004_021d52a0` | `0x021d52a0..0x021d5318` | `0x078` |
| `func_ov004_021d5318` | `0x021d5318..0x021d53c0` | `0x0a8` |
| `func_ov004_021d53c0` | `0x021d53c0..0x021d552c` | `0x16c` |
| `func_ov004_021d552c` | `0x021d552c..0x021d55d8` | `0x0ac` |
| `func_ov004_021d55d8` | `0x021d55d8..0x021d5638` | `0x060` |
| `func_ov004_021d5638` | `0x021d5638..0x021d56fc` | `0x0c4` |
| `func_ov004_021d5738` | `0x021d5738..0x021d57ec` | `0x0b4` |
| `func_ov004_021d57ec` | `0x021d57ec..0x021d5838` | `0x04c` |
| `func_ov004_021d5838` | `0x021d5838..0x021d5a10` | `0x1d8` |
| `func_ov004_021d5a10` | `0x021d5a10..0x021d5a90` | `0x080` |
| `func_ov004_021d5a90` | `0x021d5a90..0x021d5b14` | `0x084` |
| `func_ov004_021d5b14` | `0x021d5b14..0x021d5b9c` | `0x088` |
| `func_ov004_021d5bdc` | `0x021d5bdc..0x021d5ce4` | `0x108` |
| `func_ov004_021d5ce4` | `0x021d5ce4..0x021d5d84` | `0x0a0` |
| `func_ov004_021d5dc8` | `0x021d5dc8..0x021d62b8` | `0x4f0` |
| `func_ov004_021d62b8` | `0x021d62b8..0x021d6384` | `0x0cc` |
| `func_ov004_021d6384` | `0x021d6384..0x021d641c` | `0x098` |
| `func_ov004_021d641c` | `0x021d641c..0x021d6468` | `0x04c` |
| `func_ov004_021d6468` | `0x021d6468..0x021d66f4` | `0x28c` |
| `func_ov004_021d6734` | `0x021d6734..0x021d6a10` | `0x2dc` |
| `func_ov004_021d6a10` | `0x021d6a10..0x021d6b88` | `0x178` |
| `func_ov004_021d6b88` | `0x021d6b88..0x021d6ed0` | `0x348` |
| `func_ov004_021d6ed0` | `0x021d6ed0..0x021d6f20` | `0x050` |
| `func_ov004_021d6f20` | `0x021d6f20..0x021d705c` | `0x13c` |
| `func_ov004_021d705c` | `0x021d705c..0x021d7118` | `0x0bc` |
| `func_ov004_021d71ec` | `0x021d71ec..0x021d7440` | `0x254` |
| `func_ov004_021d7440` | `0x021d7440..0x021d7564` | `0x124` |
| `func_ov004_021d7564` | `0x021d7564..0x021d7854` | `0x2f0` |
| `func_ov004_021d7854` | `0x021d7854..0x021d7910` | `0x0bc` |
| `func_ov004_021d7910` | `0x021d7910..0x021d7c00` | `0x2f0` |
| `func_ov004_021d7c84` | `0x021d7c84..0x021d7f2c` | `0x2a8` |
| `func_ov004_021d7f2c` | `0x021d7f2c..0x021d83b0` | `0x484` |
| `func_ov004_021d83b0` | `0x021d83b0..0x021d8608` | `0x258` |
| `func_ov004_021d8648` | `0x021d8648..0x021d8798` | `0x150` |
| `func_ov004_021d8798` | `0x021d8798..0x021d8cd0` | `0x538` |
| `func_ov004_021d8d1c` | `0x021d8d1c..0x021d8d58` | `0x03c` |
| `func_ov004_021d8d58` | `0x021d8d58..0x021d9134` | `0x3dc` |
| `func_ov004_021d9134` | `0x021d9134..0x021d9418` | `0x2e4` |
| `func_ov004_021d9418` | `0x021d9418..0x021d9724` | `0x30c` |
| `func_ov004_021d9810` | `0x021d9810..0x021d9948` | `0x138` |
| `func_ov004_021d997c` | `0x021d997c..0x021d9b98` | `0x21c` |
| `func_ov004_021d9b98` | `0x021d9b98..0x021d9d58` | `0x1c0` |
| `func_ov004_021d9d58` | `0x021d9d58..0x021d9ea4` | `0x14c` |
| `func_ov004_021d9fc4` | `0x021d9fc4..0x021da100` | `0x13c` |
| `func_ov004_021da100` | `0x021da100..0x021da1bc` | `0x0bc` |
| `func_ov004_021da1bc` | `0x021da1bc..0x021da2c8` | `0x10c` |
| `func_ov004_021da2c8` | `0x021da2c8..0x021da36c` | `0x0a4` |
| `func_ov004_021dab1c` | `0x021dab1c..0x021dabc0` | `0x0a4` |
| `func_ov004_021dabcc` | `0x021dabcc..0x021dac7c` | `0x0b0` |
| `func_ov004_021dac7c` | `0x021dac7c..0x021db148` | `0x4cc` |
| `func_ov004_021db148` | `0x021db148..0x021db530` | `0x3e8` |
| `func_ov004_021db530` | `0x021db530..0x021db780` | `0x250` |
| `func_ov004_021db780` | `0x021db780..0x021db860` | `0x0e0` |
| `func_ov004_021db874` | `0x021db874..0x021db994` | `0x120` |
| `func_ov004_021dba08` | `0x021dba08..0x021dbc78` | `0x270` |

## Parked bucket C

### kind:data REFUSE / C-absorbed data

These nine candidates were parked exactly because `--classify-data` refused
them; mere presence of `kind:data` was not treated as a park reason.

| Function | Size | Reason |
|----------|-----:|--------|
| `func_ov004_021cb568` | `0x0d4` | `data_ov004_02200dd0` is C-absorbed in `src/overlay004/data/data_ov004_02200dbc.s` |
| `func_ov004_021d1a38` | `0x0d0` | `data_ov004_02200e30` is C-absorbed in `src/overlay004/data/data_ov004_02200e00.s` |
| `func_ov004_021d1b08` | `0x0a18` | `data_ov004_02200e0c` and `data_ov004_02200e24` are C-absorbed in `src/overlay004/data/data_ov004_02200e00.s` |
| `func_ov004_021d3578` | `0x2a0` | `data_ov004_02200e18` is C-absorbed in `src/overlay004/data/data_ov004_02200e00.s`; `data_ov004_02200de8` was A-aligned OK |
| `func_ov004_021d3e9c` | `0x0a8` | `data_ov004_02200e40` is C-absorbed in `src/overlay004/data/data_ov004_02200e00.s` |
| `func_ov004_021d7118` | `0x0d4` | `data_ov004_02200ea4` is C-absorbed in `src/overlay004/data/data_ov004_02200e00.s` |
| `func_ov004_021d9ef0` | `0x0d4` | `data_ov004_02200eb8` is C-absorbed in `src/overlay004/data/data_ov004_02200e00.s` |
| `func_ov004_021da36c` | `0x4dc` | `data_ov004_02200ec8` is C-absorbed in `src/overlay004/data/data_ov004_02200e00.s`; several B-gap refs were otherwise OK |
| `func_ov004_021db994` | `0x074` | `data_ov004_02200ed8` is C-absorbed in `src/overlay004/data/data_ov004_02200e00.s` |

### Thumb emitter/assembler blocked

These four passed data preflight but the generated whole-function `.s` did not
assemble. The small Thumb functions emit raw literal-pool bytes as text and
miss `_LITn` labels; the large Thumb giant also hits out-of-range pool offsets.

| Function | Size | Shape |
|----------|-----:|-------|
| `func_ov004_021dbc8c` | `0x07c` | Thumb raw literal/pool text, missing `_LITn` |
| `func_ov004_021dc0ac` | `0x03c` | Thumb raw literal/pool text, missing `_LIT0` |
| `func_ov004_021dd648` | `0x0aec` | Thumb raw pools plus multi-pool/offset-out-of-range; A-aligned refs `data_ov004_0220a294`, `data_ov004_0220a298` |
| `func_ov004_021de134` | `0x108` | Thumb raw literal/pool text, missing `_LITn`; A-aligned ref `data_ov004_0220a294` |

### Thumb corridor SHA-blocked

These 11 candidates are the important follow-up bucket. They were clean under
`--classify-data` and individually emitted byte-identical `.s`, but adding the
Thumb set into the existing ov004 Thumb corridor shifted pre-existing Thumb
pool bytes in the final overlay. The failure passed local object checks and
failed the ov004 SHA/compare, matching the brief's pool-constant gotcha shape.
I removed these delinks and files before the final PR set.

| Function | Range | Size |
|----------|-------|-----:|
| `func_ov004_021dc474` | `0x021dc474..0x021dc500` | `0x08c` |
| `func_ov004_021dc570` | `0x021dc570..0x021dc664` | `0x0f4` |
| `func_ov004_021dc830` | `0x021dc830..0x021dc954` | `0x124` |
| `func_ov004_021dc998` | `0x021dc998..0x021dca66` | `0x0ce` |
| `func_ov004_021dca68` | `0x021dca68..0x021dcbca` | `0x162` |
| `func_ov004_021dcbcc` | `0x021dcbcc..0x021dcbee` | `0x022` |
| `func_ov004_021dcbf0` | `0x021dcbf0..0x021dccc8` | `0x0d8` |
| `func_ov004_021dce74` | `0x021dce74..0x021dcf36` | `0x0c2` |
| `func_ov004_021de288` | `0x021de288..0x021de46c` | `0x1e4` |
| `func_ov004_021de46c` | `0x021de46c..0x021de5fc` | `0x190` |
| `func_ov004_021de5fc` | `0x021de5fc..0x021de638` | `0x03c` |

Observed first differing EUR bytes during the all-149 trial included
`0x021dc150`, `0x021dc440`, `0x021dc7bc`, and the `0x021ddf44/0x021de0e9`
gap area. The first example was a pool-word byte-order drift in an existing
Thumb corridor object (`orig dc 05 00 00`, build `00 00 dc 05`). This is a
scaffolder candidate for a Thumb corridor/gap-object integration fix, alongside
the multi-pool and non-4-aligned Thumb emitter work.

## RE / matched-C bucket

No matched-C ship was attempted this round. After the preflight pass, every
remaining `.text` candidate either had a clean `.s` route or landed in one of
the tooling-blocked buckets above. The brief-405 LEANER protocol therefore did
not need to run; the big prior RE target, `func_ov004_021dd648`, classified as
Thumb tooling-blocked here because the `.s` escape failed before any C-grind
would be useful.

## Verification

| Gate | Output |
|------|--------|
| EUR `ninja sha1` | `gx-spirit-caller_eur.nds: OK` |
| USA `ninja sha1` | `gx-spirit-caller_usa.nds: OK` |
| JPN `ninja sha1` | `gx-spirit-caller_jpn.nds: OK` |
| EUR ov004 compare | `eur ov004 cmp: identical` |
| USA ov004 compare | `usa ov004 cmp: identical` |
| JPN ov004 compare | `jpn ov004 cmp: identical` |
| `git diff --check` | no output |
| `sort_delinks.py config/eur/arm9/overlays/ov004/delinks.txt` | `334 blocks, 0 inversions -> 0; no-op (already sorted)` |
| ov004 interval audit | `ov004: 276 .text ranges, no overlaps` |

## Invariants

- Touched code is limited to `src/overlay004/*.s` and the ov004 EUR delinks
  file; no ov002 or main source changes.
- No tool, AGENTS, or `docs/state.md` edits.
- Final shipped delinks are sorted and exact-range only.
- Parked candidates are not partially delinked and have no emitted files in the
  PR.
- Three-region ROM SHA plus per-region ov004 binary compare are clean, which
  covers the ov004 pool-constant gotcha.
