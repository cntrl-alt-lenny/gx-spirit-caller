/* func_ov002_0220e148: global-check + helper-tail. */
struct F0220e148Pool {
    char pad[0xcf8];
    int fcf8;
};

extern struct F0220e148Pool data_ov002_022d016c;
extern int func_ov002_021ff500(void *self, int arg);

int func_ov002_0220e148(void *self, int arg) {
    if (data_ov002_022d016c.fcf8 != 5) return 0;
    return func_ov002_021ff500(self, arg);
}
