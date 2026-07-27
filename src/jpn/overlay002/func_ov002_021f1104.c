/* func_ov002_021f1104: guard on func_ov002_021e7778(ptr) and the per-
 * (player,idx) u16 in data_ov002_022cf0c4, then forward the halfword at
 * *ptr through func_0202b83c into func_ov002_021c92ec. */
typedef unsigned short u16;
extern u16 data_ov002_022cf0c4[];
extern int func_ov002_021e7778(void *ptr);
extern int func_0202b83c(unsigned short v);
extern int func_ov002_021c92ec(int player, int idx, int val);

int func_ov002_021f1104(void *ptr, int player, int idx) {
    u16 v;

    if (func_ov002_021e7778(ptr) == 0)
        return 0;

    v = *(u16 *)((char *)data_ov002_022cf0c4 + (player & 1) * 0x868 + idx * 20);
    if (v == 0)
        return 0;

    return func_ov002_021c92ec(player, idx, func_0202b83c(*(u16 *)ptr)) != 0;
}
