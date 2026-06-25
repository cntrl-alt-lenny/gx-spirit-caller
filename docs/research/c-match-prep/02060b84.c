/* CAMPAIGN-PREP candidate for func_02060b84 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global-guard + counted linear search over indexed array, -1 sentinel
 *   risk:       global reloaded (r8) each loop iter matches asm; element field offsets 0/4/8 fixed; count-recompute placement may shift
 *   confidence: med
 */
/* func_02060b84: linear search of an indexed collection for the entry whose
 * three key fields (_0,_4,_8) equal (arg0,arg1,arg2). Returns the index or -1.
 * The collection base is a global (data_0219e518); if its pointer slot is
 * null, return -1 immediately. Count comes from func_02054140, elements from
 * func_020540d0(base, i). The base is reloaded each use, matching the asm.
 *
 *   r3=&data_0219e518; r0=[r3]; if (r0==0) return -1;
 *   n=func_02054140(base); if (n<=0) return -1;
 *   for (i=0; i<n; i++){ e=func_020540d0(base,i);
 *       if (e[0]==a0 && e[1]==a1 && e[2]==a2) return i; }
 *   return -1;
 */
extern int *data_0219e518;
extern int  func_02054140(int *base);
extern int *func_020540d0(int *base, int i);

int func_02060b84(int a0, int a1, int a2) {
    int i;
    int n;

    if (data_0219e518 == 0) return -1;

    n = func_02054140(data_0219e518);
    if (n <= 0) return -1;

    for (i = 0; i < n; i++) {
        int *e = func_020540d0(data_0219e518, i);
        if (e[0] == a0 && e[1] == a1 && e[2] == a2) {
            return i;
        }
    }
    return -1;
}
