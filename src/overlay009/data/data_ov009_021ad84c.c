/* data_ov009_021ad84c (12 bytes, 4-aligned): 5 packed 15-bit (5/5/5-bit
 * channel) color values + 1 unused trailing halfword.
 * Consumer: src/overlay009/func_ov009_021ab9f8.s (Ov009_ScoreCtrl_DrawFrame)
 * -- copies the first 5 halfwords verbatim into a local stack buffer
 * (lines 28-39: five `ldrh`/`strh` pairs at source offsets
 * +0/+2/+4/+6/+8; the 6th halfword at +0xa is never read), then calls
 * `func_ov009_021ad214(this, 0x05000636, &localbuf, 5, {0x00600100})`
 * (line 207, label .L_388). relocs.txt:190 `from:0x021ac1cc kind:load
 * to:0x021ad84c module:overlay(9)`.
 * func_ov009_021ad214.s (the callee) proves the "5 packed colors"
 * reading: it loops exactly `count`(=5) times over the passed buffer
 * (`ldrh r8,[r2]; add r2,r2,#2`), unpacks each halfword into three 5-bit
 * fields (`r8&0x1f`, `(r8>>5)&0x1f`, `(r8>>10)&0x1f` -- a 5/5/5 packed
 * color), blends each channel against a global fade factor
 * `data_021040ac[0x38]&0x3f`, and writes the faded 15-bit color back out
 * -- a per-channel brightness/fade helper over a short color ramp, NOT a
 * generic x/y/w/h record. (Per-entry color semantics, i.e. which UI
 * element each of the 5 colors paints, are not recovered here -- only
 * the shape is evidenced: 5 live colors + 1 padding halfword.)
 * All accesses are `ldrh` (never `ldrsh`) -> `unsigned short`. Falls in
 * ov009's `.rodata start:0x021ad82c end:0x021ad868`, so `const`.
 * NOT part of the data_ov009_021ada90 Ov009HitRect family below, despite
 * the coincidental 12-byte size: different section, different consumer
 * (no func_ov009_021ac458 point-in-rect call reaches it), and its
 * address is not on the data_ov009_021ada18-based array's 12-byte-stride
 * arithmetic progression.
 */
const unsigned short data_ov009_021ad84c[6] = {
    0x0863, 0x114b, 0x0eb9, 0x031f, 0x13bf, 0x0000,
};
