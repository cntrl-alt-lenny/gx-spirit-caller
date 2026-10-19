struct Ov002Self;
struct Slot { unsigned int id : 13; unsigned int rest : 19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223df38(struct Ov002Self *, int, int *);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021de4d8(struct Ov002Self *self, int player, int idx);
extern void func_ov002_021d6714(int arg0, int arg1, int arg2);
extern int func_ov002_021df708(int arg0, int arg1);
extern int func_ov002_021e2b1c(int arg0);
int func_ov002_022115cc(struct Ov002Self *self) {
    int packed;
    int player, idx;
    int id;
    int sideoff, slotoff;
    if (func_ov002_0223df38(self, 0, &packed)) {
        player = (unsigned char)packed;
        idx = (unsigned char)((unsigned short)packed >> 8);
        sideoff = (player & 1) * 0x868;
        slotoff = idx * 20;
        id = ((struct Slot *)((int)(data_ov002_022cf16c + sideoff) + slotoff + 0x30))->id;
        if (id) {
            if (*(unsigned short *)(data_ov002_022cf1a4 + sideoff + slotoff)) {
                if (func_ov002_0225764c((int)self, player, idx))
                    func_ov002_021de4d8(self, player, idx);
                return 0;
            }
            func_ov002_021d6714(player, idx, 1);
            func_ov002_021df708(player, id);
            func_ov002_021e2b1c(30);
            *(unsigned short *)(data_ov002_022cf1a4 + sideoff + slotoff) = 1;
            id = func_ov002_0225764c((int)self, player, idx);
            *(unsigned short *)(data_ov002_022cf1a4 + sideoff + slotoff) = 0;
            if (id) {
                if (func_ov002_021de4d8(self, player, idx))
                    return 0;
            }
            func_ov002_021d6714(player, idx, 0);
        }
    }
    return 0;
}





