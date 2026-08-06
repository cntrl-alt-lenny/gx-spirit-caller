/* func_ov002_0220bd20: self->kind==0x23 shortcuts to "true". Otherwise
 * self->f0 is tested against two id windows (around 0x1765 and 0x198a)
 * to optionally override the caller-supplied callArg, then calls
 * func_ov002_021bb90c(self->flag0, callArg); result is (call != 0).
 */

typedef unsigned short u16;

struct Self0220bd20 {
    u16 f0;
    u16 flag0 : 1;
    u16 pad1 : 5;
    u16 kind : 6;
    u16 pad2 : 4;
};

extern int func_ov002_021bb90c(int flag0, int callArg);

int func_ov002_0220bd20(struct Self0220bd20 *self, int callArg)
{
    unsigned int kind = self->kind;
    if (kind == 0x23) goto L_8c;

    {
        int ip = self->f0;
        if (ip > 0x1765) goto L_3c;
        if (ip >= 0x1765) goto L_64;
        if (ip != 0x1760) goto L_70;
        callArg = 0x1765 - 0x29;
        goto L_70;

    L_3c:
        if (ip > 0x198a) goto L_70;
        if (ip < 0x1988) goto L_70;
        if (ip == 0x1988) goto L_6c;
        if (ip != 0x198a) goto L_70;
        callArg = 0x198a - 0x91;
        goto L_70;

    L_64:
        callArg = 0x1765 - 0x29;
        goto L_70;

    L_6c:
        callArg = 0x198a - 0xe3;

    L_70:
        if (func_ov002_021bb90c(self->flag0, callArg) == 0) return 0;
    }
L_8c:
    return 1;
}
