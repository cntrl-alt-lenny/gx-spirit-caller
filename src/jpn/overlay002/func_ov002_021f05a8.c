/* func_ov002_021f05a8: require func_ov002_021c1e10, then delegate to
 * func_ov002_021f05dc (all three args forwarded). */
extern int func_ov002_021c1e10(void *self, int player, int idx);
extern int func_ov002_021f05dc(void *self, int player, int idx);
int func_ov002_021f05a8(void *self, int player, int idx) {
    if (func_ov002_021c1e10(self, player, idx) == 0)
        return 0;
    return func_ov002_021f05dc(self, player, idx);
}
