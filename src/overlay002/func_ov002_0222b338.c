struct Ov002SelfField5 {
    unsigned short f0;
    unsigned short b0     : 1;
    unsigned short field5 : 5;
    unsigned short _pad   : 10;
};

extern int func_ov002_021b4120(int b0, int field5, int f0);
extern int func_ov002_021de480(int b0, int field5, int zero1, int zero2);
extern void func_ov002_021df818(struct Ov002SelfField5 *self, int val, int c);

int func_ov002_0222b338(struct Ov002SelfField5 *self) {
    int result = func_ov002_021b4120(self->b0, self->field5, self->f0);
    func_ov002_021de480(self->b0, self->field5, 0, 0);
    if (result >= 0) {
        func_ov002_021df818(self, result, 0xbb8);
    }
    return 0;
}
