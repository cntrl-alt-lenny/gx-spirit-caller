/* func_ov002_021f1bf0: f30 guard, require func_ov002_021c1e10, then report
 * whether func_ov002_021c1d64 is clear (sibling of func_ov002_021e9954 w/o the
 * idx guard). */
struct subrow { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };
extern char data_ov002_022cf08c[];
extern int func_ov002_021c1e10(void *self, int player, int idx);
extern int func_ov002_021c1d64(void *self, int player, int idx);
int func_ov002_021f1bf0(void *self, int player, int idx) {
    struct subrow *sr = (struct subrow *)(data_ov002_022cf08c + (player & 1) * 0x868 + idx * 20);
    if (sr->f30 == 0)
        return 0;
    if (func_ov002_021c1e10(self, player, idx) == 0)
        return 0;
    return func_ov002_021c1d64(self, player, idx) == 0;
}
