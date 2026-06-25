/* CAMPAIGN-PREP candidate for func_02037968 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     halfword RMW bit-set; stack-arg call; fn-ptr arg; return &global
 *   risk:       obj/handle types guessed; eval order placing b in callee reg for both stack-arg and a+b should hold but reg-alloc could flip
 *   confidence: med
 */
/* func_02037968: set a status bit, dispatch a timed/queued worker with
 * a function-pointer callback, then poke a second routine; return the
 * manager pointer.
 *
 *   ldrh r1,[r3,#0x12]; orr r1,r1,#2; strh r1,[r3,#0x12]  -> mgr->f12 |= 2
 *   func_02091d24(&data_0219b490, func_0203991c, 0, a+b, b, c)
 *   func_020919d8(&data_0219b490)
 *   return &data_0219b490
 */

typedef struct {
    char           _pad_00[0x12];
    unsigned short f12;   /* +0x12 */
} Mgr;

typedef void (*Cb)(void);

extern Mgr data_0219b2e0;
extern int data_0219b490;   /* opaque handle object; address is passed */
extern void func_0203991c(void);
extern void func_02091d24(int *obj, Cb cb, int z, int sum, int b, int c);
extern void func_020919d8(int *obj);

int *func_02037968(int a, int b, int c) {
    data_0219b2e0.f12 |= 2;
    func_02091d24(&data_0219b490, func_0203991c, 0, a + b, b, c);
    func_020919d8(&data_0219b490);
    return &data_0219b490;
}
