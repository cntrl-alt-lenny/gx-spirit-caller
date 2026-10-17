typedef struct {
    int state;
    int pad;
    int count;
} Obj;

extern void func_ov002_022a4a30(Obj *p);
extern void func_ov002_022a4ed8(Obj *p);
extern void func_ov002_022a51e0(Obj *p);

void func_ov002_022a5984(Obj *p) {
    switch (p->state) {
    case 4:
        func_ov002_022a4ed8(p);
        break;
    case 3:
        func_ov002_022a4a30(p);
        break;
    case 6:
    case 7:
    case 8:
    case 9:
        func_ov002_022a51e0(p);
        break;
    case 5:
    case 10:
        p->count++;
        break;
    }
}
