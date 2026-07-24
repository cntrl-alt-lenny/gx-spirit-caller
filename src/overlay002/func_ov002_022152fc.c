/* func_ov002_022152fc: type-tag guard (bits 6:11 of self+2). Unless
 * type==0x23, first gate on func_ov002_021bb91c(0x128b) != 0; either way,
 * fall through to forward (self, arg1) to func_ov002_02210810. */

typedef struct {
    unsigned short f0;
    unsigned short h2;
} Obj;

extern int func_ov002_021bb91c(int arg0);
extern int func_ov002_02210810(void *self, int arg1);

int func_ov002_022152fc(Obj *self, int arg1) {
    unsigned int type = ((unsigned int)(self->h2 << 20)) >> 26;
    if (type != 0x23) {
        if (func_ov002_021bb91c(0x128b) == 0) return 0;
    }
    return func_ov002_02210810(self, arg1);
}
