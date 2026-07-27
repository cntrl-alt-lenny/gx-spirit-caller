/* func_ov002_02208f00: gate on data_ov002_022cd3f4.f_8 == 0, then require
 * BOTH the per-(f_4&1, f_20) u16 in data_ov002_022cf1a4 AND the same slot
 * in data_ov002_022cf1a2 to be nonzero. */
typedef struct {
    int f_0, f_4, f_8, f_c, f_10, f_14, f_18, f_1c, f_20;
} S02208f00Cd3f4;

extern S02208f00Cd3f4 data_ov002_022cd3f4;
extern unsigned short data_ov002_022cf1a4[];
extern unsigned short data_ov002_022cf1a2[];

int func_ov002_02208f00(void) {
    int player, idx;
    unsigned short v1, v2;

    if (data_ov002_022cd3f4.f_8 != 0)
        return 0;

    player = data_ov002_022cd3f4.f_4 & 1;
    idx = data_ov002_022cd3f4.f_20;

    v1 = *(unsigned short *)((char *)data_ov002_022cf1a4 + player * 0x868 + idx * 20);
    if (v1 == 0)
        return 0;

    v2 = *(unsigned short *)((char *)data_ov002_022cf1a2 + player * 0x868 + idx * 20);
    return v2 != 0;
}
