typedef struct Obj {
    int pad0[14];
    int f38;
    int pad1;
    int f40;
} Obj;

typedef struct Data {
    char pad[0xd4];
    int f_d4;
} Data;

extern Data data_ov002_022d0f2c;
extern int func_ov002_022ae284(int a);
extern void func_ov002_02259834(void);
extern void func_ov002_022ae9c0(Obj *o, int b);

void func_ov002_022aebec(Obj *obj) {
    int v;
    if (func_ov002_022ae284(1) == 0) {
        return;
    }
    func_ov002_02259834();
    func_ov002_022ae9c0(obj, 0);
    v = data_ov002_022d0f2c.f_d4;
    if (v < 8) {
        v = 8;
    }
    data_ov002_022d0f2c.f_d4 = v;
    obj->f38 = 4;
    obj->f40 = 1;
}
