typedef struct {
    char _pad_00[0x8];
    int field_8;
    char _pad_0c[0x5a - 0xc];
    unsigned char byte_5a;
} node_t;

extern int func_02034a34(int n);
extern node_t *func_02038d5c(int x);
extern node_t *func_02038d20(node_t *prev);
extern void func_0203ab4c(node_t *n);

int func_02037878(int n, int b) {
    node_t *node;

    if (n < 0) {
        node = 0;
        for (;;) {
            node = func_02038d20(node);
            if (node == 0) {
                break;
            }
            if (b != 0 || node->byte_5a == 0) {
                node->field_8 = 0;
                func_0203ab4c(node);
            }
        }
        return 1;
    }

    node = func_02038d5c(func_02034a34(n));
    if (node == 0 || node->field_8 == 0) {
        return 0;
    }
    if (b != 0 || node->byte_5a == 0) {
        node->field_8 = 0;
        func_0203ab4c(node);
        return 1;
    }
    return 0;
}
