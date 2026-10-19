extern int func_ov002_021b9ecc(int a, int b);
extern int func_02030ea4(int a);
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021b4054(int arg0, int arg1, int arg2, int arg3);
extern int func_0202e234(int x);
extern int data_ov002_022cf1a8[];
int func_ov002_021b9bd4(int player, int idx) {
    int id = func_ov002_021b9ecc(player, idx);
    int limit = func_02030ea4(id);
    if (limit != 0) {
        switch (id) {
        case 0xfee: {
            int pair = func_ov002_021b3618(player, idx);
            if (pair == 0xffff) return -1;
            if (func_ov002_021b9ecc((unsigned char)pair, (unsigned char)((unsigned short)pair >> 8)) != 0x10bc) return -1;
            break;
        }
        case 0x14ac:
            if (func_ov002_021b3618(player, idx) == 0xffff) return -1;
            break;
        case 0x1a7e:
            if (func_ov002_021b4054(player, idx, id, 1) == 0) return -1;
            break;
        }
        {
            int *base = (int *)((char *)data_ov002_022cf1a8 + (player & 1) * 0x868);
            int offset = idx * 20;
            if (limit <= (unsigned short)*(int *)((char *)base + offset)) return -1;
            if (func_0202e234(id) == 0 || id == 0xfee) {
                if (idx < 5) return -1;
            } else {
                if (idx >= 5) return -1;
            }
            return (unsigned short)*(int *)((char *)base + offset);
        }
    }
    return -1;
}
