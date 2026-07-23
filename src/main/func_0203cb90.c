extern int func_0203c888(void);
extern unsigned char *data_0219d9c8;

int func_0203cb90(void) {
    int result = 0xff;
    unsigned int r = func_0203c888();
    if (r >= 10 && r <= 16) {
        result = data_0219d9c8[0x17];
    }
    return result;
}
