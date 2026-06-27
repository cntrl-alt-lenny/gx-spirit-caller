/* CAMPAIGN-PREP candidate for func_020418ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: bind base[0x14] to r4 once across both blx; guard fields re-add base each use
 *   risk:       reshape-able: orig RELOADS self+0x1000 before each +0x9c8/+0x9cc access (mov+ldr) rather than caching m. If mwcc caches the base in one reg, the per-use add r0,r5,#0x1000 vanishes. Match by re-deriving address each access (done via self+const).
 *   confidence: med
 */
/* func_020418ac - main - class C
 * teardown: two guarded blx frees + final clear; r4=base[0x14] free-fn ptr
 * base = self+0x1000 ; guard fields at +0x9c8 / +0x9cc
 */
extern unsigned char data_020fe978[];
extern unsigned char data_020fe990[];
extern void func_02040cc0(void *p, int n);
extern void func_02041470(int self, void *p);
extern void func_020945f4(int self, int v, int n);

typedef struct {
    unsigned char pad[0x14];
    void (*freefn)(void *tag, int a, int b);  /* +0x14 */
} Mod;

void func_020418ac(int self)
{
    Mod *m;

    if (self == 0)
        return;
    m = (Mod *)(self + 0x1000);
    func_02040cc0((void *)(self + 0x1a34), 0x20);
    func_02041470(self, (void *)(self + 0x1a04));
    func_02041470(self, (void *)(self + 0x19f4));
    if (*(int *)(self + 0x19c8) != 0) {
        m->freefn(data_020fe978, 0, 0);
        *(int *)(self + 0x19c8) = 0;
    }
    if (*(int *)(self + 0x19cc) != 0) {
        m->freefn(data_020fe990, 0, 0);
        *(int *)(self + 0x19cc) = 0;
    }
    func_020945f4(self, 0, 0x1c10);
}
