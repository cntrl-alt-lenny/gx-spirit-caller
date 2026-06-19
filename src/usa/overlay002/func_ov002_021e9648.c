/* func_ov002_021e9648: idx + f30 guards, require func_ov002_021c1fa4(...,1),
 * then report whether func_ov002_021c1e10 holds. */
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };
extern char data_ov002_022cf08c[];
extern int func_ov002_021c1fa4(void *self, int player, int idx, int d);
extern int func_ov002_021c1e10(void *self, int player, int idx);
int func_ov002_021e9648(void *self, int player, int idx) {
    struct subrow *sr;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf08c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021c1fa4(self, player, idx, 1) == 0)
        return 0;
    return func_ov002_021c1e10(self, player, idx) != 0;
}
