/* func_ov002_021f11f4: guard on func_ov002_021e7868(ptr) and the per-
 * (player,idx) u16 in data_ov002_022cf1a4, then forward the halfword at
 * *ptr through func_0202b890 into func_ov002_021c93cc. */
typedef unsigned short u16;
extern u16 data_ov002_022cf1a4[];
extern int func_ov002_021e7868(void *ptr);
extern int func_0202b890(unsigned short v);
extern int func_ov002_021c93cc(int player, int idx, int val);

int func_ov002_021f11f4(void *ptr, int player, int idx) {
    u16 v;

    if (func_ov002_021e7868(ptr) == 0)
        return 0;

    v = *(u16 *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20);
    if (v == 0)
        return 0;

    return func_ov002_021c93cc(player, idx, func_0202b890(*(u16 *)ptr)) != 0;
}
