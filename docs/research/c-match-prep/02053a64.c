/* CAMPAIGN-PREP candidate for func_02053a64 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stacked-arg call + result-store-to-global; reload global
 *   risk:       data_0219e474 offsets 0x0/0x4c/0x50 guessed; the two global reloads (LIT1 used twice) must each reload, not bind
 *   confidence: med
 */
/* func_02053a64: push two stack args, call a setup fn, then call a maker
 * whose result is stored into a global struct.
 *   g.f_50 = (func_02054ca8(g.f_0, &data_0219e480, g.f_4c, 0,
 *                            &data_0219e478, 8), func_02055330());
 * Stack args: sp[0]=&data_0219e478, sp[4]=8.  g = data_0219e474. */

extern unsigned char data_0219e478;
extern unsigned char data_0219e480;

typedef struct {
    int f_0;            /* 0x00 */
    char _pad[0x48];
    int f_4c;           /* 0x4c */
    int f_50;           /* 0x50 */
} g_t;

extern g_t data_0219e474;

extern void func_02054ca8(int a, void *b, int c, int d, void *e, int f);
extern int  func_02055330(void);

void func_02053a64(void) {
    func_02054ca8(data_0219e474.f_0, &data_0219e480, data_0219e474.f_4c,
                  0, &data_0219e478, 8);
    data_0219e474.f_50 = func_02055330();
}
