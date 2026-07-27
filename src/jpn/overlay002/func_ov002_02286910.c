/* func_ov002_02286910: data_ov002_022cd314[0] and [1] must differ. Then
 * BOTH per-player u16 lookups in data_ov002_022cf0c2 (keyed by
 * [0]&1,[7]*20 and [1]&1,[8]*20 respectively) matter: the first must be 0,
 * and the result is whether the second is also 0. */
extern int data_ov002_022cd314[];
extern unsigned short data_ov002_022cf0c2[];

int func_ov002_02286910(void) {
    int p0 = data_ov002_022cd314[0];
    int p1 = data_ov002_022cd314[1];

    if (p0 == p1)
        return 0;

    {
        unsigned short v1 = *(unsigned short *)((char *)data_ov002_022cf0c2 + (p0 & 1) * 0x868 + data_ov002_022cd314[7] * 20);
        if (v1 != 0)
            return 0;
    }
    {
        unsigned short v2 = *(unsigned short *)((char *)data_ov002_022cf0c2 + (p1 & 1) * 0x868 + data_ov002_022cd314[8] * 20);
        return v2 == 0;
    }
}
