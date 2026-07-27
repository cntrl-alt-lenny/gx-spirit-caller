/* func_ov002_0228db98 -- ov002 class D: mla index + lsr/tst bit test, small leaf.
 * 2D table: [parity*0x868 + idx*0x14], base = data_ov002_022cf1ac */
extern unsigned char data_ov002_022cf1ac[];

int func_ov002_0228db98(unsigned int a0, int idx)
{
    unsigned char *base = data_ov002_022cf1ac + (a0 & 1) * 0x868;
    unsigned int w = *(unsigned int *)(base + idx * 0x14);
    if ((w >> 8) & 1) return 0;
    return (idx <= 4 ? 1 : 0) + 1;
}
