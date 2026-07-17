[//]: # (markdownlint-disable MD013 MD041)

# Brief 607 - secure-area data generation

This is the generation half of the brief-600 carve plan. Each fragment is a
raw-byte `.s` copied from the matching original ROM, not reverse-engineered
source. The emitter reads ROM offset `0x4000 + (addr - 0x02000000)` and uses
`--verify` to decode its emitted `.byte` directives back to the source bytes.

## Canary

Command:

```text
python3.13 tools/emit_data_blob.py --version eur --addr 0x02000000 --size 0x86 --name SecureAreaData_02000000 --srcdir src/main --from-orig --verify
```

Result: `round-trip verified: SecureAreaData_02000000 byte-identical (134 bytes)`.

## Generated manifest

Every row below was generated with `--from-orig --verify` and reports a
byte-identical static round-trip.

| Region | Fragment | Range | Bytes | Status |
|---|---|---|---:|---|
| EUR | `SecureAreaData_02000000` | `02000000..02000086` | 0x86 | generated / verified |
| EUR | `SecureAreaData_0200008c` | `0200008c..020000f2` | 0x66 | generated / verified |
| EUR | `SecureAreaData_020000f6` | `020000f6..0200017a` | 0x84 | generated / verified |
| EUR | `SecureAreaData_0200017e` | `0200017e..020001f2` | 0x74 | generated / verified |
| EUR | `SecureAreaData_020001f6` | `020001f6..02000254` | 0x5e | generated / verified |
| EUR | `SecureAreaData_02000258` | `02000258..020002ae` | 0x56 | generated / verified |
| EUR | `SecureAreaData_020002b2` | `020002b2..02000324` | 0x72 | generated / verified |
| EUR | `SecureAreaData_0200032a` | `0200032a..02000394` | 0x6a | generated / verified |
| EUR | `SecureAreaData_02000398` | `02000398..02000400` | 0x68 | generated / verified |
| EUR | `SecureAreaData_02000404` | `02000404..0200045a` | 0x56 | generated / verified |
| EUR | `SecureAreaData_0200045e` | `0200045e..020004b0` | 0x52 | generated / verified |
| EUR | `SecureAreaData_020004b4` | `020004b4..02000524` | 0x70 | generated / verified |
| EUR | `SecureAreaData_02000528` | `02000528..02000584` | 0x5c | generated / verified |
| EUR | `SecureAreaData_02000588` | `02000588..020005f6` | 0x6e | generated / verified |
| EUR | `SecureAreaData_020005fa` | `020005fa..02000652` | 0x58 | generated / verified |
| EUR | `SecureAreaData_02000656` | `02000656..020006b0` | 0x5a | generated / verified |
| EUR | `SecureAreaData_020006b4` | `020006b4..02000728` | 0x74 | generated / verified |
| EUR | `SecureAreaData_0200072c` | `0200072c..0200078a` | 0x5e | generated / verified |
| EUR | `SecureAreaData_0200078e` | `0200078e..02000800` | 0x72 | generated / verified |
| USA | `SecureAreaData_02000000` | `02000000..0200009e` | 0x9e | generated / verified |
| USA | `SecureAreaData_020000a4` | `020000a4..0200010e` | 0x6a | generated / verified |
| USA | `SecureAreaData_02000112` | `02000112..0200019c` | 0x8a | generated / verified |
| USA | `SecureAreaData_020001a0` | `020001a0..020001ea` | 0x4a | generated / verified |
| USA | `SecureAreaData_020001ee` | `020001ee..02000256` | 0x68 | generated / verified |
| USA | `SecureAreaData_0200025a` | `0200025a..020002d2` | 0x78 | generated / verified |
| USA | `SecureAreaData_020002d6` | `020002d6..02000320` | 0x4a | generated / verified |
| USA | `SecureAreaData_02000324` | `02000324..02000378` | 0x54 | generated / verified |
| USA | `SecureAreaData_0200037c` | `0200037c..020003d0` | 0x54 | generated / verified |
| USA | `SecureAreaData_020003d4` | `020003d4..02000442` | 0x6e | generated / verified |
| USA | `SecureAreaData_02000446` | `02000446..020004a4` | 0x5e | generated / verified |
| USA | `SecureAreaData_020004a8` | `020004a8..02000502` | 0x5a | generated / verified |
| USA | `SecureAreaData_02000508` | `02000508..0200057e` | 0x76 | generated / verified |
| USA | `SecureAreaData_02000582` | `02000582..020005ec` | 0x6a | generated / verified |
| USA | `SecureAreaData_020005f0` | `020005f0..02000662` | 0x72 | generated / verified |
| USA | `SecureAreaData_02000666` | `02000666..020006b6` | 0x50 | generated / verified |
| USA | `SecureAreaData_020006ba` | `020006ba..0200072c` | 0x72 | generated / verified |
| USA | `SecureAreaData_02000730` | `02000730..0200078a` | 0x5a | generated / verified |
| USA | `SecureAreaData_0200078e` | `0200078e..02000800` | 0x72 | generated / verified |
| JPN | `SecureAreaData_02000000` | `02000000..0200007e` | 0x7e | generated / verified |
| JPN | `SecureAreaData_02000082` | `02000082..020000ee` | 0x6c | generated / verified |
| JPN | `SecureAreaData_020000f2` | `020000f2..02000162` | 0x70 | generated / verified |
| JPN | `SecureAreaData_02000166` | `02000166..020001ca` | 0x64 | generated / verified |
| JPN | `SecureAreaData_020001ce` | `020001ce..02000236` | 0x68 | generated / verified |
| JPN | `SecureAreaData_0200023a` | `0200023a..020002b0` | 0x76 | generated / verified |
| JPN | `SecureAreaData_020002b4` | `020002b4..02000322` | 0x6e | generated / verified |
| JPN | `SecureAreaData_02000328` | `02000328..0200039a` | 0x72 | generated / verified |
| JPN | `SecureAreaData_0200039e` | `0200039e..02000404` | 0x66 | generated / verified |
| JPN | `SecureAreaData_02000408` | `02000408..0200047c` | 0x74 | generated / verified |
| JPN | `SecureAreaData_02000480` | `02000480..020004cc` | 0x4c | generated / verified |
| JPN | `SecureAreaData_020004d2` | `020004d2..02000538` | 0x66 | generated / verified |
| JPN | `SecureAreaData_0200053c` | `0200053c..02000594` | 0x58 | generated / verified |
| JPN | `SecureAreaData_02000598` | `02000598..020005e4` | 0x4c | generated / verified |
| JPN | `SecureAreaData_020005e8` | `020005e8..02000644` | 0x5c | generated / verified |
| JPN | `SecureAreaData_02000648` | `02000648..020006b8` | 0x70 | generated / verified |
| JPN | `SecureAreaData_020006bc` | `020006bc..0200071a` | 0x5e | generated / verified |
| JPN | `SecureAreaData_0200071e` | `0200071e..02000786` | 0x68 | generated / verified |
| JPN | `SecureAreaData_0200078a` | `0200078a..02000800` | 0x76 | generated / verified |

## Independent audit

- 57/57 emitted `.s` files decode to the exact original-ROM slice.
- EUR, USA, and JPN each generated 19 fragments / 1,972 bytes.
- Delinks are address-sorted and contain no overlaps; each new block has an
  explicit `verbatim bytes copied from orig/baserom_<region>.nds` comment.
- No `ninja sha1`, `ninja rom`, Wine, or `batch_carve` was run. The brain owns
  the three-region SHA1 gate.
