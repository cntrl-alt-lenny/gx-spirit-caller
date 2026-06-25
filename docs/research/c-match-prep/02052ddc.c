/* CAMPAIGN-PREP candidate for func_02052ddc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     TAIL-CALL thunk via word ptr; field load + arg swap
 *   risk:       f_24 offset/sign guessed; pure-tail bx-via-ip should match; return type may be void
 *   confidence: high
 */
/* func_02052ddc: tiny tail-call thunk.
 *   r3=arg0; r0=arg1; r1=arg0->f_24; bx func_0205337c
 * => return func_0205337c(arg1, arg0->f_24); (args swapped, field loaded). */

typedef struct {
    char _pad[0x24];
    int  f_24;
} obj_t;

extern int func_0205337c(int a, int b);

int func_02052ddc(obj_t *p, int x) {
    return func_0205337c(x, p->f_24);
}
