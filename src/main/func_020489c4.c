typedef struct {
    int field_0;
    int field_4;
} Target_t;

extern Target_t *data_0219dc80;
extern char data_020ff920[];
extern int func_02055a84(int val, int a, void *ctx);
extern void func_02048880(int val);

int func_020489c4(int a) {
    int r;
    r = func_02055a84(data_0219dc80->field_4, a, data_020ff920 + 4);
    func_02048880(r);
    return r;
}
