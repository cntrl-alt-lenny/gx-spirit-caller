/* func_ov000_021af3f0: set the +0x2a4 mode bits and hand off to 021ad464(1). */
extern int  func_ov000_021ad464(int a);
extern char data_ov000_021c758c[];
int func_ov000_021af3f0(void) {
    *(int *)(data_ov000_021c758c + 676) = (*(int *)(data_ov000_021c758c + 676) & 0x807fffff) | 0x800000;
    return func_ov000_021ad464(1);
}
