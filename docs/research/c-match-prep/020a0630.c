/* CAMPAIGN-PREP candidate for func_020a0630 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain + de5c marshal; dd30-family stub; varargs
 *   risk:       Stack short-buffer layout (strh order, [sp,#0x20] 5th-arg, dcb8 vararg frame) reg/stack-alloc may differ; whole-fn .legacy/.s likely.
 *   confidence: low
 */
/* func_020a0630: dd30-family marshaller. dca8() probe; db88(1,2) guard;
 * de5c(0x1e, p0); pack {0x1e,p1,p2,p3,p5} as u16[] and dcb8(buf,0xa,...). */

extern void *func_0209dca8(void);
extern int   func_0209db88(int a, int b);
extern void  func_0209de5c(int code, int handle);
extern int   func_0209dcb8(void *buf, int code, ...);

int func_020a0630(int p0, int p1, int p2, int p3, int p5) {
    short buf[5];
    func_0209dca8();
    {
        int r = func_0209db88(1, 2);
        if (r != 0) return r;
    }
    func_0209de5c(0x1e, p0);
    buf[0] = (short)0x1e;
    buf[1] = (short)p1;
    buf[2] = (short)p2;
    buf[3] = (short)p3;
    buf[4] = (short)p5;
    return func_0209dcb8(buf, 0xa, (int)buf[4]) == 0 ? 2 : func_0209dcb8(buf, 0xa, (int)buf[4]);
}
