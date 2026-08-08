/* func_ov002_02244b08: gate on arg1 != self->b0, then 5<=arg2<10, then
 * func_ov002_021bcfe4(arg1,arg2) nonzero. If self's high byte at +6 has a
 * count>0, scan self's u16 array at +8 for a byte-packed (arg1,arg2) match;
 * a hit returns 0, otherwise (or count<=0) returns 1. */
typedef struct {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short f4;
    unsigned short    : 8;
    unsigned short count : 8;
} SelfB08;

extern int func_ov002_021bcfe4(int a, int b);

int func_ov002_02244b08(SelfB08 *self, int arg1, int arg2) {
    int i, count;
    unsigned short packed;

    if (arg1 == self->b0)
        return 0;
    if (arg2 < 5 || arg2 >= 10)
        return 0;
    if (func_ov002_021bcfe4(arg1, arg2) == 0)
        return 0;

    i = 0;
    count = self->count;
    if (count <= 0)
        goto ret1;

    packed = (unsigned char)arg1;
    packed = packed | ((unsigned char)arg2 << 8);
    do {
        if (((unsigned short *)((char *)self + 8))[i] == packed)
            return 0;
        i++;
    } while (i < count);

ret1:
    return 1;
}
