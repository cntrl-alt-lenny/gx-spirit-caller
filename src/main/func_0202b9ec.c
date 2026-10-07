extern unsigned char data_02105bc0[];
extern int func_0202b0b4(void);

unsigned char func_0202b9ec(void) {
    int i = func_0202b0b4();
    if (i % 2 == 0) {
        return data_02105bc0[i / 2] & 0xf;
    }
    return (data_02105bc0[i / 2] & 0xf0) >> 4;
}
