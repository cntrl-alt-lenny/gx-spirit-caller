/* CAMPAIGN-PREP candidate for func_02033d3c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     init store-order (f0,b4,b5 then call then b15,f18); save arg3 across call
 *   risk:       func_020a6a94 arg2 assumed = preserved entry r1; store/setup scheduling around the call may differ
 *   confidence: med
 */
/* func_02033d3c — struct init: stores + one fill call */

typedef struct {
    int           f0;     /* +0x00 */
    unsigned char b4;     /* +0x04 */
    unsigned char b5;     /* +0x05 */
    unsigned char buf[0xf];/* +0x06 .. +0x14 */
    unsigned char b15;    /* +0x15 */
    unsigned char _pad_16[0x18 - 0x16];
    int           f18;    /* +0x18 */
} Obj_02033d3c;

extern void func_020a6a94(void *dst, void *src, int n);

void func_02033d3c(Obj_02033d3c *p, void *src, int d)
{
    p->f0 = 1;
    p->b4 = 0;
    p->b5 = 0;
    func_020a6a94(p->buf, src, 0xf);
    p->b15 = 0;
    p->f18 = d;
}
