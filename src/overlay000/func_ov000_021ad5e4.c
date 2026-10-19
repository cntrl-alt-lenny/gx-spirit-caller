extern void func_ov000_021ad540(int idx, int a1, int a2, int a3, int a4, int a5);
struct Command {
    unsigned pad0 : 3;
    unsigned mode : 4;
    unsigned x : 9;
    unsigned y : 9;
    unsigned pad1 : 7;
    unsigned pad2 : 16;
    unsigned idx : 8;
    unsigned pad3 : 8;
};
int func_ov000_021ad5e4(struct Command *p) {
    int pos[2];
    int flag = 0;
    pos[0] = p->x << 12;
    pos[1] = p->y << 12;
    if (p->mode == 1)
        flag = 1;
    func_ov000_021ad540(p->idx, flag, 0, 16, (int)pos, 1);
    return 0;
}
