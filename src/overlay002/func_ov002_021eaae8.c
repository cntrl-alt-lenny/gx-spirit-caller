/* func_ov002_021eaae8: 0x868 accessor wrapper — proceed only if the cf1a4
 * sub-row field is clear and the adjacent cf1a2 field is set, then forward to
 * func_ov002_021c1ef0. */
extern unsigned short data_ov002_022cf1a4[];
extern unsigned short data_ov002_022cf1a2[];
extern int func_ov002_021c1ef0(void *self, int player, int idx);
int func_ov002_021eaae8(void *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) != 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a2 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    return func_ov002_021c1ef0(self, player, idx) != 0;
}
