typedef unsigned int u32;

typedef struct {
    u32 pad0[5];
    u32 a : 14;
    u32 b : 1;
    u32 c : 2;
    u32 d : 1;
    u32 e : 14;
} Obj;

extern int func_ov002_022055fc(Obj *p);

int func_ov002_022056ac(Obj *p) {
    if (func_ov002_022055fc(p)) {
        if (p->d == 0) {
            return 0;
        }
        return p->b == 0;
    }
    return 0;
}
