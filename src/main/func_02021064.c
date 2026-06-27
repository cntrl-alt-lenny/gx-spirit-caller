/* CAMPAIGN-PREP candidate for func_02021064 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Fill32 + counted copy loop (str [base,#0x18] as +6 index) + tail call
 *   risk:       loop index-as-pointer-arith may schedule add r0,r4,i*4 vs base+#0x18; should match the prior worked candidate (tmp/p0007/c2.c).
 *   confidence: high
 */
/* func_02021064: Fill32 the work area, copy 7 words from a source table into
 * field +0x18 of consecutive 4-byte slots, then tail-use slot[0].
 *   Fill32(0, data_02194340, 0x30f4);
 *   for (i=0; i<7; i++) ((int*)data_02194340)[i+6] = data_020c6878[i];
 *   func_02021b38(((int*)data_02194340)[6]);
 *   return 1;
 * (str r1,[r0,#0x18] with r0=base+i*4  ==  base[i+6])
 */

extern void Fill32(int value, void *dst, unsigned int size);
extern int  data_02194340[];
extern int  data_020c6878[];
extern void func_02021b38(int);

int func_02021064(void) {
    int *p = data_02194340;
    int i;
    Fill32(0, p, 0x30f4);
    for (i = 0; i < 7; i++) {
        p[i + 6] = data_020c6878[i];
    }
    func_02021b38(p[6]);
    return 1;
}
