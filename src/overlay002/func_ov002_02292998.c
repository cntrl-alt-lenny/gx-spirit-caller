typedef struct { unsigned short pad0; unsigned short side : 1; } S;
extern char data_ov002_022cf288[];
extern int func_ov002_02257ab8(S *p, int side);
extern int func_ov002_0228c460(int side);
extern int func_ov002_021bbf50(int side);
extern int func_ov002_02280980(int side);

int func_ov002_02292998(S *p) {
    unsigned int side = p->side;
    if ((*(unsigned int *)(data_ov002_022cf288 + (side & 1) * 0x868) >> 17) & 1) {
        return 0;
    }
    if (func_ov002_02257ab8(p, 1 - side) == 0) {
        return 0;
    }
    if (func_ov002_0228c460(p->side) != 0) {
        return 1;
    }
    if (func_ov002_021bbf50(p->side) == 0) {
        if (func_ov002_021bbf50(1 - p->side) >= 2) {
            return 1;
        }
    }
    return func_ov002_02280980(p->side) < -2;
}
