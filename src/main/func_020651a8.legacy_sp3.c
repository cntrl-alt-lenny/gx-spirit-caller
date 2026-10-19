typedef struct {
    char pad0[7];
    unsigned char type;
    char pad8[4];
    unsigned char index;
} Packet;
typedef struct {
    char pad0[2];
    unsigned short port;
    unsigned int addr;
} Header;
typedef struct {
    int sock;
    int f4;
    char pad8[8];
    int state;
    int flags[3];
    char pad20[8];
    int deadline;
    char pad2c[8];
    void (*callback)(int, int);
    int f38;
    int arg;
} Object;
extern int func_02055330(void);
extern int func_02065dc0(int sock, unsigned int addr, int port, void *buf, int len);
void func_020651a8(Object *o, Packet *p, Header *h) {
    switch (p->type) {
    case 1:
        if (p->index > 2) return;
        o->flags[p->index] = 1;
        if (o->state != 0) return;
        if (o->flags[1] == 0) return;
        if (o->flags[2] == 0) return;
        if (o->f4 != -1) {
            if (o->flags[0] == 0) return;
        }
        o->state = 1;
        o->deadline = func_02055330() + 10000;
        o->callback(o->state, o->arg);
        break;
    case 2:
        p->type = 3;
        func_02065dc0(o->sock, h->addr, (unsigned short)(((h->port >> 8) & 0xff) | ((h->port << 8) & 0xff00)), p, 21);
        break;
    }
}
