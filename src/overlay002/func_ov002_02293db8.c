typedef unsigned short u16;

typedef struct {
    u16 pad;
    u16 side : 1;
    u16 idx : 5;
} Ent;

typedef struct {
    u16 flag;
    char rest[0x12];
} Row;

extern Row data_ov002_022cf1a4[];
extern int func_ov002_02280980(int side);

int func_ov002_02293db8(Ent *p)
{
    int r;
    int ret;

    if (p->idx >= 10) {
        return 0;
    }
    if (func_ov002_02280980(p->side) > 0) {
        return 0;
    }
    ((Row *)((char *)data_ov002_022cf1a4 + (p->side & 1) * 0x868))[p->idx].flag = 1;
    r = func_ov002_02280980(p->side);
    ((Row *)((char *)data_ov002_022cf1a4 + (p->side & 1) * 0x868))[p->idx].flag = 0;
    ret = 0;
    if (r > 0) {
        ret = 1;
    }
    return ret;
}
