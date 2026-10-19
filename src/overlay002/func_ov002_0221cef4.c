typedef unsigned short u16;
struct node;
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct node *, int, int *);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_0226b204(unsigned int arg);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern int data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
struct bits { unsigned int id:13; unsigned int rest:19; };
int func_ov002_0221cef4(struct node *self) {
    int lo, hi;
    unsigned int packed;
    int player, slot;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (*(unsigned int *)(data_ov002_022d016c + 0xd0) & 1) return 0;
        if (!((*(unsigned int *)(data_ov002_022d016c + 0xd0) >> 1) & 1)) return 0;
        if (func_ov002_0223df38(self, 0, 0)) {
            packed = func_ov002_0223de94(self, 0);
            lo = packed & 0xff;
            hi = ((u16)packed >> 8) & 0xff;
            if (func_ov002_0225764c((int)self, lo, hi)) {
                player = data_ov002_022cd3f4[0];
                slot = data_ov002_022cd3f4[7];
                if (((struct bits *)(data_ov002_022cf16c + (player & 1) * 0x868 + slot * 20 + 0x30))->id) {
                    func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0x19), (u16)slot, (u16)hi, (u16)lo);
                    return 0x7f;
                }
            }
        }
        return 0;
    case 0x7f:
        func_ov002_0226b204(1);
        return 0;
    default:
        return 0;
    }
}
