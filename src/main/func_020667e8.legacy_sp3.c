typedef struct {
    char data[0x800];
    int len;
} Sbuf_t;

typedef struct {
    unsigned char pad0[0x88];
    void (*cb88)(int id, Sbuf_t *b, void *ctx);
    void (*cb8c)(int id, int idx, Sbuf_t *b, void *ctx);
    void (*cb90)(int id, int idx, Sbuf_t *b, void *ctx);
    void (*cb94)(int mode, void *buf, void *ctx);
    int (*cb98)(int mode, void *ctx);
    unsigned char pad9c[0x70];
    void *ctx;
} Owner_t;

typedef struct {
    unsigned char list[0x100];
    int count;
} List_t;

extern char *data_02101928[];
extern char data_02101764[];
extern char data_0210176c[];
extern void func_02067294(Sbuf_t *b, const char *s);
extern int func_020a978c(char *out, const char *fmt, ...);

void func_020667e8(Owner_t *o, Sbuf_t *b, int mode) {
    int total;
    int i;
    int j;
    char tmp[0x80];
    List_t list;
    char *name;
    int len;

    list.count = 0;
    if ((unsigned)(mode - 1) > 1) {
        total = 1;
    } else {
        total = o->cb98(mode, o->ctx);
    }
    o->cb94(mode, &list, o->ctx);
    for (i = 0; i < list.count; i++) {
        name = data_02101928[list.list[i]];
        if (name == 0) {
            name = data_02101764;
        }
        if (mode == 0) {
            func_02067294(b, name);
            b->data[b->len - 1] = 0x5c;
            len = b->len;
            o->cb88(list.list[i], b, o->ctx);
            if (len == b->len) {
                func_02067294(b, data_0210176c);
            }
            b->data[b->len - 1] = 0x5c;
        } else {
            for (j = 0; j < total; j++) {
                func_020a978c(tmp, data_0210176c + 4, name, j);
                func_02067294(b, tmp);
                b->data[b->len - 1] = 0x5c;
                len = b->len;
                if (mode == 1) {
                    o->cb8c(list.list[i], j, b, o->ctx);
                } else if (mode == 2) {
                    o->cb90(list.list[i], j, b, o->ctx);
                }
                if (len == b->len) {
                    func_02067294(b, data_0210176c);
                }
                b->data[b->len - 1] = 0x5c;
            }
        }
    }
}
