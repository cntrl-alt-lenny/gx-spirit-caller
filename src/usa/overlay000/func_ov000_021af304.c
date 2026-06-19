/* func_ov000_021af304: set the +0x2a4 mode bits and hand off to 021ad464(1). */
extern int  func_ov000_021ad384(int a);
extern char data_ov000_021c74ac[];
int func_ov000_021af304(void) {
    *(int *)(data_ov000_021c74ac + 676) = (*(int *)(data_ov000_021c74ac + 676) & 0x807fffff) | 0x800000;
    return func_ov000_021ad384(1);
}
