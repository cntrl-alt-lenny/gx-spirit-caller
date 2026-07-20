/* Ov013_SetBlendAlpha: program both engines' BLDALPHA (0x4000014 / 0x4001014)
 * from the current fade levels — EVA in bits [8:0] from data_ov013_021cbb20[0x178]
 * and EVB in bits [24:16] from [0x17c], each a .12 fixed-point value rounded down
 * to its 9-bit field. (ov013_core.h) */
extern char data_ov013_021cbb20[];
void Ov013_SetBlendAlpha(void) {
    int evb = *(int *)(data_ov013_021cbb20 + 0x17c) >> 12;
    int eva = *(int *)(data_ov013_021cbb20 + 0x178) >> 12;
    int v = (eva & 0x1ff) | ((evb << 16) & (0x1ff << 16));
    volatile int *reg = (volatile int *)0x4000014;
    *reg = v;
    *(volatile int *)((char *)reg + 0x1000) = v;
}
