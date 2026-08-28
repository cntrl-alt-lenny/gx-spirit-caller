struct A0_t {
    unsigned short field_0;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct A1_t {
    unsigned short field_0;
    unsigned short pad_bit0 : 1;
    unsigned short field2_bits : 5;
    unsigned short rest : 10;
};

typedef struct {
    char pad_000[0x5b4];
    int field_5b4;
} data_ov002_022ce288_t;
extern data_ov002_022ce288_t data_ov002_022ce1a8;

extern int func_0202de48(int x);
extern int func_0202e1e0(int x);
extern void func_ov002_0226ad60(int bit, int one, int val);
extern int func_ov002_021f495c(struct A0_t *self, struct A1_t *a1);

int func_ov002_021fa9c4(struct A0_t *a0, struct A1_t *a1) {
    int r4 = func_0202de48(a1->field_0);

    if (func_0202e1e0(a1->field_0) != 0) {
        unsigned int bits = a1->field2_bits;
        if (bits >= 5 && bits <= 10) {
            r4 = 7;
        }
    }
    switch (data_ov002_022ce1a8.field_5b4) {
    case 0:
        func_ov002_0226ad60(a0->bit0, 1, r4);
        data_ov002_022ce1a8.field_5b4++;
        return 0;
    case 1:
        func_ov002_021f495c(a0, a1);
        data_ov002_022ce1a8.field_5b4++;
        return 0;
    default:
        return 1;
    }
}
