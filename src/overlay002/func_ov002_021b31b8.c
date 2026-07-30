extern int func_0202b878(int id);
extern int func_ov002_021c1e20(int a0, int a1, int flag);
extern int func_ov002_021c1d28(int a0, int a1, int flag);
extern int func_ov002_021b3240(int a0, int a1, int id, int a3);

int func_ov002_021b31b8(int a0, int a1, int id, int a3) {
    if (func_0202b878(id) == 0x17) {
        if (func_ov002_021c1e20(a0, a1, a0 != a3) != 0)
            return 0;
    } else {
        if (func_ov002_021c1d28(a0, a1, a0 != a3) != 0)
            return 0;
    }
    return func_ov002_021b3240(a0, a1, id, a3);
}
