extern char *data_0219daec;
extern int func_02045280(void);
extern void *func_02046888(int key);
/* Original passes only r0; the C thunk definition has four parameters. */
extern int func_0206255c();

int func_02046b3c(int key) {
    void *entry;
    if (data_0219daec == 0 || func_02045280() != 0 ||
        (*(int *)(data_0219daec + 0x24) != 5 &&
         *(int *)(data_0219daec + 0x24) != 6)) return -1;
    entry = func_02046888(key);
    if (entry == 0) return -2;
    func_0206255c((int)entry);
    return 0;
}
