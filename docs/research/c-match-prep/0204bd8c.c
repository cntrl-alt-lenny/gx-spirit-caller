/* CAMPAIGN-PREP candidate for func_0204bd8c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     accessor flag-set(2) + double-deref call + flag-clear(0)
 *   risk:       f1a8/f4 offsets; the **(int**) double-deref of f4 may need cast tweak
 *   confidence: med
 */
/* func_0204bd8c: p=acc(); p->f1a8 = 2; p=acc();
 * func_02062530(*(int*)p->f4);  p=acc(); p->f1a8 = 0.
 * f4 holds a pointer that is dereferenced once for the call arg. */

typedef struct {
    char          _pad0[4];
    int          *f4;   /* +0x04 -> pointer, dereferenced */
    char          _pad1[0x1a0];
    unsigned char f1a8; /* +0x1a8 */
} State0204bd8c;

extern State0204bd8c *func_020498f0(void);
extern void func_02062530(int v);

void func_0204bd8c(void) {
    func_020498f0()->f1a8 = 2;
    func_02062530(*func_020498f0()->f4);
    func_020498f0()->f1a8 = 0;
}
