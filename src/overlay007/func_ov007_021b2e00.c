extern void *func_02021660(void *a, int b, int idx);
extern void func_020216b0(void *node, int kind, int val);

int func_ov007_021b2e00(void *unused0, void *arg1, int arg2) {
    int idx;
    void *node;

    for (idx = 0; ; idx++) {
        node = func_02021660(arg1, 3, idx);
        if (!node) {
            break;
        }
        func_020216b0(node, 0xd, arg2);
        func_020216b0(node, 3, 0);
        func_020216b0(node, 4, 0);
        func_020216b0(node, 5, -26);
    }
    return 1;
}
