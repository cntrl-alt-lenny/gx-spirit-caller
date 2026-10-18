typedef struct { unsigned int id : 13; unsigned int rest : 19; } Obj;

extern int func_ov002_021b41e8(Obj *p, int v);
extern int func_ov002_021bd85c(int a, int b);

int func_ov002_021ba0b0(Obj *p) {
    int v = p->id;
    switch (v) {
    case 0x1a74:
        v = func_ov002_021b41e8(p, v);
        if (v == -1 || func_ov002_021bd85c(v, -1) != 0) {
            return 0x1a74;
        }
        break;
    }
    return v;
}
