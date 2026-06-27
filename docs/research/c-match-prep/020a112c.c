/* CAMPAIGN-PREP candidate for func_020a112c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16 counter (lsl#16;lsr#16); reload base per iter in loop A; sentinel 0xffff held in r5
 *   risk:       reshape-able: orig predicates the store (addne base+0x1d00; strneh) rather than branching, and pins 0xffff in r5 across loop B. mwcc may emit a branch+store or rematerialize 0xffff; loop-body reg-alloc likely needs a permuter pass.
 *   confidence: med
 */
/* func_020a112c (main, class C): two loops. Loop A (i=0..15) clears head
 * field @+0x1d4a of each enabled record (gate byte @+0x1d52); base reloaded
 * from *data_021a98fc each iter (ldr inside loop), stride 0x5d4. Loop B
 * (i=1..15) iterates records via func_0209e524, skips sentinel 0xffff and
 * zero, else calls func_020a11e4(i). Counter is u16 (lsl#16;lsr#16).
 * arg: r0=handle passed to func_0209e524.
 */

extern char *data_021a98fc;     /* *base of stride-0x5d4 records */
extern int   data_021a9840;     /* cleared to 0 between the two loops */
extern short *func_0209e524(int handle, int i);  /* returns rec ptr or 0 */
extern void  func_020a11e4(int i);

void func_020a112c(int handle) {
    unsigned short i;
    short *rec;

    for (i = 0; i < 0x10; i++) {
        char *base = *(char **)data_021a98fc + i * 0x5d4;
        if (*(unsigned char *)(base + 0x1d52) != 0) {
            *(unsigned short *)(base + 0x1d4a) = 0;
        }
    }

    data_021a9840 = 0;

    for (i = 1; i <= 0xf; i++) {
        rec = func_0209e524(handle, i);
        if (rec == 0) continue;
        if (*(unsigned short *)rec == 0xffff) continue;
        if (*(unsigned short *)rec == 0) continue;
        func_020a11e4(i);
    }
}
