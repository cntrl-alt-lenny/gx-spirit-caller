/* func_ov002_021e8a18: require func_ov002_021e797c == 1, then report whether
 * func_ov002_021c1ef0 holds. */
extern int func_ov002_021e797c(void *self, int player, int idx);
extern int func_ov002_021c1ef0(void *self, int player, int idx);
int func_ov002_021e8a18(void *self, int player, int idx) {
    if (func_ov002_021e797c(self, player, idx) != 1)
        return 0;
    return func_ov002_021c1ef0(self, player, idx) != 0;
}
