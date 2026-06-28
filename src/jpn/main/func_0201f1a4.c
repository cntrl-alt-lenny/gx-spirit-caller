/* CAMPAIGN-PREP candidate for func_0201f1a4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD chain; predicated early-returns; tail f138(9) returns its value
 *   risk:       the implicit 'return f138(9)' tails must omit mov #0; f_24/f_2 offsets guessed; branch ordering
 *   confidence: med
 */
/* func_0201f1a4: guard chain. If arg->f_2 (u16) != 0: f19c(); return
 * f138(9). Else branch on data_02191e60.f_24: if set, r=f25c(); if r!=0
 * return r else return f138(9). If f_24 clear, r=f2f4(); if r!=0 return r
 * else return f138(9). All fall-through tails end with f138(9) (no mov #0,
 * so they RETURN f138's value, not 0). f19c() called with no args. */

typedef struct {
    char _pad2[2];
    unsigned short f_2;    /* +0x02 */
} hdr_f1f8;

typedef struct {
    char _pad24[0x24];
    int f_24;              /* +0x24 */
} state_f1f8;

extern state_f1f8 data_02191e60;
extern int func_0201f0e4(int n);
extern void func_0201f148(void);
extern int func_0201f208(void);
extern int func_0201f2a0(void);

int func_0201f1a4(hdr_f1f8 *p) {
    int r;
    if (p->f_2 != 0) {
        func_0201f148();
        return func_0201f0e4(9);
    }
    if (data_02191e60.f_24 != 0) {
        r = func_0201f208();
        if (r != 0) {
            return r;
        }
        return func_0201f0e4(9);
    }
    r = func_0201f2a0();
    if (r != 0) {
        return r;
    }
    return func_0201f0e4(9);
}
