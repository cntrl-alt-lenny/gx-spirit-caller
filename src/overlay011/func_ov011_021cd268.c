extern unsigned char data_ov011_021d32d8[];
extern unsigned char data_ov011_021d334a[];
extern struct {
    char pad[0x2a4];
    unsigned int low : 5;
    unsigned int value : 4;
    unsigned int high : 23;
} data_ov011_021d4000;
int func_ov011_021cd268(int arg0) {
    int key = arg0 - 0x65;
    int offset, count, i;

    offset = data_ov011_021d4000.value * 0x72;
    count = data_ov011_021d32d8[offset];
    i = 0;
    if (i < count) {
        unsigned char *base = data_ov011_021d334a + offset;
        unsigned char *p = base;
        do {
            if (key == p[-113]) return i;
            i++;
            p++;
        } while (i < base[-114]);
    }
    return -1;
}

