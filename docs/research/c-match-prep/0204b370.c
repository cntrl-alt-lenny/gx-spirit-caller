/* CAMPAIGN-PREP candidate for func_0204b370 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     table-stride loop (entry->f4 guard + call) + Fill32 tail
 *   risk:       stride struct size 0xc / f4 offset; loop bound 0x9a; spurious sub sp,#4
 *   confidence: med
 */
/* func_0204b370: for i in [0,0x9a): if entry[i].f4 != 0
 *   func_0204548c(4, entry[i].f4, 0);  (entry stride 0xc, base data_0219dcb4)
 * then Fill32(0, data_0219dcb4, 0x738). The const args 4 and 0 are loop-invariant. */

typedef struct {
    char _pad0[4];
    int  f4; /* +0x04 */
    char _pad1[4];
} Entry0204b370; /* size 0xc */

extern Entry0204b370 data_0219dcb4[];
extern void func_0204548c(int a, int b, int c);
extern void Fill32(int v, void *dst, int size);

void func_0204b370(void) {
    int i;
    for (i = 0; i < 0x9a; i++) {
        if (data_0219dcb4[i].f4 != 0)
            func_0204548c(4, data_0219dcb4[i].f4, 0);
    }
    Fill32(0, data_0219dcb4, 0x738);
}
