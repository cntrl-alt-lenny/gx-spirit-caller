typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Context {
    int sock, other, id, fc, state, f14, f18, f1c, retries, limit;
    u32 deadline, addr;
    u16 port;
    u8 f32, f33;
    int f34;
    void (*callback)(int, int, void *, int);
    int user;
} Context;
typedef struct { u8 zero, type; u16 port; u32 addr; } Address;
extern u8 data_0219e96c[];
/* The original consumes r0 from this call; the existing void definition drops that result. */
extern int func_02054d14(int a, int b, int c, int d, unsigned char *e, int *f);
extern int func_02055000(int a0);
extern int func_02055330(void);
extern void func_0206504c(unsigned char *p, int len, int arg);
extern void func_02065788(int unused0);
extern void func_020659ac(Context *p);
extern void func_02065acc(Context *p);
extern void func_02065e78(int key);
void func_02065590(Context *p) {
    u8 source[8];
    int size = 8;
    Address address;
    int len;
    u8 *recv;
    int *sizep;
    if (p->state == 4) { func_02065e78((int)p); return; }
    while (p->sock != -1) {
        recv = source;
        sizep = &size;
        if (func_02055000(p->sock) == 0) break;
        len = func_02054d14(p->sock, (int)data_0219e96c, 0x200, 0, recv, sizep);
        if (len == -1) break;
        func_0206504c(data_0219e96c, len, (int)recv);
        if (p->state == 4) break;
    }
    if (p->state == 0 || p->state == 2) {
        if ((u32)func_02055330() > p->deadline) {
            if (p->retries > p->limit) {
                p->callback(2, -1, 0, p->user);
                func_02065788(p->id);
            } else {
                p->retries++;
                if (p->state == 0) func_02065acc(p);
                else func_020659ac(p);
            }
        }
    }
    if (p->state == 3) {
        if ((u32)func_02055330() > p->deadline) {
            if (p->other == -1) {
                address.type = 2;
                address.port = ((p->port >> 8) & 0xff) | ((p->port << 8) & 0xff00);
                address.addr = p->addr;
                p->callback(0, p->sock, &address, p->user);
                p->sock = -1;
            }
            func_02065788(p->id);
        }
    }
    if (p->state == 1) {
        if ((u32)func_02055330() > p->deadline) {
            p->callback(1, -1, 0, p->user);
            func_02065788(p->id);
        }
    }
}


