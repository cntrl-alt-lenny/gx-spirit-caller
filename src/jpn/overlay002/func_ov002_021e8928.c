/* func_ov002_021e8928: require func_ov002_021e788c == 1, then report whether
 * func_ov002_021c1e10 holds. */
extern int func_ov002_021e788c(void *self, int player, int idx);
extern int func_ov002_021c1e10(void *self, int player, int idx);
int func_ov002_021e8928(void *self, int player, int idx) {
    if (func_ov002_021e788c(self, player, idx) != 1)
        return 0;
    return func_ov002_021c1e10(self, player, idx) != 0;
}
