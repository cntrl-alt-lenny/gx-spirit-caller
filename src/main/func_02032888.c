typedef struct {
    char _pad[0xe80];
    void *handle;
    int handle_a;
    int handle_b;
    char _pad2[0x38];
    void (*callback)(void *h, int a, int b);
} obj_020334cc_t;
typedef struct {
    char _pad[0xeb4];
    unsigned int flags;
} obj_02033864_t;
typedef struct {
    char pad[0xeb4];
    unsigned int flags;
    char pad2[0x14];
    void (*callback)(int, int, int, int, int);
} Context;
extern void *func_020334cc(obj_020334cc_t *o);
extern int func_02033864(obj_02033864_t *o);
extern int func_02032d58(int arg);
extern int func_02046ae0(void);
extern int func_02051a84(void);
extern int func_02051ec0(void);
void func_02032888(int a, int b, int c, int d, int e, Context *o) {
    if (func_020334cc((obj_020334cc_t *)o) != 0) return;
    if (b == 0 && c != 0) func_02033864((obj_02033864_t *)o);
    if (func_02046ae0() == 1) {
        if (func_02051a84() != 2 || (o->flags & 0x10000)) {
            o->flags &= ~0x2000;
            o->flags &= ~0x1000;
            o->flags &= ~0x4000;
            o->flags &= ~0x10000;
            o->flags |= 0x20000;
            func_02051ec0();
        }
        if (func_02051a84() == 2 && (o->flags & 0x40000)) {
            func_02033864((obj_02033864_t *)o);
            o->flags |= 0x20000;
        }
    } else {
        if (func_02051a84() == 2 && (o->flags & 0x40000)) {
            func_02032d58((int)o);
        }
    }
    if (o->callback != 0) o->callback(a, b, c, d, e);
}

