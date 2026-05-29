/* func_ov011_021cd024: frameless-leaf -> two global field updates. */
extern char data_ov011_021d4000[];
void func_ov011_021cd024(void) {
    *(int *)(data_ov011_021d4000 + 568) = *(int *)(data_ov011_021d4000 + 600) - 0x80000;
    *(int *)(data_ov011_021d4000 + 572) = *(int *)(data_ov011_021d4000 + 604) - 0x60000;
}
