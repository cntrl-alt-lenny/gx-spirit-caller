extern int func_0202b824(int id);
extern int func_ov002_021c1d40(int a0, int a1, int flag);
extern int func_ov002_021c1c48(int a0, int a1, int flag);
extern int func_ov002_021b3160(int a0, int a1, int id, int a3);

int func_ov002_021b30d8(int a0, int a1, int id, int a3) {
    if (func_0202b824(id) == 0x17) {
        if (func_ov002_021c1d40(a0, a1, a0 != a3) != 0)
            return 0;
    } else {
        if (func_ov002_021c1c48(a0, a1, a0 != a3) != 0)
            return 0;
    }
    return func_ov002_021b3160(a0, a1, id, a3);
}
