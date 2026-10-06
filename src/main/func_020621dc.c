typedef struct {
    char         _0[0xc];
    int          state;
    int          f10;
    char         _14[0x8];
    unsigned int start;
    unsigned int timeout;
} obj_020621dc_t;

extern int func_020628fc(void *self);
extern void func_02061fa4(void *a0);
extern int func_02061c5c(void *self, int a, int b, int c);

int func_020621dc(obj_020621dc_t *o, unsigned int now) {
    int expired;

    if (o->state < 5) {
        expired = 0;
        if (o->f10 != 0) {
            if (o->timeout != 0 && now - o->start > o->timeout) {
                expired = 1;
            }
        } else if (o->state < 4 && now - o->start > 60000) {
            expired = 1;
        }
        if (expired) {
            func_020628fc(o);
            func_02061fa4(o);
            if (func_02061c5c(o, 6, 0, 0) == 0) {
                return 0;
            }
        }
    }
    return 1;
}
