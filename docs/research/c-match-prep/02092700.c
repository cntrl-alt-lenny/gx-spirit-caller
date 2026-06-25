/* CAMPAIGN-PREP candidate for func_02092700 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted drain loop; zero two fields per element
 *   risk:       offsets 0x88/0x8/0xc guessed; lf=obj+0x88 and zero-temp must stay callee-saved across loop
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02092700 (main, class A) - p_0035.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     counted drain loop over list field (while head != 0) + zero two fields
 *   risk:       field offsets 0x88/0x8/0xc guessed; r5=base+0x88 / r4=0 callee-saved bind must hold across loop
 *   confidence: med
 */
/* func_02092700: while obj->+0x88 != 0, pop one element via func_02092124(&obj->88),
 * zero its +0xc then +0x8, run func_02091a0c(), re-test. Early-out if list
 * empty on entry (ldmeqia/bxeq). func_02092124 takes the address of the +0x88
 * field (r5 = obj+0x88) and returns the element pointer. */
extern void *func_02092124(void *list_field);
extern void func_02091a0c(void);

void func_02092700(char *obj)
{
    if (*(int *)(obj + 0x88) != 0) {
        void *lf = obj + 0x88;
        do {
            char *e = (char *)func_02092124(lf);
            *(int *)(e + 0xc) = 0;
            *(int *)(e + 0x8) = 0;
            func_02091a0c();
        } while (*(int *)(obj + 0x88) != 0);
    }
}
