/* CAMPAIGN-PREP candidate for func_02019f94 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D divmod: /10 magic (asr#2), signed-byte table[a0*7+6], first-set-bit scan loop
 *   risk:       permuter-class: loop body order, the mask<<1 vs (1<<i) shift form, and acc-temp reg-alloc are scheduling-sensitive; the /10 magic and a0*7 table index are reshape-able/high-confidence on their own.
 *   confidence: low
 */
/* func_02019f94 (main, class D) — 2-bit scan loop + /10 magic-divide + signed-byte table.
 * a0=r0(->r5). w=GetSystemWork()(side effect). buf[2] on stack filled by func_02019ce0(a0,&buf).
 * mask = func_02019ea4(a0). acc=0. for(i=0;i<2;i++){ if(mask & (1<<i)){
 *      acc = (buf[i] < 0x11) ? func_0201a170(0xf) : func_0201a170(0xe); break; } }
 * base = func_02019604(a0);
 * return acc + base/10 + data_020b5b80[a0*7 + 6];
 * /10 is 0x66666667 magic with asr#2 (proven /10). a0*7 via rsb(a0,a0,lsl#3). table is signed char.
 * The loop breaks on first set bit (b .L_514); the bcc#0x11 picks 0xf(<) vs 0xe(>=). */
extern char *GetSystemWork(void);
extern void func_02019ce0(int a, void *buf);
extern int func_02019ea4(int a);
extern int func_0201a170(int a);
extern int func_02019604(int a);
extern signed char data_020b5b80[];

int func_02019f94(int a0) {
    unsigned char buf[2];
    int mask, base, acc = 0, i;
    GetSystemWork();
    func_02019ce0(a0, buf);
    mask = func_02019ea4(a0);
    for (i = 0; i < 2; i++) {
        if (mask & (1 << i)) {
            if (buf[i] < 0x11)
                acc = func_0201a170(0xf);
            else
                acc = func_0201a170(0xe);
            break;
        }
    }
    base = func_02019604(a0);
    return acc + base / 10 + data_020b5b80[a0 * 7 + 6];
}
