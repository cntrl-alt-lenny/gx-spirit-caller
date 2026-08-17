/* data_ov006_021cc4fc (140 bytes, 4-aligned): {short f0,f2,f4,f6;
 * int f8,fc,f10;}[7], cm-restock-carve-8 -- a 20-byte-stride record
 * array, period confirmed directly from real ROM bytes (7 * 20 = 140,
 * exact), not assumed from the reader alone. Consumer:
 * func_ov006_021bcb94.s, `ldr r8,_LIT5(data_ov006_021cc4fc)` loads the
 * base ONCE (r8 never re-indexed across the function's 7-case `r6`
 * dispatch loop, so only record[0] gets direct field-level reads):
 * `ldrsh r0,[r8,#0x2]`(f2) / `ldr fp,[r8,#0x8]`(f8) / `ldr r9,[r8,#0xc]`
 * (fc) / `ldrsh r7,[r8]`(f0) / `ldrsh r2,[r8,#0x4]`(f4, emitted as
 * field-code 0x11) / `ldrsh r2,[r8,#0x6]`(f6, field-code 0x12) --
 * f0/f2 read as screen X/Y (same idiom as the data_ov006_021cc08c
 * family), f4 a mode/type-looking constant (3 in 6 of 7 rows), f8/fc/
 * f10 unconfirmed by any direct offset access in this reader. Records
 * 1-6's fields are NOT independently reader-confirmed (no other
 * relocation targets this span -- verified against relocs.txt, zero
 * internal relocations anywhere in the 140-byte span, and zero OTHER
 * incoming load relocations besides this one) -- shipped as real,
 * byte-exact ROM content at the same confirmed 20-byte stride,
 * matching this project's established practice for a base-row-
 * confirmed, tail-rows-real-but-individually-unconfirmed record array
 * (cf. data_ov011_021d3376.c's row-table tail-element precedent).
 * f8/fc/f10 read as plain ints throughout (values 0/1/3, well below
 * any plausible pointer range) -- not pointers, confirmed by the same
 * zero-internal-relocations check. Kept non-const, matching the
 * symbol's own prior non-const declaration (.data ground truth).
 */
typedef struct {
    short f0;
    short f2;
    short f4;
    short f6;
    int f8;
    int fc;
    int f10;
} Ov006Row021cc4fc;

Ov006Row021cc4fc data_ov006_021cc4fc[7] = {
    { 175, 17, 3, 0, 0, 0, 0 },
    { 183, 17, 3, 0, 0, 0, 0 },
    { 191, 17, 3, 0, 0, 0, 0 },
    { 199, 17, 3, 0, 0, 0, 0 },
    { 80, 170, 3, 1, 1, 0, 0 },
    { 102, 173, 3, 0, 0, 0, 0 },
    { 110, 173, 3, 0, 0, 0, 0 },
};
