/* CAMPAIGN-PREP candidate for func_0208771c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs r4,r0 -> if(node==0); signed char cmp arg<node[0x3d]; r4 held across to return
 *   risk:       node[0x3d] is read signed (ldrb then signed cmp vs arg) — if arg/key signedness wrong the cmp flips. Also movs/bne fall-through ordering. reshape-able (signed char field); else operand-order coin-flip on cmp r5,r1.
 *   confidence: med
 */
/* func_0208771c: lookup/init. func_0207cfdc(state,0) on two tables; signed byte
 * compare arg<node->key returns 0; else write key, run init chain, return node. */

typedef struct {
    int            f_0;
    char           _pad_4[0x6];
    unsigned short h_a;
} cfdc_state_t;   /* matches func_0207cfdc */

extern char data_021a485c[];
extern char data_021a4868[];
extern char *func_0207cfdc(void *state, void *q);
extern void func_0207cff4(void *a, void *b);
extern void func_02087790(void);
extern void func_020877c8(void *node);

char *func_0208771c(int arg) {
    char *node = func_0207cfdc(data_021a485c, 0);
    if (node == 0) {
        node = func_0207cfdc(data_021a4868, 0);
        if (arg < node[0x3d]) return 0;
        func_02087790();
    }
    func_0207cff4(data_021a485c, node);
    node[0x3d] = (char)arg;
    func_020877c8(node);
    return node;
}
