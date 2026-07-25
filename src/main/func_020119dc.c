/* func_020119dc: lookup field0 of data_020b52d0[idx]. */

typedef struct {
    int field0;
    unsigned short field1;
    unsigned short field2;
    unsigned short field3;
    unsigned short field4;
} Record020b52d0;

extern const Record020b52d0 data_020b52d0[];

int func_020119dc(int idx) {
    return data_020b52d0[idx].field0;
}
