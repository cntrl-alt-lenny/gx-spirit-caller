typedef struct {
    unsigned short lo2 : 2;
    unsigned short bit2 : 1;
    unsigned short mid7 : 7;
    unsigned short bit10 : 1;
    unsigned short hi5 : 5;
} Field16a_02025880;

typedef struct {
    unsigned int lo1 : 1;
    unsigned int bit1 : 1;
    unsigned int hi30 : 30;
} Field60_02025880;

typedef struct {
    char pad[0x60];
    Field60_02025880 field60;
} Pointee02025880;

typedef struct {
    char pad[0xa4];
    Pointee02025880 *field_a4;
    char pad2[0x16a - 0xa4 - 4];
    Field16a_02025880 field16a;
} Obj02025880;

int func_02025880(Obj02025880 *arg0) {
    if (arg0->field16a.bit2) {
        return arg0->field16a.bit10;
    }
    if (arg0->field_a4 != 0) {
        return arg0->field_a4->field60.bit1;
    }
    return 0;
}
