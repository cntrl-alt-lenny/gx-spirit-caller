typedef struct {
    unsigned short pad[2];
    unsigned short value : 8;
    unsigned short upper : 8;
    unsigned short selected : 8;
    unsigned short flags : 8;
} State;
typedef struct { int pad[3]; unsigned int bits[2]; } Bits;
typedef struct { unsigned short count; unsigned char pad[50]; } Count;
typedef struct { unsigned int bits; unsigned char pad[48]; } Entry;
typedef struct { unsigned char pad[0x638]; int flag; } Context;
extern State data_ov008_021b2dc0;
extern Bits data_ov008_021b2dc8;
extern Count data_ov008_021b279c[];
extern Entry data_ov008_021b27a0[];
extern Entry data_ov008_021b27a4[];
extern Context data_ov008_021b2780;
extern void func_ov008_021ada90(void);
void func_ov008_021aceac(void) {
    int i;
    int count;
    int index;
    data_ov008_021b2dc8.bits[1] = 0;
    data_ov008_021b2dc8.bits[0] = 0;
    index = data_ov008_021b2dc0.upper + data_ov008_021b2dc0.value;
    count = data_ov008_021b279c[index].count;
    for (i = 0; i < count; i++) {
        data_ov008_021b2dc8.bits[i / 32] |= 1 << (i % 32);
    }
    data_ov008_021b27a0[(unsigned int)index].bits = data_ov008_021b2dc8.bits[0];
    data_ov008_021b27a4[(unsigned int)index].bits = data_ov008_021b2dc8.bits[1];
    data_ov008_021b2dc0.selected = (unsigned short)index;
    func_ov008_021ada90();
    if (data_ov008_021b2780.flag == 0) data_ov008_021b2780.flag++;
}





