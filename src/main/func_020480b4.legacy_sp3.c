typedef struct {
    char pad[0x14];
    void (*callback)(int, int, int);
    int arg;
} State;
extern State *data_0219dc78;
extern void func_0204525c(int a0, int a1);
extern void func_0204802c(void);

void func_020480b4(int a0, int a1) {
    if (data_0219dc78 == 0) return;
    if (a0 == 0) return;
    func_0204525c(a0, a1);
    if (data_0219dc78->callback != 0) {
        data_0219dc78->callback(a0, 0, data_0219dc78->arg);
    }
    func_0204802c();
}
