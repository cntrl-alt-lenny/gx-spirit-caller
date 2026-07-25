/* func_ov002_0228bb58 (ov002): leaf predicate. self=r0, arg1=r1.
 *   if (arg1 == 0) return 0;
 *   if (arg1->bit0 == self->bit0) return 0;   (arg1 loaded first, then self)
 *   k = arg1->k;                                lsl26;lsr27 = bits 1..5 (:5,
 *                                                unsigned -- movhi/ldrls tail)
 *   if (k > 4) return 0;
 *   return *(int*)(d016c + 0xd0) & 1;
 */
typedef unsigned short u16;
struct S0228bb58 { u16 f0; u16 bit0:1; u16 k:5; u16 rest:10; };
extern char data_ov002_022d016c[];
int func_ov002_0228bb58(struct S0228bb58 *self, struct S0228bb58 *arg1) {
    unsigned int k;
    if (arg1 == 0) return 0;
    if (arg1->bit0 == self->bit0) return 0;
    k = arg1->k;
    if (k > 4) return 0;
    return *(int *)(data_ov002_022d016c + 0xd0) & 1;
}
