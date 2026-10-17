typedef struct Obj {
    int pad0[7];
    int slots[4];
    int f2c;
    int pad2[5];
    int f44;
} Obj;

typedef struct Data {
    char pad0[0xc8];
    int f_c8;
    int pad1[2];
    int f_d4;
} Data;

extern Data data_ov002_022d0f2c;
extern void func_ov002_0229a414(int flag);

void func_ov002_022aec74(Obj *obj, int idx) {
    int v;
    if (obj->slots[idx] < 0) {
        return;
    }
    obj->f2c = idx;
    if (data_ov002_022d0f2c.f_c8 != 0) {
        func_ov002_0229a414(0);
    }
    obj->f44 = 7;
    v = data_ov002_022d0f2c.f_d4;
    if (v < 8) {
        v = 8;
    }
    data_ov002_022d0f2c.f_d4 = v;
}
