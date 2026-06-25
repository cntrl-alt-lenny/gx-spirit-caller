/* CAMPAIGN-PREP candidate for func_0229cf10 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     id-resolve guard, %d-splice copy loop, helper tail
 *   risk:       reg-alloc wall (sibling 0229cfa0 ships as .s); ldrsb sign + live-range will likely diff
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229cf10 (ov002, class A).
 *   recipe:  single id-resolve guard (src & 0xFFFE0000 ==0 -> resolve), then
 *            copy loop that on '%d' splices arg via 0229cde8 then tail 0229cdb8
 *   risk:    REG-ALLOC WALL like sibling .s'd 0229cfa0/ce5c; the '%d' fmt+2
 *            continuation and ldrsb sign likely flip register assignment
 *   confidence: low
 */

extern char *func_0202b7cc(int id);
extern void  func_ov002_0229cdb8(char *dst, const char *src);
extern void  func_ov002_0229cde8(char *dst, const char *src);

void func_ov002_0229cf10(char *dst, const char *fmt, const char *arg)
{
    signed char c;
    *dst = 0;
    if (((int)fmt & 0xFFFE0000) == 0)
        fmt = func_0202b7cc((int)fmt);
    c = *(const signed char *)fmt;
    if (c == 0) { *dst = 0; return; }
    do {
        if (c == '%' && ((const signed char *)fmt)[1] == 'd') {
            *dst = 0;
            func_ov002_0229cde8(dst, arg);
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
