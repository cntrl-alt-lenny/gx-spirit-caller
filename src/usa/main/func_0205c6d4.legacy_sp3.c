/* func_0205c6d4: allocate+zero a 0x40-byte node, populate fields from
 * params and two helper calls, then push it onto the front of the
 * *a0 registry's f_434 linked list.
 */

typedef struct node_0205c748 s_node_t;
struct node_0205c748 {
    int f_0;
    int f_4;
    int f_8;
    int f_c;
    int f_10;
    char _pad14[0x24];
    int f_38;
    s_node_t *f_3c;
};

typedef struct {
    char _pad[0x434];
    s_node_t *f_434;
} registry_t;

extern void func_0205c764(void);
extern void *func_02045398(int size);
extern void func_020a72e0(void *ptr, int val, int size);
extern int func_02054b28(int a);
extern int func_02054144(int a, int b, void *c);

s_node_t *func_0205c6d4(registry_t **a0, int a1, int a2) {
    registry_t *reg = *a0;
    s_node_t *node = func_02045398(0x40);
    if (node == 0) {
        return 0;
    }
    func_020a72e0(node, 0, 0x40);
    node->f_0 = 0x64;
    node->f_4 = a2;
    node->f_8 = -1;
    node->f_c = a1;
    node->f_10 = func_02054b28(0) + 0x12c;
    node->f_3c = reg->f_434;
    node->f_38 = func_02054144(0x18, 0, (void *)func_0205c764);
    reg->f_434 = node;
    return node;
}
