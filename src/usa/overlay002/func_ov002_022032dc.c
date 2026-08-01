/* func_ov002_022032dc: requires func_ov002_021bb82c(a0's bit0 flag, 0x1433)
 * or 0x1434 to succeed, then requires bit 17 of data_ov002_022cf1a8[flag]
 * (0x868-stride) to be clear, then returns whether
 * func_ov002_021b3dec(flag, 11, 0x12f3) reports success (0). */
typedef struct {
    char           pad0[2];
    unsigned short flag0 : 1;
    unsigned short       : 15;
} Card022033cc;

extern int func_ov002_021bb82c(int flag, int id);
extern int func_ov002_021b3dec(int flag, int count, int id);
extern char data_ov002_022cf1a8[];

int func_ov002_022032dc(Card022033cc *a0)
{
    if (func_ov002_021bb82c(a0->flag0, 0x1433) == 0) {
        if (func_ov002_021bb82c(a0->flag0, 0x1434) == 0) {
            goto return_zero;
        }
    }

    if ((*(unsigned int *)(data_ov002_022cf1a8 + (a0->flag0 & 1) * 0x868) >> 17) & 1) {
        return 0;
    }

    return func_ov002_021b3dec(a0->flag0, 11, 0x12f3) == 0;

return_zero:
    return 0;
}
