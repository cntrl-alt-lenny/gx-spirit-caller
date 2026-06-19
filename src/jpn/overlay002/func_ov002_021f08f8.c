/* func_ov002_021f08f8: 0x868 accessor wrapper — guard sub-row f30, opponent
 * (player != self->b0), idx, then forward to func_ov002_021c1e10. */
struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };
extern char data_ov002_022cf08c[];
extern int func_ov002_021c1e10(struct self_t *self, int player, int idx);
int func_ov002_021f08f8(struct self_t *self, int player, int idx) {
    struct subrow *sr = (struct subrow *)(data_ov002_022cf08c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (player != self->b0)
        return 0;
    if (idx >= 5)
        return 0;
    return func_ov002_021c1e10(self, player, idx) != 0;
}
