/* CAMPAIGN-PREP candidate for func_0223db04 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     uninit stack-temp u16 rebuilt by successive bitfield inserts; per-player row decode; f6 count+1; store-order
 *   risk:       permuter-class + struct-guessed: a 6-stage strh-to-stack RMW chain (orig re-loads [sp] between every insert) that mwcc will neither keep on the stack nor sequence identically; the field windows (0x1e,0xffffc01f,0xc000) and the colarg index are inferred. Almost certainly escapes to .s.
 *   confidence: low
 */
/* func_ov002_0223db04 (ov002, class D): build a u16 control word on a stack temp
 * through a chain of bitfield inserts sourced from a per-player row entry (cf16c
 * +0x30, stride 0x868) and a d0250 lookup, then write self->f6 (lo byte kept,
 * hi byte = derived count+1) and the u16 array slot at +8. Dense stack-temp RMW,
 * store-order heavy. Modeled via a u16 'ctrl' rebuilt field-by-field. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern int  data_ov002_022cf16c[];
extern u16  data_ov002_022d0250[];

/* the stack u16 has fields: bit0, bits1..4 (4b), bits5..? ; rebuilt incrementally */
void func_ov002_0223db04(void *self, int player, int colarg) {
    char *cf16c = (char *)data_ov002_022cf16c;
    int *row = (int *)(cf16c + (player & 1) * 0x868 + 0x30);
    u32 e = (u32)row[(colarg & 0xffff) * 5]; /* mul r1,r2,0x14 then +base => index*20 bytes => *5 ints */
    u32 ctrl = (u32)*(u16 *)0;               /* ldrh r6,[sp] : uninitialised stack temp */
    u32 lr = (u32)*(u16 *)((char *)self + 6);
    u32 p = (u32)player & 0xffff;
    u32 colw = (u32)colarg & 0xffff;
    unsigned cnt, idx, t;
    (void)ctrl; (void)lr; (void)p; (void)colw;

    /* ctrl bit0 = player&1 */
    ctrl = (u32)*(u16 *)((char *)self + 6); /* placeholder to anchor reads; see risk */

    /* field A: ctrl = (ctrl & ~1) | (p & 1) */
    {
        u32 c = 0;
        c = (c & ~1u) | ((u32)player & 1u);
        /* field B: bits1..4 from colarg : (c & ~0x1e) | ((colw<<28)>>27)<<? -> 4-bit at bit1 */
        c = (c & ~0x1eu) | (((colw << 0x1c) >> 0x1b) << 0);
        /* field C from row entry hi8*2+bit13, masked 0xffffc01f window */
        idx = (((e << 2) >> 0x18) << 1) + ((e << 0x12) >> 0x1f);
        c = (c & 0xffffc01fu) | ((idx << 0x17) >> 0x12);
        /* field D: d0250[ (c>>5 window) ] -> 2-bit field at bit14 */
        t = (u32)data_ov002_022d0250[((c << 0x12) >> 0x17)];
        c = (c & ~0xc000u) | (((t << 0x11) >> 0x1e) << 0xe);
        ctrl = c;
    }

    /* self->f6: keep lo byte, hi byte = (oldcount+1) trunc */
    cnt = ((lr << 0x10) >> 0x18); /* old count = hi byte of f6 */
    *(u16 *)((char *)self + 6) = (u16)((lr & ~0xff00u) | (((cnt + 1) & 0xffff) << 8));
    /* arr slot at +8 indexed by (colarg&0xffff) -> word built */
    *(u16 *)((char *)self + 6 + (colw * 2) + 2) = (u16)ctrl;
}
