typedef struct Node {
    int state;
    char _pad4[0x4];
    int x8;
    int xc;
    char _pad10[0x4];
    int x14;
    char *name;
    char _pad1c[0x4];
    int x20;
    char _pad24[0x4];
    char buf[0x8];
    int len;
    char _pad34[0x8];
    struct Node *next;
} Node;

typedef struct {
    char _pad0[0x18];
    char *x18;
} Conn;

typedef struct {
    char _pad0[0x110];
    char x110[0x90];
    int x1a0;
    char _pad1a4[0x290];
    Node *head;
} Ctx;

extern char data_02100bc8[], data_02100cf8[], data_02100d00[], data_02100d08[];
extern char data_02100d10[], data_02100cf0[], data_02100cb8[], data_02100d20[];
extern char data_02100d30[], data_02100d28[], data_02100d54[], data_02100c68[], data_02100b64[];

extern int func_0205c54c(void *pp, Node *node);
extern int func_020601d0(void *pp, int sock, int *out);
extern int func_0205ffc0(void *p, char *msg);
extern int func_0205d6bc(void *pp, int val, Conn **out);
extern int func_02058070(void *ctx, void *buf, char *s);
extern void func_02058038(void *pp, void *buf, int v);
extern void func_020453b4(char *p);
extern int func_0205d4c0(Conn *c);
extern int func_0205d674(void *pp, Conn *c);
extern int func_02057b00(void *pp, int sock, char **name, int *o1, int *o2, char *lit);
extern int func_02057980(void *pp, int sock, void *buf, int *o, int a4, char *lit);
extern int func_0205c6e4(void *pp, Node *n);
extern char *func_020ab0c4(char *s, char *t);
extern int func_020ab054(char *a, char *b, int n);
extern void func_020a6d54(const char *expr, const char *file, const char *func, int line);

int func_0205d15c(void **pp, Node *node) {
    Ctx *ctx = (Ctx *)*pp;
    int a, b, c;
    Conn *conn;
    int r;
    char *p;
    char *name;
    Node *n;
    int keep;

    switch (node->state) {
    case 0x65:
        break;
    case 0x66:
        r = func_0205c54c(pp, node);
        if (r != 0) {
            return r;
        }
        break;
    case 0x67:
        r = func_020601d0(pp, node->x8, &a);
        if (r != 0) {
            return r;
        }
        if (a == 4) {
            func_0205ffc0(pp, data_02100bc8);
            return 3;
        }
        if (a == 3) {
            keep = 1;
            if (func_0205d6bc(pp, node->xc, &conn) == 0) {
                func_0205ffc0(pp, data_02100bc8);
                return 3;
            }
            func_02058070(pp, node->buf, data_02100cf8);
            func_02058070(pp, node->buf, data_02100d00);
            func_02058038(pp, node->buf, ctx->x1a0);
            func_02058070(pp, node->buf, data_02100d08);
            func_02058070(pp, node->buf, ctx->x110);
            func_02058070(pp, node->buf, data_02100d10);
            func_02058070(pp, node->buf, conn->x18);
            func_02058070(pp, node->buf, data_02100cf0);
            for (n = ctx->head; n != 0; n = n->next) {
                if (n->xc == node->xc && n != node && n->state <= 0x67) {
                    keep = 0;
                }
            }
            if (keep != 0) {
                func_020453b4(conn->x18);
                conn->x18 = 0;
                if (func_0205d4c0(conn) != 0) {
                    func_0205d674(pp, conn);
                }
            }
            node->state = 0x68;
        }
        break;
    case 0x68:
        r = func_02057b00(pp, node->x8, &node->name, &b, &c, data_02100cb8);
        if (r != 0) {
            return r;
        }
        p = func_020ab0c4(node->name, data_02100cf0);
        if (p != 0) {
            *p = 0;
            name = node->name;
            if (func_020ab054(name, data_02100d20, 7) == 0) {
                node->x14 = node->x14 + 1;
                if (node->x14 > 1) {
                    func_0205ffc0(pp, data_02100d30);
                    return 3;
                }
                r = func_0205c6e4(pp, node);
                if (r != 0) {
                    return r;
                }
            } else if (func_020ab054(name, data_02100d28, 6) != 0) {
                func_0205ffc0(pp, data_02100d54);
                return 3;
            }
            node->state = 0x69;
            node->x20 = 0;
        }
        break;
    default:
        func_020a6d54(data_02100c68, data_02100b64, 0, 0x9f);
        break;
    }
    if (node->len > 0) {
        r = func_02057980(pp, node->x8, node->buf, &c, 1, data_02100cb8);
        if (c != 0 || r != 0) {
            node->state = 0x6a;
        }
    }
    return 0;
}
