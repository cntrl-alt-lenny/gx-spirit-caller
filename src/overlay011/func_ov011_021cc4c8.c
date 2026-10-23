typedef struct {
    unsigned int flags : 3;
    unsigned int kind : 4;
    unsigned int x : 9;
    unsigned int y : 9;
    unsigned int rest : 7;
    unsigned int unk : 16;
    unsigned int idx : 8;
    signed int tag : 8;
} Entry;
extern void func_ov011_021cc424(int idx, int a1, int a2, int a3, void *p5, int p6);
extern unsigned int func_ov000_021ac760(void *p);
int func_ov011_021cc4c8(Entry *p) {
    int pos[2];
    unsigned short tag = p->tag;
    pos[0] = p->x << 12;
    pos[1] = p->y << 12;
    int special = 0;
    if (p->kind == 1) special = 1;
    if (special) {
        func_ov011_021cc424(p->idx, tag + 1, 2, 16, pos, 0);
    } else {
        func_ov011_021cc424(p->idx, tag, 2, 16, pos, 0);
    }
    if (func_ov000_021ac760(p)) {
        func_ov011_021cc424(((p->idx != 0) ? 1 : 0) + 5, -1, 2, 16, pos, 0);
    }
    return 0;
}


