typedef struct Node Node;
struct Node {
    int kind;
    int field4;
    void *handle;
    int fieldc;
    int deadline;
    char pad14[0x28];
    Node *next;
};
typedef struct State {
    char pad0[0x204];
    int handle;
    char pad208[0x22c];
    Node *head;
} State;
typedef struct Context { State *state; } Context;
/* Original caller consumes r0; the existing C definitions incorrectly say void. */
extern int func_02054b9c(int *out);
extern int func_02054d68(int a, unsigned char *b, int *c);
extern int func_02054e70(int unused0);
extern int func_02055000(int a0);
extern int func_02055250(void *self, int flag);
extern Node *func_0205c748(State **a0, int a1, int a2);
extern void func_0205c928(void *p);
extern void func_0205c9a0(Context *ctx, Node *node);
extern int func_0205cb14(Context *ctx, Node *node);
int func_0205c830(Context *ctx) {
    State *state = ctx->state;
    Node *node;
    Node *next;
    int handle;
    if (state->handle != -1 && func_02055000(state->handle) != 0) {
        handle = func_02054d68(state->handle, 0, 0);
        if (handle != -1) {
            node = func_0205c748(&ctx->state, -1, 0);
            if (node != 0) {
                node->kind = 0x68;
                node->handle = (void *)handle;
                func_02055250((void *)handle, 0);
                func_0205c928(node->handle);
            } else {
                func_02054e70(handle);
            }
        }
    }
    node = state->head;
    while (node != 0) {
        int result;
        next = node->next;
        result = func_0205cb14(ctx, node);
        if (node->kind == 0x6a || result != 0 || func_02054b9c(0) > node->deadline) {
            func_0205c9a0(ctx, node);
        }
        node = next;
    }
    return 0;
}
