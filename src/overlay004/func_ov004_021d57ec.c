/* func_ov004_021d57ec: leaf, no callees (C-71). Clear self->f38 if set
 * (plain predicated store). Then bail if the global lock flag
 * data_ov004_022915e8 is set -- documented in ov004_core.h WALLS as
 * "materialized-bool-global if(g!=0)return (021d4870/021d57ec): orig
 * materialises movne#1;moveq#0" -- needs an explicit bool temp, not a
 * direct `if(g!=0)return;`. Otherwise arm self->f30=0x18/f38=1/f3c=0.
 */
extern volatile int data_ov004_022915e8;

void func_ov004_021d57ec(void *self_) {
    int *self = (int *)self_;
    int flag;

    if (self[0xe] != 0) {
        self[0xe] = 0;
    }

    flag = (data_ov004_022915e8 != 0);
    if (flag) {
        return;
    }

    self[0xc] = 0x18;
    self[0xe] = 1;
    self[0xf] = 0;
}
