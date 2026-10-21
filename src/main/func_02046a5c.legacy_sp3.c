extern unsigned char *data_0219daec;
extern int func_0204f8f0(int *a0);
extern int func_0204f998(int *a0);

int func_02046a5c(int *out) {
    if (data_0219daec == 0) return 0;
    *out = (int)(data_0219daec + 0x624);
    if (*(volatile unsigned char *)(data_0219daec + 0x369) == 2 ||
        *(volatile unsigned char *)(data_0219daec + 0x369) == 3) {
        return func_0204f8f0(out);
    } else {
        return func_0204f998(out);
    }
}
