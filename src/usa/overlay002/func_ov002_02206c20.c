/* func_ov002_02206c20: guard func_ov002_021ff2cc(self)==0 -> 0. If f6_11 !=
 * 0x23, map self->f0 to one of 3 constants (uninitialized -- matches the
 * original's undefined-if-no-match behavior) and guard
 * func_ov002_021bb82c(bit0,c)==0 -> 0. Else/then return 1. */
typedef unsigned short u16;
struct S02206d10F2 { u16 bit0 : 1; u16 f1_5 : 5; u16 f6_11 : 6; u16 pad : 4; };
struct S02206d10 { u16 f0; struct S02206d10F2 f2; };

extern int func_ov002_021ff2cc(struct S02206d10 *self);
extern int func_ov002_021bb82c(int bit0, int c);

int func_ov002_02206c20(struct S02206d10 *self) {
    int c;
    if (func_ov002_021ff2cc(self) == 0)
        return 0;
    if (self->f2.f6_11 != 0x23) {
        unsigned short f0 = self->f0;
        if (f0 == 0x15b6)
            goto case1;
        if (f0 == 0x167e)
            goto case2;
        if (f0 == 0x169e)
            c = 0x1532;
        goto cont;
    case1:
        c = 0x157f;
        goto cont;
    case2:
        c = 0x129e;
    cont:
        if (func_ov002_021bb82c(self->f2.bit0, c) == 0)
            return 0;
    }
    return 1;
}
