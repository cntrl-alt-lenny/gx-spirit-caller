/* CAMPAIGN-PREP candidate for func_0229ce5c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dual id-resolve guard, %s-splice copy loop, helper tail
 *   risk:       reg-alloc wall (sibling 0229cfa0 ships as .s); ldrsb sign + live-range will likely diff
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229ce5c (ov002, class A).
 *   recipe:  dual id-resolve guard (src & 0xFFFE0000 ==0 -> resolve), then
 *            copy loop that on '%s' splices in 'arg' via two helper calls
 *   risk:    REG-ALLOC WALL: sibling func_ov002_0229cfa0 shipped as .s for this
 *            exact loop shape; ldrsb signedness + r5/r4/r6 live-range likely flips
 *   confidence: low
 */

extern char *func_0202b7cc(int id);
extern void  func_ov002_0229cdb8(char *dst, const char *src);

void func_ov002_0229ce5c(char *dst, const char *fmt, const char *arg)
{
    signed char c;
    *dst = 0;
    if (((int)fmt & 0xFFFE0000) == 0)
        fmt = func_0202b7cc((int)fmt);
    if (((int)arg & 0xFFFE0000) == 0)
        arg = func_0202b7cc((int)arg);
    if (fmt == 0)
        return;
    c = *(const signed char *)fmt;
    if (c == 0) { *dst = 0; return; }
    do {
        if (c == '%' && ((const signed char *)fmt)[1] == 's') {
            *dst = 0;
            func_ov002_0229cdb8(dst, arg);
            func_ov002_0229cdb8(dst, fmt + 2);
            return;
        }
        c = *(const signed char *)fmt;
        *dst = c;
        dst++;
        c = *(const signed char *)(++fmt);
    } while (c != 0);
    *dst = 0;
}
