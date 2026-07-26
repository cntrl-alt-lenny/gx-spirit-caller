struct Ov002Chain { unsigned short id; unsigned short flags4 : 4; unsigned short : 12; unsigned short unk4; unsigned short next; };

extern struct Ov002Chain data_ov002_022d0650[];
extern void func_ov002_021b1d84(int idx);

void func_ov002_021b20cc(int idx, int id, int flag) {
    if (idx == 0) return;
    do {
        struct Ov002Chain *e = &data_ov002_022d0650[idx];
        unsigned flags4 = e->flags4;
        int next = e->next;
        if (flags4 >= 6 && e->id == id) {
            func_ov002_021b1d84(idx);
            if (flag == 0) return;
        }
        idx = next;
    } while (idx != 0);
}
