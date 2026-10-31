typedef void (*Callback)(void *, void *, int);
extern char *data_0219d9f0;
extern void *data_0219d9fc;
extern char data_020feb80[], data_020fea58[], data_020feb0c[], data_020feb90[];
extern void func_020418ac(void *);
extern void func_0204037c(void);

void func_020432d0(void) {
    Callback cb = *(Callback *)(data_0219d9f0 + 0x110c);
    if (data_0219d9fc != 0) {
        func_020418ac(data_0219d9fc);
        cb(data_020feb80, data_0219d9fc, 0);
        data_0219d9fc = 0;
    }
    func_0204037c();
    if (data_0219d9f0 == 0) return;
    if (*(void **)(data_0219d9f0 + 0x1114) != 0) {
        cb(data_020fea58, *(void **)(data_0219d9f0 + 0x1114), 0);
        *(void **)(data_0219d9f0 + 0x1114) = 0;
    }
    if (*(void **)(data_0219d9f0 + 0x1118) != 0) {
        cb(data_020feb0c, *(void **)(data_0219d9f0 + 0x1118), 0);
        *(void **)(data_0219d9f0 + 0x1118) = 0;
    }
    cb(data_020feb90, data_0219d9f0, 0);
    data_0219d9f0 = 0;
}
