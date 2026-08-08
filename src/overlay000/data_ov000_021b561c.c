/* data_ov000_021b561c (12 bytes, 4-aligned): size-ish record paired with
 * data_ov000_021b5600 in the same call.
 * Consumer: func_ov000_021ad660 (src/overlay000/func_ov000_021ad660.s:193
 * _LIT12, relocs.txt ov000:235 from:0x021ad8cc kind:load to:0x021b561c),
 * loop body lines 152-153/159 (r8 pinned to 0): `ldrh r3,[r7,r3]`
 * (+0x0=32), `ldrh r1,[r0,#0x2]` (+0x2=24), forwarded as arg3/arg4
 * (arg4 via the stack, line 156 `str r1,[sp]`) to
 * func_ov000_021ac478(ctx,224,168,32,24) at line 161. func_ov000_021ac478
 * (still .s) bit-packs 32 and 24 as two plain 8-bit fields at bits
 * [7:0]/[15:8] of ctx[4] (`bic #0xff`/`bic #0xff00` + `orr`), unlike the
 * 9-bit x0/y0 fields -- consistent with a smaller-range width/height
 * paired with data_ov000_021b5600/5614's position (see that file's note
 * on the 256-32=224 / 192-24=168 arithmetic), though unproven since the
 * callee is unmatched.
 * Words at +0x4/+0x8 (0x4000,0x10) are not dereferenced by the one known
 * reader, and no reloc targets 0x021b5620/5624 -- kept as plain ints.
 */
typedef struct {
    unsigned short w;   /* +0x0, func_ov000_021ac478 arg3 (32) */
    unsigned short h;   /* +0x2, func_ov000_021ac478 arg4 (24) */
    int f04, f08;        /* not dereferenced by the one known reader */
} data_ov000_021b561c_t;

const data_ov000_021b561c_t data_ov000_021b561c = { 32, 24, 0x4000, 0x10 };
