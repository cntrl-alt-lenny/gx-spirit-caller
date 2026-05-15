/* func_02062888: tail-call w/ 3 field-deref args. Calls
 * func_0206283c(p->f_8, p->f_0, p->h_4).
 *
 *     ldr ip, .L_02062914
 *     mov r1, r0
 *     ldrh r2, [r1, #0x4]
 *     ldr  r0, [r1, #0x8]
 *     ldr  r1, [r1, #0x0]
 *     bx   ip
 *  .L_02062914: .word func_0206283c
 */

extern int func_0206283c(int a, int b, unsigned short c);

typedef struct {
    int            f_0;
    unsigned short h_4;
    char           _pad6[0x2];
    int            f_8;
} state_020628fc_t;

int func_02062888(state_020628fc_t *p) {
    return func_0206283c(p->f_8, p->f_0, p->h_4);
}
