typedef unsigned char u8;
typedef unsigned short u16;
struct Node { u16 id; u16 side:1; u16 slot:5; u16 rest:10; u16 pad:2; u16 skip:1; };
struct Row { unsigned id:13; unsigned rest:19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021bd030(int self);
extern int func_ov002_021decac(int a, int b, int c);
extern int func_ov002_021ded54(int arg0, int arg1, int arg2, int arg3, int arg4);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021d5d58(int a, int b, int c, int d);
int func_ov002_022140cc(struct Node *self) {
    int packed;
    int player, idx, target, other;
    int sideOff, slotOff;
    if (self->skip) return 0;
    if (func_ov002_0223df38(self, 0, &packed)) {
        player = (u8)packed;
        idx = (u8)((u16)packed >> 8);
        if (func_ov002_0225764c((int)self, player, idx)) {
            target = func_ov002_021bd030(self->side);
            sideOff = (self->side & 1) * 0x868;
            slotOff = self->slot * 20;
            if (((struct Row *)((int)(data_ov002_022cf16c + sideOff) + slotOff + 0x30))->id &&
                *(u16 *)(data_ov002_022cf1a4 + sideOff + slotOff) && target >= 0) {
                other = 1 - player;
                func_ov002_021ded54((int)self, player, idx, other, target);
                if (self->id == 0x15d8) {
                    func_ov002_021d5d58(self->side, (u16)((u8)self->side | ((u8)target << 8)), (u16)((u8)self->side | ((u8)self->slot << 8)), 10);
                } else {
                    func_ov002_021e2d94(other, target, 9, 1);
                    func_ov002_021d5d58(self->side, (u16)((u8)self->side | ((u8)target << 8)), (u16)((u8)self->side | ((u8)self->slot << 8)), 13);
                }
            } else {
                func_ov002_021decac((int)self, player, idx);
            }
        }
    }
    return 0;
}

