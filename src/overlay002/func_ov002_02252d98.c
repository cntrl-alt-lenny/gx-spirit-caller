struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];
extern unsigned int func_0202b8a8(int id);
extern int func_02031684(int x);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_02030b84(int a0);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_02252d98(int player) {
    int b0 = player & 1;
    unsigned int idx = 0;
    unsigned int cnt = *(unsigned int *)(data_ov002_022cf184 + b0 * 0x868);
    if (cnt > idx) {
        struct Ov002Slot *row = (struct Ov002Slot *)(data_ov002_022cf16c + b0 * 0x868 + 0x3a0);
        char *base = data_ov002_022cf16c + b0 * 0x868;
        do {
            int id = row->id;
            if ((int)func_0202b8a8(id) <= 5 && func_02031684(id) != 0 && func_ov002_021ca3f0(player, id) != 0 && func_02030b84(id) != 0) {
                func_ov002_02253458(player, 12, idx);
            }
            idx++;
            row++;
        } while (idx < *(unsigned int *)(base + 0x18));
    }
}
