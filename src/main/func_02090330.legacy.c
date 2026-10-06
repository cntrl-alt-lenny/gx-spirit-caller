typedef struct { unsigned short field0, field1, field2; } Record020c3198;
extern const Record020c3198 data_020c3198[16];
extern int data_021a6348, data_021a633c, data_021a634c, data_021a6350;
extern int func_0208cee8(void);
void func_02090330(void) {
    int index = func_0208cee8();
    unsigned int first = data_020c3198[index].field0;
    unsigned int second = data_020c3198[index].field1;
    unsigned int third = data_020c3198[index].field2;
    data_021a6348 = index;
    data_021a633c = first << 12;
    data_021a634c = second << 12;
    data_021a6350 = third << 12;
}
