typedef unsigned int u32;
extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];

void func_ov011_021ca630(void) {
    char *a = data_ov011_021d4000;
    char *b = data_ov011_021d403c;
    u32 f = *(u32 *)(a + 0x2a4);
    if (((f << 15) >> 28) == 0) {
        return;
    }
    *(u32 *)(b + 0x280) = (*(u32 *)(b + 0x280) & 0xFFC3FFFFu) | 0xc0000u;
}
