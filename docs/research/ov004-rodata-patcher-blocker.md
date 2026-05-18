# ov004 .rodata cluster — patcher 4-byte ctor/pad blocker

**Filed during:** brief 145 attempt (decomper/ov004-rodata-cluster-wave).
**Status:** BLOCKED. Brief 145 cannot ship cluster work as specified.
**Suggested next step:** brief 146+ candidate — patcher fix for variable
ctor/pad shape.

## Summary

Brief 142's patcher generalisation (accept any veneer count `n ∈ [0, 86]`)
handles the splice-count arithmetic correctly. But the `_fix_ctor_and_pad`
step **still assumes a fixed 16-byte input shape** (8-byte built ctor +
8-byte pad) regardless of `n`. When `n` drops below 86, mwldarm appears
to emit only 12 bytes (4-byte built ctor + 8-byte pad — no `WRITEW(0)`
terminator), so the patcher's hardcoded `fix_end = ctor_file_offset + 16`
consumes 4 bytes of the next section and corrupts downstream layout by
exactly 4 bytes.

## Reproduction

Starting from `main` at commit 1dca558 (3-region SHA1 PASS baseline):

```bash
cat > src/overlay004/data/data_ov004_02200de8.c <<'EOF'
const unsigned char data_ov004_02200de8[12] = {
    0x00, 0x08, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00,
    0x00, 0x00, 0x00, 0x00,
};
EOF
cat >> config/eur/arm9/overlays/ov004/delinks.txt <<'EOF'

src/overlay004/data/data_ov004_02200de8.c:
    complete
    .rodata start:0x02200de8 end:0x02200df4
EOF
python tools/configure.py eur && ninja sha1
```

Result:

```
patched build/eur/build/arm9_ov004.bin: spliced 9 veneers (108 bytes), ...
gx-spirit-caller_eur.nds: FAILED
  expected: 1da50df7c210fae96dc69b3825554b9ce13b4f75
  actual:   b2453580015d696a89b83e18231f5d9a261c68dd
```

`build/eur/build/arm9_ov004.bin` is 268188 bytes (orig is 268192 — short
by exactly 4 bytes).

## Diff

First byte diff: `0x0003fd40` (vaddr `0x02209aa0`, start of ov004's
`.data` section).

```
ext: 2e4c5a4e 43455200 2e4c5a4e 434c5200  # ".LZNCER\0.LZNCLR\0"
bld: 43455200 2e4c5a4e 434c5200 2e4c5a4e  # "CER\0.LZNCLR\0.LZN"
```

Bld is shifted +4 bytes relative to ext throughout `.data` — i.e., 4
bytes are missing immediately before `.data` (in `.ctor` / `.init` /
`.text` end).

## Veneer / pad arithmetic

With `n = 9` veneers (the count mwldarm emits when **any** ov004
`.rodata` symbol is source-defined — brief 141 finding):

- mwldarm raw output size:  268288 bytes
- patcher splices:           108 bytes (`n × 12 = 9 × 12`)
- patcher ctor/pad fix:      +8 bytes net (4 + 20 - 16)
- patched output:            268288 - 108 + 8 = **268188 bytes**

Expected for orig match:    268192 bytes (orig).

**Off by 4 bytes.**

## Root cause hypothesis

`_fix_ctor_and_pad` in `tools/patch_ov004_veneers.py` (around line 222):

```python
def _fix_ctor_and_pad(data, ctor_file_offset):
    fix_end = ctor_file_offset + 16   # ← assumes 16-byte ctor+pad
    ctor_first_4 = bytes(data[ctor_file_offset:ctor_file_offset + 4])
    pad_20 = b"\x00" * 0x14
    return (
        bytearray(data[:ctor_file_offset])
        + bytearray(ctor_first_4)
        + bytearray(pad_20)
        + bytearray(data[fix_end:])
    )
```

At `n = 86`, mwldarm emits:

```
ctor:  [4-byte real ctor entry] [4-byte WRITEW(0) terminator]   # 8 bytes
pad:   [8 bytes of zeros]                                       # 8 bytes
                                                                # ━━━━━━━
                                                                # 16 bytes
```

At `n = 9` (or any `n < 86`), mwldarm appears to emit:

```
ctor:  [4-byte real ctor entry]                                 # 4 bytes
       (no WRITEW(0) terminator)
pad:   [8 bytes of zeros]                                       # 8 bytes
                                                                # ━━━━━━━
                                                                # 12 bytes
```

So the patcher's `fix_end = ctor_file_offset + 16` over-reads by 4 bytes,
consuming the first 4 bytes of the next section (`.data` start, where
".LZN" lives), then writes 24 bytes back (`ctor_first_4 + pad_20`),
overall shrinking the output by 4 bytes.

## Brief 142's `expected_output_delta_for` formula

```python
def expected_output_delta_for(veneer_count: int) -> int:
    if veneer_count <= 0:
        return 0
    return veneer_count * VENEER_SIZE - CTOR_PAD_FIX_NET_BYTES
```

The `n × 12 - 8` formula assumes the ctor/pad fix always adds 8 bytes
(16 in → 24 out). That's only true when mwldarm emits a 16-byte ctor+pad
region. For variable `n`, the input ctor+pad region varies (16 bytes at
`n=86`, 12 bytes at `n<86`), and the output stays 24 bytes — so the net
delta is **+8 at `n=86`** but **+12 at `n<86`**. The formula needs to
reflect this.

## Proposed brief 146 fix

`_fix_ctor_and_pad` should detect whether bytes 4–7 of the post-splice
ctor region are zero (= present `WRITEW(0)` terminator → 16-byte shape)
or non-zero (= no terminator → 12-byte shape) and set `fix_end` to
`ctor_file_offset + 16` or `+ 12` accordingly. The `expected_output_delta_for`
helper should match.

Recommended test additions:

- Pin the patcher's output size against orig for `n ∈ {86, 9, 0}`.
- Pin first-100-byte hash of the patched output against orig.

## Impact on brief 145

Brief 145 specified ≥ 20 ov004 `.rodata` symbols. Any source-level
`.rodata` claim suppresses veneers (brief 141 finding: 2 claims → 9
veneers; this brief: 1 claim → 9 veneers, confirming the suppression is
all-or-nothing once any `.rodata` symbol is defined).

Therefore **no number of ov004 `.rodata` claims passes SHA1** with the
current brief 142 patcher. Brief 145 ships 0 cluster work and this
research note. Brief 146+ should close the patcher bug; brief 147+ can
re-run brief 145's plan on top.

## Reference

- Brief 141 PR #557: original W7 invariant discovery (.rodata claims drop
  veneer count from 86 → 9).
- Brief 142 PR #562: patcher accepts variable veneer count.
- This document: characterises the remaining bug in brief 142's fix.
