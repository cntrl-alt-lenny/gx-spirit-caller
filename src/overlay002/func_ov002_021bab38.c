struct Rec { unsigned int id : 13; unsigned int flag13 : 1; unsigned int mid : 8; unsigned int hi : 8; };

extern void func_ov002_021b229c(struct Rec *p);
extern void func_ov002_021b27a4(int v);
extern void func_ov002_021b9254(int a0, int kind, struct Rec *p, int hi, int lo);
extern void func_ov002_021b9368(int a0, int kind, struct Rec *p, int lo);
extern void func_ov002_021ba11c(int a0, struct Rec *p);
extern void func_ov002_021ba1a0(int a0, struct Rec *p);
extern void func_ov002_021ba1e8(int a0, struct Rec *p);
extern void func_ov002_021c2a40(struct Rec *p);
extern void func_ov002_021c2abc(struct Rec *p, int v);
extern void func_ov002_021c3754(int a0, struct Rec *p);

void func_ov002_021bab38(int arg0, int kind, int v, struct Rec *p) {
    switch (kind) {
    case 12:
        func_ov002_021ba1e8(arg0, p);
        break;
    case 13:
        if (v != 0)
            func_ov002_021ba1a0(arg0, p);
        else
            func_ov002_021ba11c(arg0, p);
        break;
    case 14:
        func_ov002_021c2a40(p);
        break;
    case 15:
        func_ov002_021c2abc(p, v);
        break;
    case 11:
        func_ov002_021c3754(arg0, p);
        break;
    case 16:
        break;
    default:
        if (kind < 5)
            func_ov002_021b9254(arg0, kind, p, ((unsigned short)v >> 8) & 0xff, v & 0xff);
        else
            func_ov002_021b9368(arg0, kind, p, v & 0xff);
        break;
    }
    if (kind != 11 && kind != 12 && kind != 13)
        return;
    func_ov002_021b229c(p);
    func_ov002_021b27a4(p->hi * 2 + p->flag13);
}
