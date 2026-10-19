typedef struct Obj02061fa4 Obj02061fa4;
typedef struct {
    int f_0;
    unsigned short h_4;
    char _pad6[2];
    int f_8;
} state_020628fc_t;
typedef struct Context {
    int id;
    unsigned short tag;
    char pad6[2];
    struct Backend *backend;
    int state;
    char pad10[88];
    char key[32];
    char pad88[4];
    int time;
} Context;
struct Backend { char pad[32]; int callback; };
/* Original callers supply only self to this four-argument thunk. */
extern int func_020643d8();
extern int func_02055330(void);
extern int func_02060fdc(void *, void *);
extern int func_020628fc(state_020628fc_t *p);
extern void func_02061fa4(Obj02061fa4 *self);
extern int func_02061d5c(struct Backend *, Context *, int, unsigned short, int, void *, int);
int func_02063ed0(Context *self, char *data, int size) {
    if (self->state != 3) return func_020643d8((int)self) != 0;
    if (size < 32) return func_020643d8((int)self) != 0;
    if (func_02060fdc(data, self->key) == 0) return func_020643d8((int)self) != 0;
    if (self->backend->callback == 0) {
        if (func_020628fc((state_020628fc_t *)self) == 0) return 0;
        func_02061fa4((Obj02061fa4 *)self);
        return 1;
    }
    self->state = 4;
    return func_02061d5c(self->backend, self, self->id, self->tag, func_02055330() - self->time, data + 32, size - 32) != 0;
}

