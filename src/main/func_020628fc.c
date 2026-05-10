/* func_020628fc: tail-call w/ 3 field-deref args. Calls
 * func_020628b0(p->f_8, p->f_0, p->h_4).
 *
 *     ldr ip, .L_02062914
 *     mov r1, r0
 *     ldrh r2, [r1, #0x4]
 *     ldr  r0, [r1, #0x8]
 *     ldr  r1, [r1, #0x0]
 *     bx   ip
 *  .L_02062914: .word func_020628b0
 */

extern int func_020628b0(int a, int b, unsigned short c);

typedef struct {
    int            f_0;
    unsigned short h_4;
    char           _pad6[0x2];
    int            f_8;
} state_020628fc_t;

int func_020628fc(state_020628fc_t *p) {
    return func_020628b0(p->f_8, p->f_0, p->h_4);
}
