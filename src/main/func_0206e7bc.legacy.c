typedef unsigned int u32;
typedef void **(*AllocFn)(int, void *);
typedef void (*FreeFn)(int, int *, int);
typedef struct Config {
    u32 flag, a, b, c, d, e;
    void **(*alloc)(void *);
    void (*free)(void *);
    u32 size, unused24, unused28, unused2c, x, y;
} Config;
typedef struct Input {
    u32 unused;
    AllocFn alloc;
    FreeFn free;
    u32 flag, a, b, c, d, e, unused24, unused28, x, y;
} Input;
extern Config data_0219ed84;
extern AllocFn data_0219ed58;
extern FreeFn data_0219ed54;
extern int func_0206bd30(void *param0);
extern void **func_0206e980(void *p);
extern void func_0206e940(void *p);
int func_0206e7bc(Input *p) {
    u32 v;
    data_0219ed84.flag = p->flag == 1;
    v = p->a;
    data_0219ed84.a = ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) | ((v << 8) & 0xff0000) | ((v << 24) & 0xff000000);
    v = p->b;
    data_0219ed84.b = ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) | ((v << 8) & 0xff0000) | ((v << 24) & 0xff000000);
    v = p->c;
    data_0219ed84.c = ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) | ((v << 8) & 0xff0000) | ((v << 24) & 0xff000000);
    v = p->d;
    data_0219ed84.d = ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) | ((v << 8) & 0xff0000) | ((v << 24) & 0xff000000);
    v = p->e;
    data_0219ed84.e = ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) | ((v << 8) & 0xff0000) | ((v << 24) & 0xff000000);
    data_0219ed84.alloc = func_0206e980;
    data_0219ed84.free = func_0206e940;
    data_0219ed58 = p->alloc;
    data_0219ed54 = p->free;
    data_0219ed84.size = 0x40;
    data_0219ed84.x = p->x;
    data_0219ed84.y = p->y;
    return func_0206bd30(&data_0219ed84);
}
