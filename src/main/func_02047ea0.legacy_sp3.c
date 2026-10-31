typedef struct { char pad[0x108]; int x108; char pad10c[0xcc]; int x1d8; } Conn;
typedef struct { int words[0x81]; } Result;
typedef void (*ResultCb)(Conn **pp, Result *res, void *user);
typedef struct { char pad[0x1c]; void *value; } Obj;
typedef struct {
    int f0, state, f8, fc, f10;
    void (*callback)(int, void *, int);
    int arg;
    Obj *obj;
    char pad[0x10];
    int active;
} State;
extern State *data_0219dc78;
extern char data_020ff920[];
extern int func_020468ec(void);
extern void func_02047830(Conn **pp, Result *res, void *user);
extern int func_02047fb8(int param);
extern void func_020480b4(int a0, int a1);
extern int func_02049038(int id, char *a, char *b);
extern int func_02051618(void *value);
extern int func_02055c70(Conn **pp, void *buf, int a2, int a3, ResultCb cb, void *user);
void func_02047ea0(Conn **pp, Result *res, void *user) {
    data_0219dc78->active = 0;
    if (res->words[0] == 0) {
        if (data_0219dc78->state == 2) {
            if (data_0219dc78->obj->value == (void *)res->words[1]) {
                data_0219dc78->state = 5;
                if (func_02047fb8(func_02049038(1, data_020ff920, 0))) return;
                data_0219dc78->callback(0, (void *)res->words[1], data_0219dc78->arg);
                if (func_020468ec()) return;
                if (func_02051618((void *)res->words[1])) return;
            } else {
                func_020480b4(6, (int)0xffff15a0);
            }
        } else if (data_0219dc78->state == 3) {
            if (func_02047fb8(func_02055c70(pp, (void *)res->words[1], 0, 0, func_02047830, 0))) return;
        }
    } else {
        func_02047fb8(res->words[0]);
    }
}
