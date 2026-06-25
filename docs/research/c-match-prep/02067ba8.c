/* CAMPAIGN-PREP candidate for func_02067ba8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-returns + sequenced calls + indirect blx tail
 *   risk:       the dead ldr r3,[+0x48] before blx not reproduced; fnptr arity (3 vs 4 args) and first call's r0 source unclear; blx scheduling is the known wall
 *   confidence: low
 */
/* func_02067ba8 — dispatch: guards + calls + indirect blx tail.
 * r4=p. Guard on +0x10 (==0 early return). func_02067ce8(p?,0) — the
 * blx is invoked with r1=0 but p NOT reloaded into r0 first, so call1
 * receives whatever is live (p in r4 not yet moved) — model as taking
 * (p,0). Then func_02067c58(p). If p->field_1c > 0 call func_02067c08(p).
 * If +0x10 still nonzero return; else indirect-call p->fn(+0x44) with
 * (p,2,0); fn ptr at +0x44, an arg/slot at +0x48 loaded but unused as
 * arg here (ldr r3,[+0x48] feeds nothing) — keep the blx via a fnptr
 * field. Reproduce the +0x48 load by reading it into a throwaway? No —
 * it loads r3 then overwrites with mov r2,#0; r3 dead. Likely the
 * fnptr signature has 3 fixed args and r3 load is the compiler
 * pre-loading a 4th arg slot pattern; simplest match: 3-arg call.
 */
typedef struct Disp Disp;
typedef void (*DispFn)(Disp *p, int a, int b);
struct Disp {
    char  _pad_00[0x10];
    int   field_10;   /* +0x10 guard */
    char  _pad_14[0x1c - 0x14];
    int   field_1c;   /* +0x1c signed count */
    char  _pad_20[0x44 - 0x20];
    DispFn fn;        /* +0x44 */
    int   field_48;   /* +0x48 */
};

extern void func_02067ce8(Disp *p, int x);
extern void func_02067c58(Disp *p);
extern void func_02067c08(Disp *p);

void func_02067ba8(Disp *p) {
    if (p->field_10 == 0) return;

    func_02067ce8(p, 0);
    func_02067c58(p);
    if (p->field_1c > 0) {
        func_02067c08(p);
    }
    if (p->field_10 != 0) return;

    p->fn(p, 2, 0);
}
