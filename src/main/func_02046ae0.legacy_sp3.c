extern char *data_0219daec;
extern int func_0204fa24(void);
extern int func_0204fa50(void);

int func_02046ae0(void) {
    if (data_0219daec == 0) {
        return 0;
    }
    if (*(volatile unsigned char *)(data_0219daec + 0x369) == 2) {
        goto d4;
    }
    if (*(volatile unsigned char *)(data_0219daec + 0x369) != 3) {
        goto e0;
    }
d4:
    return func_0204fa24() + 1;
e0:
    return func_0204fa50() + 1;
}
