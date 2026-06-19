/* func_ov002_0220e058: global-check + helper-tail. */
struct F0220e148Pool {
    char pad[0xcf8];
    int fcf8;
};

extern struct F0220e148Pool data_ov002_022d008c;
extern int func_ov002_021ff410(void *self, int arg);

int func_ov002_0220e058(void *self, int arg) {
    if (data_ov002_022d008c.fcf8 != 5) return 0;
    return func_ov002_021ff410(self, arg);
}
