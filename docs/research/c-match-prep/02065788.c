/* CAMPAIGN-PREP candidate for func_02065788 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc-guard + if-!=-1 call + store-order init
 *   risk:       func_02054e70 may actually take slot as arg (asm passes none); field offsets via int-index assumed 4-byte
 *   confidence: med
 */
/* func_02065788: allocate/find a slot via func_02065fa8; if null return.
 * If slot->field0 != -1, call func_02054e70() (release prior). Then
 * reset slot->field0 = -1 and slot->field10 = 4.
 *
 *   bl func_02065fa8; movs r4,r0; if(r4==0) return;
 *   if(r4->[0] != -1) func_02054e70();
 *   r4->[0] = -1; r4->[0x10] = 4;
 */

extern void *func_02065fa8(void);
extern void func_02054e70(void);

void func_02065788(void) {
    int *slot = (int *)func_02065fa8();

    if (slot == 0) return;
    if (slot[0] != -1) {
        func_02054e70();
    }
    slot[0] = -1;
    slot[4] = 4;        /* +0x10 */
}
