extern int func_ov002_0223df38(void *self, int a, int b);
extern int func_ov002_0223de94(void *self, int idx);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021d6808(void *self, int player, int idx, int arg3, int arg4);
extern unsigned short data_ov002_022cf1a2[];
extern unsigned short data_ov002_022cf1a4[];

int func_ov002_02233f78(void *self) {
    if (func_ov002_0223df38(self, 0, 0) != 0) {
        int r = func_ov002_0223de94(self, 0);
        int p = r & 0xff;
        int i = ((unsigned short)r >> 8) & 0xff;
        if (func_ov002_0225764c(self, p, i) != 0) {
            int off = (p & 1) * 0x868;
            if (*(unsigned short *)((char *)data_ov002_022cf1a4 + off + i * 0x14) == 0
                && *(unsigned short *)((char *)data_ov002_022cf1a2 + off + i * 0x14) != 0) {
                func_ov002_021d6808(self, p, i, 1, 2);
            } else {
                func_ov002_021d6808(self, p, i, 0, 0);
            }
        }
    }
    return 0;
}
