/* CAMPAIGN-PREP candidate for func_022047f0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop; mla per-player base; table+call add; unsigned cmp
 *   risk:       loop may get induction-var SR; (i&1)*0x868 + ldr#0xc must fold to mla+ldr disp not split
 *   confidence: med
 */
/* func_ov002_022047f0: 2-iter loop, per-player table field + call, sum>=6.
 *   for i in {0,1}: acc = *(int*)(cf16c + (i&1)*0x868 + 0xc) + f(i);
 *                  if ((unsigned)acc >= 6) return 1;
 *   return 0;     (add r0,r1,r0 => table value first; movcs => unsigned >=)
 */
extern char data_ov002_022cf16c[];
extern int func_ov002_021bbeac(int i);

int func_ov002_022047f0(void) {
    int i;
    for (i = 0; i < 2; i++) {
        int v = func_ov002_021bbeac(i);
        if ((unsigned)(*(int *)(data_ov002_022cf16c + (i & 1) * 0x868 + 0xc) + v) >= 6)
            return 1;
    }
    return 0;
}
