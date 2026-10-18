struct Obj {
    unsigned short pad;
    unsigned short side : 1;
    unsigned short rest : 15;
};

extern char data_ov002_022cf16c[];
extern int func_ov002_022577dc(void *p);
extern int func_ov002_021bbf50(int a);
extern int func_ov002_0227d660(int a, int b);

int func_ov002_02295824(struct Obj *p)
{
    int side = p->side;
    int n = func_ov002_022577dc(p);
    if (*(int *)(data_ov002_022cf16c + ((1 - side) & 1) * 0x868) <= n * 700) {
        return 1;
    }
    if (func_ov002_021bbf50(side) > 1) {
        if (func_ov002_0227d660(p->side, 0) >= 0) {
            return 1;
        }
    }
    return 0;
}
