typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct Ov002Self;
struct node;
struct Node;
struct State { char pad[0x5a8]; int state; int count; };
struct Command { char pad[0xd70]; int a; int b; int c; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern int func_ov002_021e96a0(struct Ov002Self *, int, int);
extern int func_ov002_021ebe88(void *, int, int);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern u16 func_ov002_0223de94(struct node *, int);
extern int func_ov002_0225764c(int, int, int);
extern int func_ov002_021debe0(int, int, int);
/* Original caller supplies only two of the four definition parameters. */
extern int func_ov002_02257878();
extern void func_ov002_021e2b3c(int);
/* Original caller supplies no arguments; definition parameter is unused. */
extern void func_ov002_021e2c5c();
extern void func_ov002_021ae400(int, int);
extern void func_ov002_0225935c(int, int, int);
extern int func_ov002_022593f4(void);
extern int func_ov002_021de4b0(int, int, int);
int func_ov002_0222e404(struct Self *self) {
    int callback;
    int limit;
    int event;
    switch (self->id) {
    case 0x179f:
        callback = (int)func_ov002_021e96a0;
        event = 0x62;
        limit = 1;
        break;
    case 0x17b8:
        callback = (int)func_ov002_021ebe88;
        event = 0x8e;
        limit = 2;
        break;
    }
    switch (data_ov002_022ce288.state) {
    case 0x80: {
        unsigned int packed;
        int low, high;
        if (func_ov002_0223df38((struct Node *)self, 0, 0) == 0) break;
        packed = func_ov002_0223de94((struct node *)self, 0);
        low = packed & 0xff;
        high = ((u16)packed >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, low, high) == 0) break;
        if (func_ov002_021debe0((int)self, low, high) == 0) break;
        return func_ov002_02257878((int)self, callback) ? 0x7f : 0;
    }
    case 0x7f: {
        int r = func_ov002_02257878((int)self, callback);
        if (r == 0) return 0;
        func_ov002_021e2b3c(r);
        data_ov002_022ce288.count = 0;
        return 0x7e;
    }
    case 0x7e:
        if (data_ov002_022ce288.count == 0) func_ov002_021ae400(self->side, event);
        func_ov002_0225935c(self->side, self->id, callback);
        return 0x7d;
    case 0x7d:
        if (func_ov002_022593f4()) {
            func_ov002_021de4b0((int)self, data_ov002_022d016c.a, data_ov002_022d016c.b + data_ov002_022d016c.c);
            if (++data_ov002_022ce288.count < limit) return 0x7e;
            return 0x7c;
        }
        return data_ov002_022ce288.count ? 0x7c : 0x7e;
    case 0x7c:
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}



