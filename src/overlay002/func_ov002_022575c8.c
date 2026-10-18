typedef struct { unsigned int flags; int pad[4]; } Ent;
typedef struct { Ent e[107]; int pad[3]; } Tbl;
typedef struct { char pad[0x5c0]; int f; } Glob;
extern Tbl data_ov002_022cf1ac[];
extern Glob data_ov002_022ce288;
extern int *func_ov002_02257464(int a);

int func_ov002_022575c8(int a0, int a1, int a2) {
    int *p = func_ov002_02257464(a0);
    if (p != 0 && p[2] != 0) {
        data_ov002_022ce288.f = 0;
        if (((data_ov002_022cf1ac[a1 & 1].e[a2].flags >> 2) & 1) == 0) {
            return ((int (*)(int, int, int))p[2])(a0, a1, a2);
        }
        return 0;
    }
    return 1;
}
