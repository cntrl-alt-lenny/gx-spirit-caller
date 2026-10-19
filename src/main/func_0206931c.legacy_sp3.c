typedef struct { int f0; unsigned short f4; char pad6[2]; int f8; unsigned short fc; char pade[2]; int f10; unsigned char f14, f15; char pad16[2]; void *table; int f1c, f20; } rec_020684c8_t;
typedef struct Obj { int state; char pad4[0x484]; void (*cb)(struct Obj *, int, int, int); char pad48c[8]; int arg; char pad498[0x18]; int socket; unsigned int time; } Obj;
typedef struct { unsigned short family, port; int addr; } Address;
typedef struct { char pad0[4]; int field_4; char pad1[0x480]; void (*callback)(void *, int, int, int); char pad2[8]; int field_494; } T_0206b7d8;
extern int data_0219eccc;
/* The assembly consumes r0 from this wrapper, whose existing C definition is void. */
extern int func_02054d14(int a, int b, int c, int d, unsigned char *e, int *f);
/* This caller supplies a socket, although the existing definition takes void. */
extern int func_02054e70(int socket);
extern int func_02055000(int a0);
extern int func_02055330(void);
extern int func_02068480(int arg);
extern void func_020684c0(void *p, unsigned char value);
extern rec_020684c8_t *func_020684c8(int unused, int a, unsigned short b);
extern int func_0206b6fc(char *a, int b, int c);
extern void func_0206b7d8(T_0206b7d8 *p, int a1);
int func_0206931c(Obj *o) {
    char buffer[0x5dc];
    Address address;
    int size = 8;
    rec_020684c8_t *rec;
    if (func_02055000(o->socket) != 0) {
        unsigned char *peer = (unsigned char *)&address;
        int *length = &size;
        char *payload = buffer;
        do {
        if (func_02054d14(o->socket, (int)payload, 0x5db, 0, peer, length) != -1) {
            if (func_0206b6fc((char *)o, address.addr, address.port) == -1) {
                rec = func_020684c8((int)o, address.addr, address.port);
                if (func_02068480((int)rec) != 0) return 5;
                func_020684c0(rec, 0x11);
                func_0206b7d8((T_0206b7d8 *)o, (int)rec);
            }
        }
        } while (func_02055000(o->socket) != 0);
    }
    if ((unsigned int)(func_02055330() - o->time) > 0x7d0) {
        func_02054e70(o->socket);
        o->socket = -1;
        o->state = 1;
        o->cb(o, 3, data_0219eccc, o->arg);
    }
    return 0;
}




