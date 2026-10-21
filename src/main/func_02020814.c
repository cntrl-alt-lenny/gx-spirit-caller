typedef struct {
    char pad0[4];
    unsigned short field_4;
    char pad6[4];
    unsigned short field_a;
    char padc[4];
    int field_10;
    char pad14[8];
    int field_1c;
    int field_20;
    char pad24[8];
    int field_2c;
    char pad30[12];
    int field_3c;
    char pad40[96];
    int field_a0;
    unsigned short field_a4;
} State;
extern State data_02191f40;
extern int func_02020880(void);

int func_02020814(void) {
    enum { Failure, Success } result;
    int status;
    data_02191f40.field_10 = 0;
    data_02191f40.field_3c = 0;
    data_02191f40.field_1c = 0;
    data_02191f40.field_4 = 0;
    data_02191f40.field_a = 1;
    data_02191f40.field_2c = 0;
    data_02191f40.field_a0 = 0;
    data_02191f40.field_a4 = 0;
    data_02191f40.field_20 = 0;
    if (func_02020880() == 0) result = Failure; else result = Success;
    return result;
}




















