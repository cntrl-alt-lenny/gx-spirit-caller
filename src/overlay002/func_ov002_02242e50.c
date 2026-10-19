typedef unsigned short u16;
struct S0223f684 {
    u16 f0;
    u16 low : 6;
    u16 tag : 6;
    u16 kind : 2;
    u16 high : 2;
};
extern int func_ov002_0223f684(struct S0223f684 *self, int arg1);
int func_ov002_02242e50(struct S0223f684 *self, int arg1) {
    if (self->kind == 1 && self->tag == 5)
        return 1;
    switch (self->f0) {
    case 0x1503:
    case 0x1694:
        return func_ov002_0223f684(self, arg1);
    default:
        return 1;
    }
}
