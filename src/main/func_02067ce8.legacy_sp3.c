typedef struct Node Node;
struct Node {
    unsigned int id;
    unsigned short port;
    unsigned short pad6;
    unsigned int alt_id;
    unsigned short alt_port;
    unsigned short padE;
    unsigned int reply_id;
    unsigned char pad14;
    unsigned char flags;
    unsigned char pad16[10];
    Node *next;
};
typedef struct obj_02067f3c {
    int mode;
    int pad4;
    Node *head;
    unsigned char padC[20];
    int normal;
    int reply;
    unsigned int special;
} obj_02067f3c_t;
typedef struct {
    unsigned short family;
    unsigned short port;
    unsigned int id;
} Address;
/* The original reads r0 from this callee despite its existing void definition. */
extern int func_02054d14(int a, int b, int c, int d, unsigned char *e, int *f);
extern int func_02055000(int a0);
/* The original supplies four arguments to the constant-return stub. */
extern int func_02067e8c(obj_02067f3c_t *, Node *, signed char *, int);
extern void func_02067e94(obj_02067f3c_t *, Node *, signed char *, int);
extern void func_02067f3c(obj_02067f3c_t *o, Node *rec, signed char *p, int len);
void func_02067ce8(obj_02067f3c_t *o, int reply) {
    signed char buffer[0x800];
    Address addr;
    int addrlen = 8;
    int sock = reply ? o->reply : o->normal;
    if (func_02055000(sock) == 0) return;
    do {
        int len = func_02054d14(sock, (int)buffer, 0x7ff, 0, (unsigned char *)&addr, &addrlen);
        Node *n;
        if (len == -1) return;
        buffer[len] = 0;
        for (n = o->head; n != 0; n = n->next) {
            if ((reply && (n->flags & 8) && n->reply_id == addr.id) ||
                (n->id == addr.id && (n->port == addr.port || reply)) ||
                (n->id == o->special && (n->flags & 2) && n->alt_id == addr.id && n->alt_port == addr.port)) {
                if (reply) {
                    if (func_02067e8c(o, n, buffer, len)) break;
                } else {
                    if (o->mode == 1) func_02067f3c(o, n, buffer, len);
                    else func_02067e94(o, n, buffer, len);
                    break;
                }
            }
        }
    } while (func_02055000(sock));
}

