struct Func021ff320F2 {
    unsigned short bit0 : 1;
    unsigned short field5 : 5;
    unsigned short pad6 : 6;
    unsigned short field12 : 2;
    unsigned short rest : 2;
};
struct Func021ff320Self {
    unsigned short pad0;
    struct Func021ff320F2 f2;
};
extern char data_ov002_022d016c[];
extern int func_ov002_021ff320(struct Func021ff320Self *self, int unused1);
extern int func_ov002_022577dc(void *self);

int func_ov002_022064e8(struct Func021ff320Self *self, int arg1) {
    if (*(int *)(data_ov002_022d016c + 0xcec) == self->f2.bit0) {
        if (func_ov002_021ff320(self, arg1) != 0) {
            if (func_ov002_022577dc(self) != 0) return 2;
        }
    }
    if (self->f2.field12 == 0) return 3;
    return 0;
}
