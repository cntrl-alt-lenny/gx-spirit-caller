extern unsigned short func_0202b0b4(int id);
extern unsigned char data_02105bc0[];

void func_0202ba38(int id, int value) {
    int i = func_0202b0b4(id);
    if (i % 2 == 0) {
        data_02105bc0[i / 2] &= 0xf0;
        data_02105bc0[i / 2] |= value;
    } else {
        data_02105bc0[i / 2] = (data_02105bc0[i / 2] & 0xf) | (value << 4);
    }
}
