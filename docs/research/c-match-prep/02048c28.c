/* CAMPAIGN-PREP candidate for func_02048c28 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     indirect call via struct fn-ptr + constant store; sp3 tier
 *   risk:       arg load order b_1d/f_30 then f_2c last must hold; *p cached (r3) across the three reads then reloaded for the store — over/under-binding could flip.
 *   confidence: med
 */
/* func_02048c28: leaf. Through *data_0219dc80 (p), call the function
 * pointer p->f_2c with (0, (u8)p->b_1d, p->f_30); then store 2 into
 * p->f_0. sp3 routing.
 *
 *     ldr r1,=data_0219dc80 ; mov r0,#0 ; ldr r3,[r1]   ; r3 = *p
 *     ldrb r1,[r3,#0x1d] ; ldr r2,[r3,#0x30] ; ldr r3,[r3,#0x2c]
 *     blx r3                                  ; (*f_2c)(0, b_1d, f_30)
 *     ldr r0,=data_0219dc80 ; mov r1,#2 ; ldr r0,[r0] ; str r1,[r0]
 *                                              ; p->f_0 = 2 */

typedef void (*fn_02048c28_t)(int a, int b, int c);
typedef struct {
    int            f_0;         /* +0x00 */
    char           _pad0[0x19];
    unsigned char  b_1d;        /* +0x1d */
    char           _pad1[0xe];
    fn_02048c28_t  f_2c;        /* +0x2c */
    int            f_30;        /* +0x30 */
} state_02048c28_t;

extern state_02048c28_t *data_0219dc80;

void func_02048c28(void) {
    data_0219dc80->f_2c(0, data_0219dc80->b_1d, data_0219dc80->f_30);
    data_0219dc80->f_0 = 2;
}
