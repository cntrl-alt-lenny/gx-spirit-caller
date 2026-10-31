typedef struct node_0205c748 s_node_t;
struct node_0205c748 {
    int f_0, f_4, f_8, f_c, f_10;
    char pad14[0x24];
    int f_38;
    s_node_t *f_3c;
};
typedef struct {
    char pad0[0x204];
    int f_204;
    char pad208[0x22c];
    s_node_t *f_434;
} registry_t;
typedef registry_t State;
typedef s_node_t Teardown;
typedef struct { State *state; } Context;
/* Both original callers consume r0; the existing void definitions lose
 * the return values that the original machine code provides. */
extern int func_02054b9c(int *out);
extern int func_02054d68(int a, unsigned char *b, int *c);
extern int func_02054e70(int unused0);
extern int func_02055000(int a0);
extern int func_02055250(void *self, int flag);
extern s_node_t *func_0205c748(registry_t **a0, int a1, int a2);
extern void func_0205c928(void *p);
extern void func_0205c9a0(Context *ctx, Teardown *node);
extern int func_0205cb14(Context *ctx, s_node_t *node);
int func_0205c830(Context *ctx) {
    registry_t *reg = ctx->state;
    s_node_t *node;
    int handle;
    s_node_t *next;
    if (reg->f_204 != -1 && func_02055000(reg->f_204) != 0) {
        handle = func_02054d68(reg->f_204, 0, 0);
        if (handle != -1) {
            node = func_0205c748(&ctx->state, -1, 0);
            if (node != 0) {
                node->f_0 = 0x68;
                node->f_8 = handle;
                func_02055250((void *)handle, 0);
                func_0205c928((void *)node->f_8);
            } else {
                func_02054e70(handle);
            }
        }
    }
    node = reg->f_434;
    while (node != 0) {
        int result;
        next = node->f_3c;
        result = func_0205cb14(ctx, node);
        if (node->f_0 == 0x6a || result != 0 || func_02054b9c(0) > node->f_10) {
            func_0205c9a0(ctx, node);
        }
        node = next;
    }
    return 0;
}
