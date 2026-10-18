typedef unsigned short u16;

struct Self {
    char _pad0[4];
    struct {
        u16 b0 : 1;
        u16 b1 : 1;
        u16 flag : 1;
    } f4;
};

extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223df38(void *self, int i, int *out);
extern int func_ov002_0223de94(void *self, int idx);
extern int func_ov002_021d6808(void *self, int a, int b, int c, int d);
extern int func_ov002_021d63fc(void *self, int a, int b, int c);

int func_ov002_022241b8(struct Self *self) {
    if (self->f4.flag)
        return 0;
    if (func_ov002_0223df38(self, 0, 0) != 0) {
        int r = func_ov002_0223de94(self, 0);
        int player = r & 0xff;
        u16 v = r;
        unsigned char idx = (int)v >> 8;
        int off = (player & 1) * 0x868;
        int rec = (short)idx * 20;
        if (*(u16 *)(data_ov002_022cf1a4 + off + rec) == 0) {
            if (*(u16 *)(data_ov002_022cf1a2 + off + rec) != 0)
                func_ov002_021d6808(self, player, idx, 1, 1);
            else
                func_ov002_021d63fc(self, player, idx, 1);
        }
    }
    return 0;
}
