typedef struct {
    unsigned short field0;
    unsigned short field1;
    unsigned short field2;
} Record020c3198;
extern const Record020c3198 data_020c3198[];
extern int data_021a6348;
extern int data_021a633c;
extern int data_021a634c;
extern int data_021a6350;
extern int func_0208cee8(void);

void func_02090330(void) {
    int index = func_0208cee8();
    int a = data_020c3198[index].field0;
    int b = data_020c3198[index].field1;
    int c = data_020c3198[index].field2;
    data_021a6348 = index;
    data_021a633c = a << 12;
    data_021a634c = b << 12;
    data_021a6350 = c << 12;
}
