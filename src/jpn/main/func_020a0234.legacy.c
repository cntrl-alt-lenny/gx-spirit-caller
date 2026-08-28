typedef struct {
    char _pad0[0xe];
    unsigned short field_e;
    char _pad1[0x16 - 0x10];
    unsigned short field_16;
    char _pad2[0x1c - 0x18];
    unsigned short field_1c;
} sub_t;

extern void func_0209e6fc(int a, int b, int c);

int func_020a0234(char *p) {
    if (p == 0) {
        return 6;
    }
    if (((sub_t *)(p + 0x800))->field_e == 0) {
        return 3;
    }
    func_0209e6fc(((sub_t *)(p + 0x800))->field_16, 0, 0);
    ((sub_t *)(p + 0x800))->field_e = 0;
    ((sub_t *)(p + 0x800))->field_1c = 0;
    return 0;
}
