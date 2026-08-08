extern void *data_0219d9d4;
extern char data_020fe66c[];
extern void func_020418ac(void);

typedef void (*Callback)(void *, void *, int);

void func_0204037c(void) {
    if (data_0219d9d4 == 0) {
        return;
    }
    char *base = (char *)data_0219d9d4 + 0x1000;
    Callback cb = *(Callback *)(base + 0x210);
    if (*(int *)(base + 0x314) != 0) {
        func_020418ac();
    }
    cb(data_020fe66c, data_0219d9d4, 0);
    data_0219d9d4 = 0;
}
