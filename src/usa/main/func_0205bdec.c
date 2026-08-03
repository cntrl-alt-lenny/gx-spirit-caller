typedef struct {
    char pad[0x20c];
    int counter;
    char pad2[0x424 - 0x20c - 4];
    void *head;
} Ctx0205be60;

typedef struct {
    int f0, f4, f8, fc, f10, f14, f18, f1c;
    void *f20;
} Node0205be60;

extern void *func_02045398(int size);
extern void func_0205ff4c(void *obj, void *data);
extern char data_02100a28;

int func_0205bdec(void *obj, int a1, int a2, void **out, int a4, int a5, int a6) {
    Ctx0205be60 *ctx = *(Ctx0205be60 **)obj;
    Node0205be60 *node = (Node0205be60 *)func_02045398(0x24);

    if (node == 0) {
        func_0205ff4c(obj, &data_02100a28);
        return 1;
    }

    node->f0 = a1;
    node->f4 = a2;
    node->f8 = a4;
    node->f14 = 0;

    if (a1 == 0) {
        node->f18 = 1;
    } else {
        int id = ctx->counter;
        ctx->counter = id + 1;
        node->f18 = id;
        if (ctx->counter < 2) {
            ctx->counter = 2;
        }
    }

    node->f1c = 0;
    node->fc = a5;
    node->f10 = a6;
    node->f20 = ctx->head;
    ctx->head = node;
    *out = node;
    return 0;
}
