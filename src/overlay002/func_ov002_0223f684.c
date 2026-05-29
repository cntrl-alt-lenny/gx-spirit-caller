/* func_ov002_0223f684: C-39 — XOR-indexed int table; if ==1 call
 * helper1(self,arg1,f0), else tail helper2(self). */
typedef unsigned short u16;
struct S0223f684 { u16 f0; u16 bit0:1; u16 b1_13:13; u16 bit14:1; u16 b15:1; };
extern int data_ov002_022cd744[];
extern int func_ov002_0228df3c(struct S0223f684 *self, int arg1, u16 f0);
extern int func_ov002_0223f5b4(struct S0223f684 *self);
int func_ov002_0223f684(struct S0223f684 *self, int arg1) {
    if (data_ov002_022cd744[self->bit0 ^ self->bit14] == 1)
        return func_ov002_0228df3c(self, arg1, self->f0);
    return func_ov002_0223f5b4(self);
}
