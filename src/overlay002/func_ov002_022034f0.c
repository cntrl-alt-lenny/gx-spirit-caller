typedef unsigned short u16;

typedef struct {
    u16 f0;
    u16 b0 : 1;
    u16 _pad1 : 5;
    u16 kind : 6;
} SelfExt022034f0;

extern int func_ov002_021bb90c(int flag, int cmd);

int func_ov002_022034f0(SelfExt022034f0 *self) {
    if (self->kind == 0x23)
        goto yes;
    if (func_ov002_021bb90c(self->b0, 0x1532) == 0)
        return 0;
    if (func_ov002_021bb90c(self->b0, 0x1686) == 0)
        return 0;
yes:
    return 1;
}
