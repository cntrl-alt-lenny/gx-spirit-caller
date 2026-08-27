extern void *data_0219d8f4;
extern char data_020fe58c[];
extern void func_0204185c(void);

typedef void (*Callback)(void *, void *, int);

void func_0204032c(void) {
    if (data_0219d8f4 == 0) {
        return;
    }
    char *base = (char *)data_0219d8f4 + 0x1000;
    Callback cb = *(Callback *)(base + 0x210);
    if (*(int *)(base + 0x314) != 0) {
        func_0204185c();
    }
    cb(data_020fe58c, data_0219d8f4, 0);
    data_0219d8f4 = 0;
}
