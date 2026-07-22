typedef struct {
    void *flag;
    char pad[0x10 - 4];
    void (*callback)(void *);
    void *arg;
} T_0209413c;

extern T_0209413c data_021a6630;

void func_02094048(void) {
    void (*callback)(void *);
    void *arg;
    data_021a6630.flag = 0;
    callback = data_021a6630.callback;
    arg = data_021a6630.arg;
    if (callback != 0) {
        callback(arg);
    }
}
