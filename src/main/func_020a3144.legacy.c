typedef struct {
    char pad_0[4];
    void *field_4;
    int field_8;
    unsigned char field_c;
    char pad_d[3];
    unsigned char field_10;
} data_021a9850_t;

extern data_021a9850_t data_021a9850;

void func_020a3144(void) {
    void *p;
    if (data_021a9850.field_c != 2) {
        return;
    }
    p = data_021a9850.field_4;
    if (*((unsigned char *)p + 0x4b2) == 0) {
        data_021a9850.field_10 = 9;
        data_021a9850.field_8 = (int)p;
    } else {
        data_021a9850.field_10 = 4;
        data_021a9850.field_8 = (int)p + 0x220;
    }
    data_021a9850.field_c = 3;
}
