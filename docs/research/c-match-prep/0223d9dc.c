/* CAMPAIGN-PREP candidate for func_0223d9dc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     state dispatch cmp chain; eor of two bitfields; 0x84-arm packed decode reads two records; store-order block
 *   risk:       permuter-class: 0x84 arm holds the second 021afb74 result in r4 across a third call + interleaves the (e<<2)>>24/(e2<<18)>>31 decode; mwcc may reorder the zeroing stores (6a4/6b0/6ac/6b4) or recolor — store-order/liveness wall.
 *   confidence: low
 */
/* func_ov002_0223d9dc (ov002, class D): state dispatch on ce288[0x5a8] over
 * {0x7e,0x7f,0x80,default}; pre-computes eor of two self->f2 bitfields (bit0 ^
 * bit14) into r3 for the 0x68 arm; the 0x84 arm reads three 021afb74 records and
 * writes a packed row index + zeros into ce288. Multi-field store liveness. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern int   data_ov002_022ce288[];
extern void  func_ov002_021ae400(int a, int b);
extern void  func_ov002_021af9d0(int a, int b, int c, int d);
extern int   func_ov002_021afb74(void);
extern int   func_ov002_0223bdb8(void);
extern int   func_ov002_0223be40(void);

int func_ov002_0223d9dc(void *self) {
    u32 f2 = (u32)*(u16 *)((char *)self + 2);
    int st = *(int *)((char *)data_ov002_022ce288 + 0x5a8);
    int xr = (int)(((f2 << 0x11) >> 0x1f) ^ ((f2 << 0x1f) >> 0x1f));
    if (st == 0x7e) {
        char *g = (char *)data_ov002_022ce288;
        int *r0, *r4, *r1;
        r0 = (int *)func_ov002_021afb74();
        *(int *)(g + 0x69c) = (int)((u32)((u32)*r0 << 0x13) >> 0x13);
        r4 = (int *)func_ov002_021afb74();
        r0 = (int *)func_ov002_021afb74();
        {
            u32 e = (u32)*r0;
            u32 e2 = (u32)*r4;
            *(int *)(g + 0x6a0) = (int)(((u32)((e << 2) >> 0x18) << 1) + ((e2 << 0x12) >> 0x1f));
        }
        *(int *)(g + 0x6a4) = 0;
        *(int *)(g + 0x6b0) = 0;
        *(int *)(g + 0x6ac) = 0;
        *(int *)(g + 0x6b4) = 0;
        return 0x63;
    }
    if (st == 0x7f) {
        func_ov002_021af9d0(xr, 6, 0, 0);
        return 0x7e;
    }
    if (st == 0x80) {
        if (func_ov002_0223bdb8() == 0) return 0;
        func_ov002_021ae400((int)(((u32)*(u16 *)((char *)self + 2) << 0x1f) >> 0x1f), 0x5b);
        return 0x7f;
    }
    func_ov002_0223be40();
    return 0;
}
