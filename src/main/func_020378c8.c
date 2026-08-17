typedef struct {
    char _pad_00[0x8];
    int field_8;
    char _pad_0c[0x5a - 0xc];
    unsigned char byte_5a;
} node_t;

extern int func_02034a84(int n);
extern node_t *func_02038dac(int x);
extern node_t *func_02038d70(node_t *prev);
extern void func_0203ab9c(node_t *n);

int func_020378c8(int n, int b) {
    node_t *node;

    if (n < 0) {
        node = 0;
        for (;;) {
            node = func_02038d70(node);
            if (node == 0) {
                break;
            }
            if (b != 0 || node->byte_5a == 0) {
                node->field_8 = 0;
                func_0203ab9c(node);
            }
        }
        return 1;
    }

    node = func_02038dac(func_02034a84(n));
    if (node == 0 || node->field_8 == 0) {
        return 0;
    }
    if (b != 0 || node->byte_5a == 0) {
        node->field_8 = 0;
        func_0203ab9c(node);
        return 1;
    }
    return 0;
}
