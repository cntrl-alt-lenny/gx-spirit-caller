/* func_ov002_021e77fc: 0x868 sub-row accessor wrapper (Cluster A). Guards on
 * the opponent check (player must differ from self->b0), idx range, and the
 * sub-row's f30 id, then forwards (self, player, idx) to func_ov002_021c1ef0.
 * Canonical brief-282 signature: forwarding the args keeps them in r0-r2 so
 * the row temp colours r2+ (gotcha 26); f30 is a 13-bit bitfield (gotcha 25). */

struct self_t { char _pad[2]; unsigned short b0 : 1; unsigned short _r : 15; };
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern int func_ov002_021c1ef0(struct self_t *self, int player, int idx);

int func_ov002_021e77fc(struct self_t *self, int player, int idx) {
    struct subrow *sr;
    if (player == self->b0)
        return 0;
    if (idx >= 5)
        return 0;
    sr = (struct subrow *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    return func_ov002_021c1ef0(self, player, idx) != 0;
}
