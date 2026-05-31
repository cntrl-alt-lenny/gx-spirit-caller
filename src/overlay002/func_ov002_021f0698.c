/* func_ov002_021f0698: require func_ov002_021c1ef0, then delegate to
 * func_ov002_021f06cc (all three args forwarded). */
extern int func_ov002_021c1ef0(void *self, int player, int idx);
extern int func_ov002_021f06cc(void *self, int player, int idx);
int func_ov002_021f0698(void *self, int player, int idx) {
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    return func_ov002_021f06cc(self, player, idx);
}
