extern int func_0201b770(void);
extern unsigned char data_ov011_021d334a[];
extern unsigned char data_ov011_021d35c8[];
extern struct {
    char pad[0x2a8];
    unsigned int low : 17;
    unsigned int value : 8;
    unsigned int high : 7;
} data_ov011_021d4000;
void func_ov011_021cd190(int arg0) {
    unsigned int bits = func_0201b770();
    unsigned int count, shift;
    --arg0;
    count = 32 - data_ov011_021d334a[arg0 * 0x72];
    shift = data_ov011_021d35c8[arg0] - 1;
    bits >>= shift;
    bits &= 0xffffffffU >> count;
    data_ov011_021d4000.value = bits;
}
