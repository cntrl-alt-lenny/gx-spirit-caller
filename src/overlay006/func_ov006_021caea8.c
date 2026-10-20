extern void Task_InvokeLocked(void *p);
extern void *func_0201d738(void *self);
extern int func_0201d760(int arg);
extern void *func_0202be4c(int id);
extern int func_0208de4c(void);
extern int func_0208e0a0(void);
extern void func_0208f2a8(void);
extern void func_0208f2f4(void *a, int b, int n);
extern void func_0208f368(void);
extern void func_02092904(void *p, int n);
extern void func_02094688(const void *src, void *dst, int n);

int func_ov006_021caea8(char *self) {
    void *handle;
    int palette;
    int x, y, sx; int source;
    handle = func_0202be4c(0);
    palette = func_0201d760((int)handle);
    func_02092904((void *)palette, 0x200);
    func_0208f368();
    func_0208f2f4((void *)palette, 0x4400, 0x200);
    func_0208f2a8();
    Task_InvokeLocked(handle);
    handle = func_0202be4c(*(int *)(self + 0x20));
    source = (int)func_0201d738(handle);
    for (y = 0; y < 32; y++) {
        int sy = y - 1;
        if (sy >= 0 && sy < 32) {
            for (x = 0; x < 24; x++) {
                sx = x + 2;
                if (sx >= 0 && sx < 32) {
                    int dst = x % 8 + (func_0208de4c() + (x / 8 + y / 8 * 32 + 1) * 64 + y % 8 * 8);
                    int col = sx % 8;
                    int src = source + (sx / 8 + sy / 8 * 4) * 64 + sy % 8 * 8;
                    func_02094688((void *)(col + src),
                        (void *)dst, 1);
                }
            }
        }
    }
    Task_InvokeLocked(handle);
    { int mapx, mapy;
    for (mapy = 0; mapy < 4; mapy++) {
        for (mapx = 0; mapx < 3; mapx++) {
            unsigned short (*map)[32] = (unsigned short (*)[32])func_0208e0a0();
            map[mapy][mapx] = (mapx + mapy * 32 + 1) | 0x2000;
        }
    }
    }
    return 1;
}








