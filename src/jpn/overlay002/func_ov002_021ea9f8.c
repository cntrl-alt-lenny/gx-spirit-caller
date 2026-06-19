/* func_ov002_021ea9f8: 0x868 accessor wrapper — proceed only if the cf1a4
 * sub-row field is clear and the adjacent cf1a2 field is set, then forward to
 * func_ov002_021c1e10. */
extern unsigned short data_ov002_022cf0c4[];
extern unsigned short data_ov002_022cf0c2[];
extern int func_ov002_021c1e10(void *self, int player, int idx);
int func_ov002_021ea9f8(void *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf0c4 + (player & 1) * 0x868 + idx * 20) != 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf0c2 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    return func_ov002_021c1e10(self, player, idx) != 0;
}
