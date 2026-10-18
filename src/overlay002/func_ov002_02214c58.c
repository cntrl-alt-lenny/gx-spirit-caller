extern int func_ov002_0223df38(void *self, int flag, int *outPtr);
extern int func_ov002_0223de94(void *node, int idx);
extern int func_ov002_021d6808(void *self, int a, int b, int c, int d);

int func_ov002_02214c58(void *self) {
    if (func_ov002_0223df38(self, 0, 0) != 0) {
        int v = func_ov002_0223de94(self, 0);
        func_ov002_021d6808(self, v & 0xff, ((unsigned short)v >> 8) & 0xff, 0, 0);
    }
    return 0;
}
