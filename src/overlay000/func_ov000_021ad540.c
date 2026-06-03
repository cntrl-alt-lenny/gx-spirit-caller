/* func_ov000_021ad540: (re)create an object record from a stride-4 table,
 * optionally re-init it (a1 != -1), then build its window via the 12-arg
 * 0201e964 sink; on the -1 path, finalize + free. (object-builder family.) */
extern void func_0201e800(void *o, int a1);
extern void func_0201e964(int a, int b, int c, int d, int e, int f,
                          int g, int h, int i, int j, int k, int l);
extern void func_0201e7ec(void *o, int a1);
extern void func_0207fd28(void *o, int a1);
extern char *data_ov000_021c760c[];
void func_ov000_021ad540(int idx, int a1, int a2, int a3, int a4, int a5) {
    char *o = data_ov000_021c760c[idx];
    if (a1 != -1) {
        func_0201e800(o, (unsigned short)a1);
    }
    func_0201e964(1, *(int *)(o + 44), a4, 0, 0, 0, a3, a2, 121856, 480, a5, 0);
    if (a1 == -1) {
        func_0201e7ec(o, 1);
        func_0207fd28(o, 4096);
    }
}
