typedef struct { char data[0x800]; int len; } sbuf_02067294_t;
typedef struct {
    char pad[0x88];
    void (*mode0)(int, sbuf_02067294_t *, void *);
    void (*mode1)(int, int, sbuf_02067294_t *, void *);
    void (*mode2)(int, int, sbuf_02067294_t *, void *);
    void (*list)(int, unsigned char *, void *);
    int (*count)(int, void *);
    char pad2[0x70];
    void *ctx;
} Obj;
extern void func_02067294(sbuf_02067294_t *b, char *s);
extern int func_020a978c(char *, char *, ...);
extern char *data_02101928[];
extern char data_02101764[], data_0210176c[], data_02101770[];
void func_020667e8(Obj *o, sbuf_02067294_t *b, int mode) {
    int count, i, j, old;
    char text[0x80];
    struct { unsigned char list[0x100]; int n; } items;
    char *name;
    items.n = 0;
    if ((unsigned)(mode - 1) > 1) count = 1;
    else count = o->count(mode, o->ctx);
    o->list(mode, items.list, o->ctx);
    for (i = 0; i < items.n; i++) {
        name = data_02101928[items.list[i]];
        if (!name) name = data_02101764;
        if (mode == 0) {
            func_02067294(b, name);
            b->data[b->len - 1] = 0x5c;
            old = b->len;
            o->mode0(items.list[i], b, o->ctx);
            if (old == b->len) func_02067294(b, data_0210176c);
            b->data[b->len - 1] = 0x5c;
        } else {
            for (j = 0; j < count; j++) {
                func_020a978c(text, data_0210176c + 4, name, j);
                func_02067294(b, text);
                b->data[b->len - 1] = 0x5c;
                old = b->len;
                if (mode == 1) o->mode1(items.list[i], j, b, o->ctx);
                else if (mode == 2) o->mode2(items.list[i], j, b, o->ctx);
                if (old == b->len) func_02067294(b, data_0210176c);
                b->data[b->len - 1] = 0x5c;
            }
        }
    }
}
