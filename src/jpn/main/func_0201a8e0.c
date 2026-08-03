/* func_0201a8e0: classify x into one of 6 named constants (default 0),
 * then pack the result into the low halfword of ctx->field_18
 * (ctx = func_02018b60(x)), call func_02018a50(r4, 1), return r4.
 *
 * The classification is a binary-search comparison tree over 6
 * threshold values; goto-restructured so each leaf's block appears
 * in the ORIGINAL's exact body-address order (fallthrough = the
 * "smaller-side" case at every split; the "larger-side" case is a
 * branched-to block placed later in source, matching the target's
 * bgt/bge-to-dedicated-block pattern instead of a predicated load).
 */

extern void *func_02018b60(int x);
extern void  func_02018a50(int val, int one);

int func_0201a8e0(int x) {
    int r4;
    void *ctx;

    r4 = 0;
    if (x > 0x20000) {
        goto gt_20000;
    }
    if (x >= 0x20000) {
        goto eq_20000;
    }
    if (x > 0x8000) {
        goto gt_8000;
    }
    if (x == 0x8000) {
        r4 = 0x161d;
    }
    goto tail;

gt_8000:
    if (x == 0x10000) {
        r4 = 0x154c;
    }
    goto tail;

gt_20000:
    if (x > 0x80000) {
        goto gt_80000;
    }
    if (x >= 0x80000) {
        goto eq_80000;
    }
    if (x == 0x40000) {
        r4 = 0x119b;
    }
    goto tail;

gt_80000:
    if (x == 0x100000) {
        r4 = 0x18f6;
    }
    goto tail;

eq_20000:
    r4 = 0x132f;
    goto tail;

eq_80000:
    r4 = 0x1798;
tail:

    ctx = func_02018b60(x);
    *(unsigned int *)((char *)ctx + 0x18) =
        (*(unsigned int *)((char *)ctx + 0x18) & 0xffff0000) | (r4 & 0xffff);
    func_02018a50(r4, 1);
    return r4;
}
