extern void *func_0202160c(void *a, int b, int idx);
extern void func_0202165c(void *node, int kind, int val);

int func_ov007_021b2d00(void *unused0, void *arg1, int arg2) {
    int idx;
    void *node;

    for (idx = 0; ; idx++) {
        node = func_0202160c(arg1, 3, idx);
        if (!node) {
            break;
        }
        func_0202165c(node, 0xd, arg2);
        func_0202165c(node, 3, 0);
        func_0202165c(node, 4, 0);
        func_0202165c(node, 5, -26);
    }
    return 1;
}
