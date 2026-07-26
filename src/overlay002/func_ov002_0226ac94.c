typedef struct {
    char pad[0xd0c];
    int field_d0c;
    char pad2[0xd8c - 0xd0c - 4];
    int field_d8c;
    char pad3[0xd90 - 0xd8c - 4];
    int field_d90;
    char pad4[0xd94 - 0xd90 - 4];
    int field_d94;
    char pad5[0xd9c - 0xd94 - 4];
    int field_d9c;
} data_022d016c_t;
extern data_022d016c_t data_ov002_022d016c;

typedef struct {
    char pad[4];
    int field_4;
} data_022cd73c_t;
extern data_022cd73c_t data_ov002_022cd73c;

typedef struct {
    char pad[0x300];
    int field_300;
} data_022cd968_t;
extern data_022cd968_t data_ov002_022cd968;

void func_ov002_0226ac94(void) {
    data_ov002_022d016c.field_d90 = 1;
    data_ov002_022d016c.field_d9c = 0;
    data_ov002_022d016c.field_d8c = 0;
    if (data_ov002_022d016c.field_d94 != (data_ov002_022cd73c.field_4 ^ 1)) {
        return;
    }
    if (data_ov002_022d016c.field_d0c == 0) {
        return;
    }
    data_ov002_022cd968.field_300 &= ~0x200;
    data_ov002_022d016c.field_d8c = 2;
}
