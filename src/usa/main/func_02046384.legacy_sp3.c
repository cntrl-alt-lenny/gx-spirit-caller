extern void *data_0219da0c;
extern void func_0204664c(int mode);
extern void func_02049068(void);

typedef void (*func_0204642c_handler_t)(int, int, int);

void func_02046384(int a0, int a1) {
    if (a0 == 0) {
        *(int *)((char *)data_0219da0c + 0x64) = a1;
        func_0204664c(3);
        func_02049068();
    } else {
        func_0204664c(0);
    }
    char *h = (char *)data_0219da0c;
    func_0204642c_handler_t fn = *(func_0204642c_handler_t *)(h + 0x70);
    if (fn == 0) {
        return;
    }
    fn(a0, a1, *(int *)(h + 0x74));
}
