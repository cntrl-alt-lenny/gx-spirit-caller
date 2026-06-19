/* func_ov002_022abeec: deref-and-index-then-tail-call.
 * `func_ov002_021afe98((p->f_68)[idx])`.
 *
 *     ldr r0, [r0, #0x68]
 *     ldr ip, .L_022ac038
 *     ldr r0, [r0, r1, lsl #0x2]
 *     bx  ip
 *  .L_022ac038: .word func_ov002_021afe98
 */

extern int func_ov002_021afe98(int x);

typedef struct {
    char  _pad[0x68];
    int  *f_68;
} state_ov002_022ac028_t;

int func_ov002_022abeec(state_ov002_022ac028_t *p, int idx) {
    return func_ov002_021afe98(p->f_68[idx]);
}
