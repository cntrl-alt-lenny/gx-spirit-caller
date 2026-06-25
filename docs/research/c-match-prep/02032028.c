/* CAMPAIGN-PREP candidate for func_02032028 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     retry-call wrapper (guarded second attempt + cleanup)
 *   risk:       movs r4 flag reuse and the goto-merge may restructure; arg passing of saved r5/r6 to retry assumed
 *   confidence: med
 */
/* func_02032028: call func_02031ffc; on NULL, run a recovery routine
 * and retry once. If a handle is obtained (either attempt), pass it
 * to func_020945f4 with (handle, 0, arg1). args arg0/arg1 cached in
 * r6/r5 across the calls.
 *
 *     mov r6,r0; mov r5,r1; bl func_02031ffc; movs r4,r0; bne .L_34
 *     mov r0,r6; bl func_020322e8
 *     mov r0,r6; mov r1,r5; bl func_02031ffc; movs r4,r0; beq .L_44
 *  .L_34: mov r0,r4; mov r2,r5; mov r1,#0; bl func_020945f4
 *  .L_44: mov r0,r4; ret
 */

extern void *func_02031ffc(void *a, int b);
extern void  func_020322e8(void *a);
extern void  func_020945f4(void *h, int b, int c);

void *func_02032028(void *arg0, int arg1) {
    void *h = func_02031ffc(arg0, arg1);

    if (h == 0) {
        func_020322e8(arg0);
        h = func_02031ffc(arg0, arg1);
        if (h == 0) return h;
    }

    func_020945f4(h, 0, arg1);
    return h;
}
