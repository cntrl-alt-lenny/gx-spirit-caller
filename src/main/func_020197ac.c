extern char *GetSystemWork(void);
extern int func_02019604(int i);
extern int func_0201a170(int a);

extern signed char data_020b5b80[];

int func_020197ac(int i) {
    signed char *entry;
    signed char field3;

    (void)GetSystemWork();
    entry = data_020b5b80 + i * 7;
    field3 = entry[3];
    if (field3 == 0) return 0;

    if (field3 + func_02019604(i) + func_0201a170(0xb) >= 100) {
        return 100;
    }
    return field3 + func_02019604(i) + func_0201a170(0xb);
}
