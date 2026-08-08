/* data_ov000_021b5600 (16 bytes, 4-aligned): position/size-ish record --
 * only the first two u16 fields are dereferenced by the one known reader.
 * Consumer: func_ov000_021ad660 (src/overlay000/func_ov000_021ad660.s:194
 * _LIT13, relocs.txt ov000:236 from:0x021ad8d0 kind:load to:0x021b5600),
 * loop body lines 155-158 (r8 pinned to 0): `ldrh r1,[r6,r3]` (+0x0=224),
 * `ldrh r2,[r0,#0x2]` (+0x2=168), forwarded as arg1/arg2 to
 * func_ov000_021ac478(ctx,224,168,<w>,<h>) at line 161 (paired with
 * data_ov000_021b561c's two fields as arg3/arg4). func_ov000_021ac478
 * is still unmatched (.s), but its disasm (Fill32(ctx,0,0x14) then
 * `lsl#0x17;lsr#0x10`/`lsl#0x17;lsr#0x7` bit-inserts) shows 224 and 168
 * land as two 9-bit fields at bit7/bit16 of ctx[0] -- consistent with a
 * screen-coordinate pair (224 = 256-32, 168 = 192-24, i.e. the DS's
 * 256x192 screen minus data_ov000_021b561c's 32x24 size pair -- a
 * bottom-right-anchored box), though this is inferred from the
 * unmatched .s, not proven by matched C.
 * Words at +0x4/+0x8/+0xc (0x40,0x20,0x20) are not dereferenced by the
 * one known reader (r8 never advances past 0), and no reloc targets
 * 0x021b5604/5608/560c -- kept as plain ints.
 */
typedef struct {
    unsigned short x0;  /* +0x0, func_ov000_021ac478 arg1 (224) */
    unsigned short y0;  /* +0x2, func_ov000_021ac478 arg2 (168) */
    int f04, f08, f0c;  /* not dereferenced by the one known reader */
} data_ov000_021b5600_t;

const data_ov000_021b5600_t data_ov000_021b5600 = { 224, 168, 0x40, 0x20, 0x20 };
