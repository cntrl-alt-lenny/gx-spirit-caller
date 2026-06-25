/* CAMPAIGN-PREP candidate for func_02046694 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted byte-scan loop + tail-call(index); sp3 tier
 *   risk:       loop induction (p++ vs base[i]) may schedule ldrb/add differently; ble-vs-blt guard ordering could flip.
 *   confidence: med
 */
/* func_02046694: get a (base,count) via func_0204f998(&base), scan
 * the byte array base[0..count) for arg; if found tail-call
 * func_0204fa7c(index), else return 0. sp3 routing.
 *
 *     mov r4, r0                 ; r4 = arg (byte key)
 *     add r0, sp, #0 ; bl func_0204f998   ; n = f998(&base)
 *     mov r1, r0 ; mov r0, #0    ; i = 0
 *     ble .L_2ac                 ; if n<=0 skip
 *     ldr r3, [sp]               ; p = base
 *  .L_290: ldrb r2,[r3]; cmp r4,r2; beq .L_2ac
 *          add r0,#1; cmp r0,r1; add r3,#1; blt .L_290
 *  .L_2ac: cmp i,n; if eq return 0
 *          bl func_0204fa7c ; return   (r0 = i)
 *
 * The matched-break path keeps i in r0 and tail-calls fa7c(i); the
 * exhausted path (i==n) returns 0. func_0204f998 fills the out-base
 * and returns the element count. */

extern int  func_0204f998(unsigned char **base_out);
extern int  func_0204fa7c(int index);

int func_02046694(int key) {
    unsigned char *base;
    int n = func_0204f998(&base);
    int i;
    for (i = 0; i < n; i++) {
        if ((int)base[i] == key) break;
    }
    if (i == n) return 0;
    return func_0204fa7c(i);
}
