typedef struct {
    unsigned char b[5];
    char          _pad[0x800 - 5];
    int           f_800;
} obj_02066ea0_t;

typedef struct {
    int           sock;
    char          _4[0x80];
    unsigned char id[0x2c];
    int           fb0;
    char          _b4[0x18];
    char          addr[8];
} conn_02066224_t;

extern void func_02066ea0(obj_02066ea0_t *dst, unsigned char tag, const unsigned char *src);
extern int func_02054ca8(int sock, void *buf, int len, int flags, void *to, int tolen);
extern int func_02055330(void);

void func_02066224(conn_02066224_t *c) {
    obj_02066ea0_t pkt;

    pkt.f_800 = 0;
    func_02066ea0(&pkt, 8, c->id);
    func_02054ca8(c->sock, &pkt, pkt.f_800, 0, c->addr, 8);
    c->fb0 = func_02055330();
}
