typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 id;
    u16 flags;
    u32 a;
    u32 b;
    u32 c;
    u32 d;
    u32 e;
} Query;

extern void *func_ov002_02257464(Query *q);

int func_ov002_0225753c(u16 id) {
    Query q = {0};
    q.id = id;
    q.flags = (q.flags & ~0x3000) | 0x3000;
    return func_ov002_02257464(&q) != 0;
}
