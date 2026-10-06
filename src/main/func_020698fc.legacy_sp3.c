typedef struct obj_020698fc obj_020698fc_t;

struct obj_020698fc {
    char   _0[0x488];
    void (*cb)(obj_020698fc_t *o, int ev, void *rec, int arg);
    char   _48c[0x8];
    int    arg;
};

extern void func_0206a724(obj_020698fc_t *o, unsigned char *p, int len, unsigned int *addr,
                          unsigned short *port);
extern int func_0206b6fc(char *a, int b, int c);
extern void *func_020684c8(int unused, int a, unsigned short b);
extern int func_02068480(int arg);
extern void *func_0206b644(obj_020698fc_t *o, int idx);
extern int func_0206a44c(obj_020698fc_t *o, void *rec, unsigned char *p, int len, int flag);
extern void func_0206b7d8(obj_020698fc_t *o, void *rec);

int func_020698fc(obj_020698fc_t *o, unsigned char *p, int len) {
    unsigned short port;
    unsigned int addr;
    void *rec;
    int idx;

    if (len < 5) {
        return 4;
    }
    func_0206a724(o, p, len, &addr, &port);
    idx = func_0206b6fc((char *)o, addr, port);
    if (idx == -1) {
        rec = func_020684c8((int)o, addr, port);
        if (func_02068480((int)rec) != 0) {
            return 5;
        }
    } else {
        rec = func_0206b644(o, idx);
    }
    if (func_0206a44c(o, rec, p, len, 0) < 0) {
        return 4;
    }
    if (idx == -1) {
        func_0206b7d8(o, rec);
    }
    o->cb(o, 1, rec, o->arg);
    return 0;
}
