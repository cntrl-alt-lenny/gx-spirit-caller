struct Obj {
    unsigned short id;
    unsigned short side : 1;
    unsigned short pad : 5;
    unsigned short kind : 6;
    unsigned short rest : 4;
};
extern char data_ov002_022ce288[];
extern char data_ov002_022cf288[];
extern char data_ov002_022cdc88[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021ca0d4(int arg0, int arg1);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02215cf4(struct Obj *p) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_021ca0d4(p->side, p->id) == 0) return 0;
        if (func_ov002_021bc618(p->side) == 0) return 0;
        if (p->kind != 0x23) {
            if ((*(unsigned int *)(data_ov002_022cf288 + (p->side & 1) * 0x868) >> 16) & 1) return 0;
        }
        if (func_ov002_0225368c(p->side, p->id, 0) != 0) return 0x7f;
        func_ov002_021ae400(p->side, 0xd);
        return 0x7e;
    case 0x7f:
        func_ov002_0227adb8(p->side, (int)data_ov002_022cdc88, 1, 0);
        return 0x7d;
    case 0x7e:
        func_ov002_0226b054(1 - p->side);
        return 0x7d;
    case 0x7d:
        func_ov002_021e286c(p->side);
        return 0x7c;
    }
    return 0;
}
