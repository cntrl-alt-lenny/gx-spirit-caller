extern void *data_0219daec;
extern void func_020466f4(int mode);
extern void func_020490dc(void);

typedef void (*func_0204642c_handler_t)(int, int, int);

void func_0204642c(int a0, int a1) {
    if (a0 == 0) {
        *(int *)((char *)data_0219daec + 0x64) = a1;
        func_020466f4(3);
        func_020490dc();
    } else {
        func_020466f4(0);
    }
    char *h = (char *)data_0219daec;
    func_0204642c_handler_t fn = *(func_0204642c_handler_t *)(h + 0x70);
    if (fn == 0) {
        return;
    }
    fn(a0, a1, *(int *)(h + 0x74));
}
