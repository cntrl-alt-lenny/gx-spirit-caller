/* func_ov002_021afba0: g1->f8 indexes a u16 table, mask 0xff. */
extern char data_ov002_022cdc78[];
extern char data_ov002_022ce088[];
int func_ov002_021afba0(void) {
    int i = *(int *)(data_ov002_022cdc78 + 8);
    return *(unsigned short *)(data_ov002_022ce088 + i * 2) & 0xff;
}
