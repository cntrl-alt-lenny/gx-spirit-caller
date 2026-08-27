typedef struct {
    unsigned int w0;
    unsigned int w1;
    unsigned int w2;
    unsigned int w3;
} PendingXfer0229a0a4;

typedef struct {
    unsigned char pad[0x88];
    PendingXfer0229a0a4 slot0;
    PendingXfer0229a0a4 slot1;
    PendingXfer0229a0a4 slot2;
    PendingXfer0229a0a4 slot3;
} State0229a0a4;

typedef struct {
    volatile unsigned int w0;
    volatile unsigned int w1;
    volatile unsigned int w2;
    volatile unsigned int w3;
} MmioXfer0229a0a4;

extern State0229a0a4 data_ov002_022d0e4c;

void func_ov002_02299f94(void) {
    if (data_ov002_022d0e4c.slot0.w0 != 0) {
        MmioXfer0229a0a4 *mmio = (MmioXfer0229a0a4 *)0x04000020;
        mmio->w0 = data_ov002_022d0e4c.slot0.w0;
        mmio->w1 = data_ov002_022d0e4c.slot0.w1;
        mmio->w2 = data_ov002_022d0e4c.slot0.w2;
        mmio->w3 = data_ov002_022d0e4c.slot0.w3;
        data_ov002_022d0e4c.slot0.w0 = 0;
    }
    if (data_ov002_022d0e4c.slot1.w0 != 0) {
        MmioXfer0229a0a4 *mmio = (MmioXfer0229a0a4 *)0x04000030;
        mmio->w0 = data_ov002_022d0e4c.slot1.w0;
        mmio->w1 = data_ov002_022d0e4c.slot1.w1;
        mmio->w2 = data_ov002_022d0e4c.slot1.w2;
        mmio->w3 = data_ov002_022d0e4c.slot1.w3;
        data_ov002_022d0e4c.slot1.w0 = 0;
    }
    if (data_ov002_022d0e4c.slot2.w0 != 0) {
        MmioXfer0229a0a4 *mmio = (MmioXfer0229a0a4 *)0x04001020;
        mmio->w0 = data_ov002_022d0e4c.slot2.w0;
        mmio->w1 = data_ov002_022d0e4c.slot2.w1;
        mmio->w2 = data_ov002_022d0e4c.slot2.w2;
        mmio->w3 = data_ov002_022d0e4c.slot2.w3;
        data_ov002_022d0e4c.slot2.w0 = 0;
    }
    if (data_ov002_022d0e4c.slot3.w0 != 0) {
        MmioXfer0229a0a4 *mmio = (MmioXfer0229a0a4 *)0x04001030;
        mmio->w0 = data_ov002_022d0e4c.slot3.w0;
        mmio->w1 = data_ov002_022d0e4c.slot3.w1;
        mmio->w2 = data_ov002_022d0e4c.slot3.w2;
        mmio->w3 = data_ov002_022d0e4c.slot3.w3;
        data_ov002_022d0e4c.slot3.w0 = 0;
    }
}
