typedef struct Node {
    int key;
    struct Node *next;
    int pad[5];
    unsigned flags;
} Node;
typedef struct Path {
    Node *node;
    unsigned short a, b;
    int c;
} Path;
typedef struct Context {
    int pad[2];
    Node *node;
    int pad2[9];
    Path path;
    const unsigned char *name;
    int mode;
    int value;
} Context;
/* The original call passes the path and prefix length despite the existing void definition. */
extern Node *func_020977c0(const unsigned char *name, int length);
extern int func_02097848(Context *self, int k);
extern Path data_021a830c;
static inline int has_flag(Node *node) { return (node->flags & 2) ? 1 : 0; }
int func_02098228(Context *ctx, const unsigned char *name, int a2, int a3) {
    Path path;
    int i;
    Node *node;
    if (*name == '/' || *name == '\\') {
        path.node = data_021a830c.node;
        path.a = 0;
        path.c = 0;
        path.b = 0;
        name++;
    } else {
        path = data_021a830c;
        for (i = 0; i <= 3; i++) {
            if (name[i] == 0 || name[i] == '/' || name[i] == '\\') break;
            if (name[i] == ':') {
                node = func_020977c0(name, i);
                if (node == 0) return 0;
                if (has_flag(node) == 0) return 0;
                path.node = node;
                path.c = 0;
                path.b = 0;
                path.a = 0;
                name += i + 1;
                if (*name == '/' || *name == '\\') name++;
                break;
            }
        }
    }
    ctx->node = path.node;
    ctx->name = name;
    ctx->path = path;
    if (a3 != 0) { ctx->mode = 1; ctx->value = a3; }
    else { ctx->mode = 0; ctx->value = a2; }
    return func_02097848(ctx, 4);
}



