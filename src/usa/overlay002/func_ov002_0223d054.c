/* func_ov002_0223d054: self's packed u16 at +2 carries b0(bit0), idx
 * (bits[5:1]), mode (bits[13:12]). mode!=0 forwards to
 * func_ov002_021b3fb8(b0,idx,self->f0). mode==0 gates on
 * func_ov002_021bc538(b0) then a per-(b0&1)-row check of
 * data_ov002_022cf0a4/cf17c. */
typedef struct {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short idx : 5;
    unsigned short     : 6;
    unsigned short mode : 2;
    unsigned short      : 2;
} SelfD144;

extern int func_ov002_021bc538(int b0);
extern int func_ov002_021b3fb8(int arg0, int arg1, int arg2);
extern int data_ov002_022cf0a4[];
extern int data_ov002_022cf09c[];

int func_ov002_0223d054(SelfD144 *self) {
    int rowOff;

    if (self->mode != 0)
        goto special;

    if (func_ov002_021bc538(self->b0) == 0)
        return 0;

    rowOff = (self->b0 & 1) * 0x868;
    if (*(int *)((char *)data_ov002_022cf0a4 + rowOff) == 0)
        return 0;
    return *(int *)((char *)data_ov002_022cf09c + rowOff) != 0;

special:
    return func_ov002_021b3fb8(self->b0, self->idx, self->f0) != 0;
}
