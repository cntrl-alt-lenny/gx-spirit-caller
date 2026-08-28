struct Ce588Entry {
    unsigned short id;
    unsigned short _pad2;
    unsigned short _bit0 : 1;
    unsigned short bit1 : 1;
    unsigned short bit2 : 1;
    unsigned short bit3 : 1;
    unsigned short _rest : 12;
    char _pad6[18];
};

extern struct Ce588Entry data_ov002_022ce4a8[];
extern int IsValue12D3Or147E(int a0);

int func_ov002_0226a398(int unused0, int arg1) {
    int i = arg1 - 1;
    if (i >= 0) {
        struct Ce588Entry *e = &data_ov002_022ce4a8[i];
        do {
            if (IsValue12D3Or147E(e->id) == 0) {
                e->bit1 = 1;
                e->bit2 = e->bit1;
                e->bit3 = e->bit2;
            }
            e--;
            i--;
        } while (i >= 0);
    }
    return 1;
}
