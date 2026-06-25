/* CAMPAIGN-PREP candidate for func_021b4324 (ov019, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     STORE-ORDER struct-fill once + MIN if-assign clamp + counted hit-test scan
 *   risk:       Rect field offsets and the +0x18 row stride assumed; the movgt clamp and movne r0,r4 conditional-return codegen may reshape
 *   confidence: med
 */
/* func_ov019_021b4324: build a fixed hit-rect on the stack (x=6, w=0xda,
 * h=0x10) and scan up to min(a0->f8, 6) rows, stepping the rect's y by 0x18
 * each row. Returns the first row index whose rect is hit (func_ov019_021b2728
 * != 0), or -1.
 */

typedef unsigned short u16;
typedef unsigned char  u8;

typedef struct {
    u16 x;
    u16 y;
    u8  w;
    u8  h;
    u16 f6;
    u16 f8;
} HitRect;

extern int func_ov019_021b2728(HitRect *r);

int func_ov019_021b4324(int *a0) {
    HitRect rc;
    int i;
    int n;
    int y;

    rc.x  = 6;
    rc.w  = 0xda;
    rc.h  = 0x10;
    rc.f6 = 0;
    rc.f8 = 0;

    y = 0xc;
    for (i = 0; ; i++) {
        n = a0[2];
        if (n > 6) {
            n = 6;
        }
        if (i >= n) {
            break;
        }
        rc.y = y;
        if (func_ov019_021b2728(&rc) != 0) {
            return i;
        }
        y += 0x18;
    }
    return -1;
}
