/* func_ov002_02204a78: leaf guard chain (no calls) over data_ov002_022cd314
 * fields: bail if f_8 nonzero; else look up two per-player u16 tables at
 * (f_4&1)*0x868 + f_20*20 and report whether the second is nonzero (only
 * after confirming the first IS zero). */
extern char data_ov002_022cd314[];
extern char data_ov002_022cf0c4[];
extern char data_ov002_022cf0c2[];
#define CD3F4_I(off) (*(int *)(data_ov002_022cd314 + (off)))

int func_ov002_02204a78(void) {
    int idx;
    int stride;
    if (CD3F4_I(0x8) != 0)
        return 0;
    idx = (CD3F4_I(0x4) & 1) * 0x868;
    stride = CD3F4_I(0x20) * 20;
    if (*(unsigned short *)(data_ov002_022cf0c4 + idx + stride) != 0)
        return 0;
    return *(unsigned short *)(data_ov002_022cf0c2 + idx + stride) != 0;
}
