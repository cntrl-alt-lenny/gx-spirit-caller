typedef unsigned short u16;
typedef unsigned char u8;
struct Node { u16 id; u16 side:1; u16 rest:15; };
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern void func_ov002_0226b11c(int unused0, int unused1);
extern char data_ov002_022d016c[];
int func_ov002_02216dd0(struct Node *self) {
    int out;
    if (func_ov002_0223df38(self, 0, &out) != 0) {
        int lo = out & 0xff;
        int hi = ((int)(u16)out >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, lo, hi) != 0) {
            int flag = 0;
            if (self->id == 0x13b0) {
                if (*(int *)(data_ov002_022d016c + 0xcec) != self->side) flag = 1;
            }
            func_ov002_021d59cc(lo, hi, self->id, (u16)(((u8)(flag & 0xf) << 4) | 1), self->side);
            func_ov002_0226b11c(lo, hi);
        }
    }
    return 0;
}

