typedef struct {
    unsigned int field0 : 13;
    unsigned int pad13 : 1;
    unsigned int bit14 : 1;
    unsigned int pad15 : 17;
} S021b9ba0;
extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_0202eab0(int unused0);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_021b9ba0(S021b9ba0 *p);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_022503d8(int player) {
    int b0 = player & 1;
    unsigned int i = 0;
    if (*(unsigned int *)((char *)data_ov002_022cf180 + b0 * 0x868) > i) {
        S021b9ba0 *row = (S021b9ba0 *)(data_ov002_022cf16c + b0 * 0x868 + 0x418);
        char *base = data_ov002_022cf16c + b0 * 0x868;
        do {
            int id = row->field0;
            if (func_0202e234(id) != 0 && func_0202eab0(id) != 0 &&
                func_ov002_021ca3f0(player, id) != 0 && func_ov002_021b9ba0(row) != 0) {
                func_ov002_02253458(player, 14, i);
            }
            i++;
            row++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
}


