extern char *GetSystemWork(void);
extern int func_020195d0(int i);
extern int func_0201a13c(int a);

extern signed char data_020b5a8c[];

int func_02019778(int i) {
    signed char *entry;
    signed char field3;

    (void)GetSystemWork();
    entry = data_020b5a8c + i * 7;
    field3 = entry[3];
    if (field3 == 0) return 0;

    if (field3 + func_020195d0(i) + func_0201a13c(0xb) >= 100) {
        return 100;
    }
    return field3 + func_020195d0(i) + func_0201a13c(0xb);
}
