/* CAMPAIGN-PREP candidate for func_02054ca8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unrolled byte copy + buf[0] override + forward + tail call
 *   risk:       unroller may not emit 4x2; DSE could drop buf[0] copy; frame/buf placement (sp+4) may differ
 *   confidence: low
 */
/* func_02054ca8: copy 8 bytes from src (5th arg) into an 8-byte stack
 * buffer (mwcc unrolls 4x2), then overwrite buf[0] with the low byte of
 * the 6th arg, pass (a0..a3, buf) to func_0206eccc, then tail
 * func_02054ea8(result, -1). a0..a3 are forwarded unchanged. Frame
 * 0x10; buf at sp+4, outgoing ptr at sp+0. */

extern int func_0206eccc(int a0, int a1, int a2, int a3, void *buf);
extern int func_02054ea8(int a0, int a1);

int func_02054ca8(int a0, int a1, int a2, int a3,
                  unsigned char *src, int extra) {
    unsigned char buf[8];
    int i;

    for (i = 0; i < 8; i++)
        buf[i] = src[i];
    buf[0] = (unsigned char)extra;

    return func_02054ea8(func_0206eccc(a0, a1, a2, a3, buf), -1);
}
