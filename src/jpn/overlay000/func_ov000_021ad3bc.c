/* func_ov000_021ad3bc: object-builder sibling of 021ad540 (different table +
 * window-size constants). */
extern void func_0201e7ac(void *o, int a1);
extern void func_0201e910(int a, int b, int c, int d, int e, int f,
                          int g, int h, int i, int j, int k, int l);
extern void func_0201e798(void *o, int a1);
extern void func_0207fc40(void *o, int a1);
extern char *data_ov000_021c7524[];
void func_ov000_021ad3bc(int idx, int a1, int a2, int a3, int a4, int a5) {
    char *o = data_ov000_021c7524[idx];
    if (a1 != -1) {
        func_0201e7ac(o, (unsigned short)a1);
    }
    func_0201e910(1, *(int *)(o + 44), a4, 0, 0, 0, a3, a2, 115712, 416, a5, 0);
    if (a1 == -1) {
        func_0201e798(o, 1);
        func_0207fc40(o, 4096);
    }
}
