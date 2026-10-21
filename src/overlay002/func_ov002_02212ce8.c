struct Node;
struct Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_021d6714(int arg0, int arg1, int arg2);
extern int func_ov002_021df708(int arg0, int arg1);
extern int func_ov002_021e2b1c(int arg0);
int func_ov002_02212ce8(struct Node *self) {
    int local;
    if (func_ov002_0223df38(self, 0, &local)) {
        int hi = (int)(unsigned short)local >> 8;
        int side = local & 0xff;
        int slot = hi & 0xff;
        if (func_ov002_0225764c((int)self, side, slot)) {
            func_ov002_021d6714(side, slot, 1);
            func_ov002_021df708(side, ((struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + slot * 20 + 0x30))->id);
            func_ov002_021e2b1c(30);
            func_ov002_021d6714(side, slot, 0);
        }
    }
    return 0;
}
