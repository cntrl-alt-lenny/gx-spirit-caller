typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { char pad[0x64]; u32 flag; } ctx_020919d8_t;
typedef struct { ctx_020919d8_t *ctx; int active; u8 state; char pad9[7]; int time; char pad14[4]; u16 a,b; int c,d; } Conn;
typedef struct Node { char pad[0x68]; struct Node *next; char pad6c[0x38]; Conn *conn; } Node;
typedef struct { char pad[8]; Node *head; } List;
typedef struct { int active; char pad4[6]; u16 time; } Cache;
typedef struct { char pad[4]; u16 active; char pad6[0x26]; int time; int pad30; void *arg; } Entry;
typedef struct { char pad[0x3c]; int a; void *b; int pad44; int c; void *d; char pad50[0x14]; } State;
extern int data_0219ef10, data_0219eed8, data_0219eedc;
extern u32 data_0219eef8;
extern State data_0219eff0;
extern char data_0219f3b8[], data_0219f238[];
extern Cache data_0219ef90[8];
extern List data_021a63d0;
extern Entry data_0219f538[8];
extern int (*data_0219ef14)(void);
extern void (*data_0219ef08)(void);
extern void (*data_0219ef0c)(void *);
extern void func_020945f4(void *, int, int);
extern void func_02071028(int v);
extern void func_02071010(void);
extern void func_02091768(int);
extern unsigned long long func_020930b0(void);
extern void func_02070278(void);
extern int func_0206f624(void);
extern int func_0206f4fc(unsigned int *out, int mode);
extern void func_02074498(int arg);
extern void func_02073738(unsigned int ip);
extern void func_020919d8(ctx_020919d8_t *ctx);
extern void func_020745fc(int now);
extern void func_0206f48c(void);
void func_0206fe0c(void) {
    unsigned int countdown;
    int state, arp, first;
    u32 now;
    int i;
    Cache *cache;
    Node *node;
    Entry *entry;
    data_0219ef10 = 0;
    func_020945f4(&data_0219eff0, 0, 0x64);
    data_0219eff0.a = 0x180;
    data_0219eff0.b = data_0219f3b8;
    data_0219eff0.c = 0x180;
    data_0219eff0.d = data_0219f238;
    func_02071028((int)&data_0219eff0);
    arp = 1;
    first = 1;
    countdown = 1;
    data_0219eed8 = 1;
    state = 0;
    for (;;) {
        func_02091768(1000);
        if (data_0219ef10) break;
        now = func_020930b0() >> 16;
        if (data_0219ef14()) {
            if (--countdown == 0) {
                if (data_0219eedc & 1) {
                    if (state == 0) {
                        func_02070278();
                        state = 1;
                    }
                } else {
                    switch (state) {
                    case 0:
                        if (first) {
                            data_0219eed8 = 2;
                            first = 0;
                        }
                        if (!func_0206f624() || !func_0206f4fc(&countdown, 0)) {
                            func_02070278();
                            state = 3;
                        } else state = 1;
                        break;
                    case 1:
                        if (!func_0206f4fc(&countdown, 1)) {
                            if (countdown < 60) state = 2;
                        }
                        break;
                    case 2:
                        if (func_0206f4fc(&countdown, 2)) state = 1;
                        else if (countdown < 60) {
                            func_02074498(3);
                            state = 0;
                            countdown = 1;
                            arp = 1;
                        }
                        break;
                    case 3: break;
                    }
                }
            }
        } else {
            func_02074498(1);
            state = 0;
            countdown = 1;
            arp = 1;
        }
        for (i = 0, cache = data_0219ef90; i < 8; cache++, i++) {
            if (cache->active) {
                if ((short)(now - cache->time) > 957) cache->active = 0;
            }
        }
        if (data_0219eef8) {
            if (--arp == 0) {
                func_02073738(data_0219eef8);
                arp = 105;
            }
        }
        for (node = data_021a63d0.head; node; node = node->next) {
            Conn *conn = node->conn;
            if (conn && conn->ctx) {
                if (conn->state == 3 && (int)(now - conn->time) > 39) {
                    conn->state = 1;
                    conn->a = conn->b;
                    conn->c = conn->d;
                } else if (conn->state == 2 && (int)(now - conn->time) > 39) {
                    if (conn->active == 1) {
                        conn->state = 0;
                        conn->active = 0;
                        func_020919d8(conn->ctx);
                    }
                } else if (conn->state != 4 && conn->active == 2) {
                    conn->active = 0;
                    func_020919d8(conn->ctx);
                }
            }
        }
        for (i = 0, entry = data_0219f538; i < 8; entry++, i++) {
            if (entry->active && (int)(now - entry->time) > 239) {
                data_0219ef0c(entry->arg);
                entry->active = 0;
            }
        }
        func_020745fc(now);
        if (data_0219ef08) data_0219ef08();
    }
    if (!(data_0219eedc & 1) && state != 3) func_0206f48c();
    func_02071010();
}


