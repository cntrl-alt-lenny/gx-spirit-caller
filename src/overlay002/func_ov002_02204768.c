typedef unsigned short u16;

extern int func_ov002_021ca2b8(int a);
extern int func_ov002_022536e8(int player, int self_f0, int zero);
extern char data_ov002_022cf1ac[];

struct SelfF2Bits2 { u16 bit0:1; u16 field5:5; u16 rest:10; };

int func_ov002_02204768(void *self) {
    if (func_ov002_021ca2b8(((struct SelfF2Bits2 *)((char *)self + 2))->bit0) == 0) return 0;
    {
        struct SelfF2Bits2 *bits = (struct SelfF2Bits2 *)((char *)self + 2);
        int player = bits->bit0;
        int field5 = bits->field5;
        unsigned int val = *(unsigned int *)((char *)data_ov002_022cf1ac + (player & 1) * 0x868 + field5 * 20);
        if ((val >> 18) & 1) return 0;
        return func_ov002_022536e8(player, *(u16 *)self, 0) > 0;
    }
}
