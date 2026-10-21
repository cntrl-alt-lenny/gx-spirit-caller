extern char data_020b5b80[];
extern char *GetSystemWork(void);
extern int func_02019604(void *o);
extern int func_0201a170(int v);

int func_020198ec(void *arg0) {
    int value;
    int result;
    char *entry;
    GetSystemWork();
    entry = data_020b5b80 + (int)arg0 * 7;
    value = (signed char)entry[5];
    if (value + (func_02019604(arg0) >> 1) > 30) {
        value = 30;
    } else {
        value += func_02019604(arg0) >> 1;
    }
    result = func_0201a170(10);
    result += value;
    return result;
}


