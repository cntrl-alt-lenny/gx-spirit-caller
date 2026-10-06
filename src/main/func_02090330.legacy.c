typedef struct { unsigned short field0, field1, field2; } Record020c3198;
extern const Record020c3198 data_020c3198[16];
extern const unsigned char data_020c319a[], data_020c319c[];
extern int data_021a6348, data_021a633c, data_021a634c, data_021a6350;
extern int func_0208cee8(void);
void func_02090330(void) {
    int index = func_0208cee8();
    int offset = index * 6;
    unsigned int first = *(const unsigned short *)((const unsigned char *)data_020c3198 + offset);
    unsigned int second = *(const unsigned short *)(data_020c319a + offset);
    unsigned int third = *(const unsigned short *)(data_020c319c + offset);
    data_021a6348 = index;
    data_021a633c = first << 12;
    data_021a634c = second << 12;
    data_021a6350 = third << 12;
}
