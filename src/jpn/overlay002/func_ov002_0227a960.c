typedef struct {
    unsigned int byte0 : 8;
    unsigned int byte1 : 8;
    unsigned int byte2 : 8;
    unsigned int byte3 : 8;
} Field18_aa50;

typedef struct {
    char pad[0x16];
    unsigned short field16;
    Field18_aa50 field18;
} DataCd300_aa50;

extern DataCd300_aa50 data_ov002_022cd220;

void func_ov002_0227a960(void) {
    data_ov002_022cd220.field18.byte0 = 0;
    data_ov002_022cd220.field18.byte1 = 0;
    data_ov002_022cd220.field18.byte2 = 0;
    data_ov002_022cd220.field18.byte3 = 0;
    data_ov002_022cd220.field16 |= 0xc0;
}
