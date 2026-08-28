/* func_ov002_021f18f8: resolve an id via func_ov002_021b9dec(player,idx),
 * guard on the per-player d0650-style head table (cf1a4, stride 0x868/20),
 * feed the id through func_ov002_021b7ad8 and func_0202e1e0; the
 * func_0202e1e0 result must agree with (idx < 5) to continue, then a
 * chain of self/player/idx gate checks (021c1ef0, 021c1e44, 021c2084).
 */
extern int func_ov002_021b9dec(int player, int idx);
extern int func_ov002_021b7ad8(int id);
extern int func_0202e1e0(int id);
extern int func_ov002_021c1e10(void *self, int player, int idx);
extern int func_ov002_021c1d64(void *self, int player, int idx);
extern int func_ov002_021c1fa4(void *self, int player, int idx, int d);
extern char data_ov002_022cf0c4[];

int func_ov002_021f18f8(void *self, int player, int idx) {
    int id = func_ov002_021b9dec(player, idx);

    if (id == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf0c4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    if (func_ov002_021b7ad8(id) == 0)
        return 0;

    if (func_0202e1e0(id) != 0) {
        if (idx >= 5)
            return 0;
    } else {
        if (idx < 5)
            return 0;
    }

    if (func_ov002_021c1e10(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c1d64(self, player, idx) != 0)
        return 0;

    return func_ov002_021c1fa4(self, player, idx, 1) != 0;
}
