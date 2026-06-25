/* CAMPAIGN-PREP candidate for func_0202a27c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     scan-for-empty loop + Fill32 + stride-mul alloc, dual-pool
 *   risk:       loop induction (ptr vs idx*0xec) and r0=#0 fall-through into Fill32 value-arg may shift; pool dedupe risk
 *   confidence: low
 */
/* func_0202a27c: scan a stride-0xec array (base = *data_0219a934,
 * count = *(int*)(data_0219a934+4)) for the first empty (f0==0) slot.
 * If none free (idx>=count) return 0; else Fill32(0,&slot,0xec), set
 * slot.f0 = a0, func_0202aa58(&slot), return &slot.
 * Dual-pool: count via data_0219a934, base via data_0219a934_alias. */

extern int  Fill32(int value, void *dest, int size_bytes);
extern void func_0202aa58(void *p);

typedef struct Slot0202a27c {
    void *f0;                       /* +0x0 */
    char  _rest[0xec - 4];
} Slot0202a27c;

extern void *data_0219a934;             /* +0x0 = base, +0x4 = count */
extern void *data_0219a934_alias;       /* SAME address (raw 0x0219a934 pool) */

void *func_0202a27c(int a0) {
    int count = *(int *)((char *)&data_0219a934 + 4);
    Slot0202a27c *base = *(Slot0202a27c **)&data_0219a934_alias;
    int idx = 0;

    if (count > 0) {
        Slot0202a27c *e = base;
        while (e->f0 != 0) {
            if (++idx >= count) break;
            e++;
        }
    }
    if (idx >= count) return 0;

    Fill32(0, &base[idx], 0xec);
    base[idx].f0 = (void *)a0;
    func_0202aa58(&base[idx]);
    return &base[idx];
}
