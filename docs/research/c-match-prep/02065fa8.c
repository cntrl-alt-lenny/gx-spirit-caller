/* CAMPAIGN-PREP candidate for func_02065fa8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear-search return-match + ble guard + reload global
 *   risk:       elem->field8 compared to key (cmp r1,r6) order; count reload vs bind matched; e[2] offset assumed 4B
 *   confidence: med
 */
/* func_02065fa8: linear search returning the matching element pointer.
 * Element from func_020540d0(g,i); compare elem->field8 to key; return
 * elem on match else 0. Guards: g==0 -> 0, count<=0 -> 0.
 *
 *   if(*g==0) return 0; n=func_02054140(*g); if(n<=0) return 0;
 *   for(i=0;;){ e=func_020540d0(*g,i); if(e->[8]==key) return e;
 *              if(++i>=func_02054140(*g)) break; } return 0;
 */

extern void *data_0219e968;
extern int  *func_020540d0(void *g, int i);   /* element ptr */
extern int   func_02054140(void *g);

int *func_02065fa8(int key) {
    int i = 0;
    int *e;

    if (data_0219e968 == 0) return 0;
    if (func_02054140(data_0219e968) <= 0) return 0;
    do {
        e = func_020540d0(data_0219e968, i);
        if (e[2] == key) return e;   /* +0x8 */
        i++;
    } while (i < func_02054140(data_0219e968));
    return 0;
}
