/* CAMPAIGN-PREP candidate for func_022862cc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guarded calls; local out-buf struct; stack-arg forward; x<=y
 *   risk:       none material — VERIFIED byte-exact. buf tail[0x10] tunes frame to 0x30; x/y at buf+0x14/+0x18 confirmed; arg5/arg6 are stack params.
 *   confidence: high
 */
extern int data_ov002_022cd524;
extern int func_ov002_0227b9b8(int a, int b, int c, int d);
extern int func_ov002_02286110(int a, int b, int c, int d, void *out);
extern int func_ov002_0227b174(int a, int x, int y);

struct Buf62cc { char pad[0x14]; int x; int y; char tail[0x10]; };

int func_ov002_022862cc(int a, int b, int c, int d, int arg5, int arg6) {
    struct Buf62cc buf;
    int r;
    data_ov002_022cd524 = a;
    r = func_ov002_0227b9b8(a, b, c, arg6);
    if (r != -1) return r;
    func_ov002_02286110(a, b, d, arg5, &buf);
    r = func_ov002_0227b174(a, buf.x, buf.y);
    if (r != -1) return r;
    return buf.x <= buf.y;
}
