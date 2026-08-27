extern char *data_0219da0c;
extern int func_0204f9b0(void);
extern int func_0204f9dc(void);

int func_02046a74(void) {
    if (data_0219da0c == 0) {
        return 0;
    }
    if (*(volatile unsigned char *)(data_0219da0c + 0x369) == 2) {
        goto d4;
    }
    if (*(volatile unsigned char *)(data_0219da0c + 0x369) != 3) {
        goto e0;
    }
d4:
    return func_0204f9b0() + 1;
e0:
    return func_0204f9dc() + 1;
}
