/* func_ov002_021f192c: 0x868 accessor wrapper — opponent + f30 guards, then
 * report whether func_ov002_021c1e44 is clear. */
struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c1e44(struct self_t *self, int player, int idx);
int func_ov002_021f192c(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (player == self->b0)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
