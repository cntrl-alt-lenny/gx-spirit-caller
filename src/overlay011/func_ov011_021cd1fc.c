extern unsigned char data_ov011_021d32d8[];
extern unsigned char data_ov011_021d334a[];
extern struct {
    char pad[0x2a4];
    unsigned int low : 5;
    unsigned int value : 4;
    unsigned int high : 23;
} data_ov011_021d4000;
int func_ov011_021cd1fc(int arg0) {
    int offset = data_ov011_021d4000.value * 0x72;
    int count = data_ov011_021d32d8[offset];
    int i = 0;
    if (i < count) {
        unsigned char *base = data_ov011_021d334a + offset;
        unsigned char *p = base;
        do {
            if (arg0 == p[-40]) return i;
            i++;
            p++;
        } while (i < base[-114]);
    }
    return -1;
}
