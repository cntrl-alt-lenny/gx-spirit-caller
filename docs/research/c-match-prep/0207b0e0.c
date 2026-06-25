/* CAMPAIGN-PREP candidate for func_0207b0e0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guarded callback dispatch: fp at +0x227c, marshal stack struct, blx
 *   risk:       struct field offsets (0x227c fp, the 0x14 arg block layout) guessed; halfword-then-word store ordering and the &local arg may schedule/pad differently
 *   confidence: low
 */
/* func_0207b0e0: fetch the registered handler function-pointer from the
 * global singleton (*data_021a088c) at byte offset 0x227c. If it is null,
 * return. Otherwise marshal the incoming args into a small on-stack record
 * and invoke handler(&record).
 *
 *   ip = *data_021a088c + 0x2000;
 *   fp = ip->_27c;  if (!fp) return;
 *   rec.h0 = (u16)a;  rec.h1 = (u16)b;       // strh sp+0 / sp+2
 *   rec.w4 = c;  rec.w8 = d;  rec.wc = e;     // str  sp+4 / +8 / +c
 *   fp(&rec);
 *
 * a/b are stored as halfwords (strh), c/d/e and the 5th (stack) arg as
 * words. Field offsets in `Singleton` are anchored so the handler slot is
 * at 0x227c and match the +0x2000 split mwcc emits.
 */

typedef struct {
    unsigned short h0;   /* +0x00 : a (strh)            */
    unsigned short h2;   /* +0x02 : b (strh)            */
    int w4;              /* +0x04 : c                  */
    int w8;              /* +0x08 : d                  */
    int wc;              /* +0x0c : e (5th stack arg)  */
    int w10;             /* +0x10 : pad to 0x14        */
} HandlerArgs;

typedef void (*HandlerFn)(HandlerArgs *);

typedef struct {
    char _pad[0x227c];
    HandlerFn handler;   /* +0x227c */
} Singleton;

extern Singleton *data_021a088c;

void func_0207b0e0(int a, int b, int c, int d, int e) {
    HandlerFn fp = data_021a088c->handler;
    HandlerArgs rec;
    if (fp == 0) {
        return;
    }
    rec.h0 = (unsigned short)a;
    rec.h2 = (unsigned short)b;
    rec.w4 = c;
    rec.w8 = d;
    rec.wc = e;
    fp(&rec);
}
