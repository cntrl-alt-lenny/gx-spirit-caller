typedef struct {
    unsigned int field0 : 13;
    unsigned int pad13 : 1;
    unsigned int bit14 : 1;
    unsigned int pad15 : 17;
} S021b9ba0;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern unsigned int func_0202b8a8(int id);
extern int func_0202e8ec(int id);
extern int func_0202e234(int x);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_021b9ba0(S021b9ba0 *p);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02252e54(int player, int arg1, unsigned int packed) {
    int other = (unsigned short)(packed >> 16);
    int id = (unsigned short)packed;
    int level = (int)func_0202b8a8(id);
    int type = func_0202e8ec(id);
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)(data_ov002_022cf180 + (other & 1) * 0x868);
    if (cnt > idx) {
        int card;
        S021b9ba0 *row = (S021b9ba0 *)(data_ov002_022cf16c + (other & 1) * 0x868 + 0x418);
        S021b9ba0 *own = (S021b9ba0 *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x418);
        char *base = data_ov002_022cf16c + (other & 1) * 0x868;
        do {
            card = row->field0;
            if (func_0202e234(card) != 0 && (int)func_0202b8a8(card) < level && type == func_0202e8ec(card) && func_ov002_021ca3f0(player, card) != 0 && func_ov002_021b9ba0(own) != 0)
                func_ov002_02253458(other, 14, idx);
            idx++;
            row++;
            own++;
        } while (idx < *(unsigned int *)(base + 0x14));
    }
}



