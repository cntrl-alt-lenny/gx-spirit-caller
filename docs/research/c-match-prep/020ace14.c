/* CAMPAIGN-PREP candidate for func_020ace14 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield lsl;lsr extract at +4; bind w in one reg; bic/orr insert; if-else not ternary
 *   risk:       reshape-able: the lsl#k;lsr#k pair only stays if extraction reads w via shifts (as written) rather than a :3/:2 bitfield (a bitfield could emit ubfx-style and). Watch that w (r3) is bound once across both extracts and both stores; if mwcc reloads [p+4], 3 ldr diverge.
 *   confidence: med
 */
struct Obj_020ace14 {
    int field0;
    unsigned int pad0 : 7;
    unsigned int f7 : 3;     /* bits [9:7], lsl#0x16;lsr#0x1d */
    unsigned int f10 : 2;    /* bits[11:10], lsl#0x14;lsr#0x1e */
    unsigned int pad12 : 20;
};

int func_020ace14(struct Obj_020ace14 *p, int v)
{
    unsigned int a;
    unsigned int b;
    int w;

    if (p == 0)
        return 0;
    w = *(int *)((char *)p + 4);
    a = ((unsigned int)w << 0x16) >> 0x1d;
    if (a == 0)
        return 0;

    b = ((unsigned int)w << 0x14) >> 0x1e;
    if (b == 0) {
        if (v > 0) {
            *(int *)((char *)p + 4) = (w & ~0xc00) | 0x800;
        } else if (v < 0) {
            *(int *)((char *)p + 4) = (w & ~0xc00) | 0x400;
        }
        return v;
    }
    if (b == 1)
        return -1;
    if (b == 2)
        v = 1;
    return v;
}
