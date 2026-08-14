/* func_ov002_021f19e8: resolve an id via func_ov002_021b9ecc(player,idx),
 * guard on the per-player d0650-style head table (cf1a4, stride 0x868/20),
 * feed the id through func_ov002_021b7bb8 and func_0202e234; the
 * func_0202e234 result must agree with (idx < 5) to continue, then a
 * chain of self/player/idx gate checks (021c1ef0, 021c1e44, 021c2084).
 */
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_021b7bb8(int id);
extern int func_0202e234(int id);
extern int func_ov002_021c1ef0(void *self, int player, int idx);
extern int func_ov002_021c1e44(void *self, int player, int idx);
extern int func_ov002_021c2084(void *self, int player, int idx, int d);
extern char data_ov002_022cf1a4[];

int func_ov002_021f19e8(void *self, int player, int idx) {
    int id = func_ov002_021b9ecc(player, idx);

    if (id == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    if (func_ov002_021b7bb8(id) == 0)
        return 0;

    if (func_0202e234(id) != 0) {
        if (idx >= 5)
            return 0;
    } else {
        if (idx < 5)
            return 0;
    }

    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;

    return func_ov002_021c2084(self, player, idx, 1) != 0;
}
