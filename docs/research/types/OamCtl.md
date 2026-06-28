[//]: # (markdownlint-disable MD013 MD041)

# OamCtl

Single-bit control flag cast onto OAM memory at a fixed offset.
Used to enable/disable sprite rendering for a group of OAM entries.

## Confidence: HIGH

Four matched C files in ov018 all cast a pointer to this struct at the same
relative offset from an OAM base pointer, reading/writing the same `b0` bit.

## C Definition

```c
typedef struct OamCtl {
    unsigned short b0 : 1; /* +0x00 bit 0 — render-enable / display flag */
    /* bits 1-15 unused by known functions */
} OamCtl;                  /* sizeof = 0x02 */
```

## Layout evidence

| Offset within OAM | Width | R/W | Source function | Cast base |
|--------------------|-------|-----|-----------------|-----------|
| oam + 0x9b4 | u16:1 | r/w | func_ov018_021accc8 | OAM param `oam` |
| oam + 0x9b4 | u16:1 | r/w | func_ov018_021aaf74 | OAM param `oam` |
| data_ov018_021ae080 + 0xfc | u16:1 | r/w | func_ov018_021aaaf8 | global OAM base |
| data_ov018_021ae080 + 0xfc | u16:1 | r/w | func_ov018_021aaa10 | global OAM base |

The 0x9b4 offset from an OAM base and 0xfc offset from another OAM base
suggest two distinct OAM regions (sub-screen vs main screen, or different
sprite banks).

## Using functions

- `func_ov018_021accc8` — reads/writes `b0` for an OAM parameter
- `func_ov018_021aaf74` — reads/writes `b0` for an OAM parameter
- `func_ov018_021aaaf8` — reads `b0` from global OAM base + 0xfc
- `func_ov018_021aaa10` — reads `b0` from global OAM base + 0xfc

## Related structs

- `Cell` — individual OAM entry (attr + flags); `OamCtl` is a separate
  control word at a fixed offset within the OAM block
