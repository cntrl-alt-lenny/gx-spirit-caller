extern int func_ov002_021bb90c(int bit0, int val);
extern int func_ov002_021b3ecc(int bit0, int a, int val);

typedef struct {
    unsigned short bit0 : 1;
    unsigned short pad1 : 5;
    unsigned short bits6_11 : 6;
    unsigned short pad2 : 4;
} Field2T;

int func_ov002_02208118(void *self) {
    Field2T *field2 = (Field2T *)((char *)self + 0x2);
    int val;

    if (field2->bits6_11 == 0x23) {
        goto ret_one;
    }

    {
        unsigned short field0 = *(unsigned short *)self;

        switch (field0) {
        case 0x175b:
            val = 0xfa7;
            break;
        case 0x17f6:
            val = 0xff8;
            break;
        }
    }

    if (func_ov002_021bb90c(field2->bit0, val) == 0) {
        return 0;
    }

    if (func_ov002_021b3ecc(field2->bit0, 0xb, val) != 0) {
        return 0;
    }

ret_one:
    return 1;
}
