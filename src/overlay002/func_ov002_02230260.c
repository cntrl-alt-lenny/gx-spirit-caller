/* func_ov002_02230260: dispatch on fieldC (at +0xc): 1 -> notify(b0,1);
 * 2 -> notify(1-b0,1,1); else no-op. */
struct S02230260 {
    char _pad0[2];
    unsigned short b0 : 1;
    char _pad1[8];
    unsigned short fieldC;
};

extern void func_ov002_021e104c(int b0, int c);
extern void func_ov002_0226af38(int b0inv, int a, int b);

int func_ov002_02230260(struct S02230260 *self) {
    switch (self->fieldC) {
    case 1:
        func_ov002_021e104c(self->b0, 1);
        break;
    case 2:
        func_ov002_0226af38(1 - self->b0, 1, 1);
        break;
    }
    return 0;
}
