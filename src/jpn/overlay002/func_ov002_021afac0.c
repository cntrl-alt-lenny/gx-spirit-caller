/* func_ov002_021afac0: g1->f8 indexes a u16 table, mask 0xff. */
extern char data_ov002_022cdb98[];
extern char data_ov002_022cdfa8[];
int func_ov002_021afac0(void) {
    int i = *(int *)(data_ov002_022cdb98 + 8);
    return *(unsigned short *)(data_ov002_022cdfa8 + i * 2) & 0xff;
}
