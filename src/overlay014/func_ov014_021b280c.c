typedef struct { unsigned short count; } state_0201ef3c_t;
typedef struct {
    char pad[0x54];
    unsigned short a : 8;
    unsigned short b : 8;
    unsigned short c : 8;
    unsigned short d : 8;
} SelfT;
typedef struct {
    char pad[4];
    unsigned int mode : 3;
    char pad8[0xa34];
    unsigned char mode2 : 3;
    char pad_a3d[0x27];
    unsigned int field_a64;
    unsigned int field_a68;
    char pad_a6c[0xc];
    unsigned int field_a78;
} Global;
extern Global data_02104f4c;
extern char data_02105989[];
extern SelfT data_ov014_022350f4;
extern void func_02009758(int n);
extern void func_0201ef3c(state_0201ef3c_t *p, void **tasks1, void **tasks2);
extern char *func_020aadf8(char *dst, const char *src);
extern unsigned int func_ov014_021b4248(SelfT *self);

int func_ov014_021b280c(char *self) {
    *(volatile unsigned int *)0x04000000 &= ~0x1f00;
    *(volatile unsigned int *)0x04001000 &= ~0x1f00;
    if (*(int *)(self + 0x44) != 0) {
        func_0201ef3c(*(state_0201ef3c_t **)(self + 0x38), (void **)(self + 0x40), (void **)(self + 0x44));
        *(int *)(self + 0x48) = 0;
        *(int *)(self + 0x44) = 0;
    }
    if (*(int *)(self + 0x2c) == 0) {
        data_02104f4c.field_a64 = func_ov014_021b4248(&data_ov014_022350f4) | 0x52000000;
        func_020aadf8(data_02105989, self + 0xc);
        data_02104f4c.mode2 = (unsigned char)data_02104f4c.mode;
        func_02009758(0x26);
        func_02009758(0x27);
        func_02009758(0x28);
        func_02009758(0x29);
        func_02009758(0x2a);
        data_02104f4c.field_a78 = 0;
        data_02104f4c.field_a68 |= 0x10000;
        data_02104f4c.field_a68 |= 1;
    }
    return 1;
}

