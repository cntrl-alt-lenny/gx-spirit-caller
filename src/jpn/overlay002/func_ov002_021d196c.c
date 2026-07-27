typedef struct {
    unsigned short flags;
    char pad2[0x80c - 2];
    int field_80c;
    char pad3[0x810 - 0x80c - 4];
    int field_810;
} data_ov002_022ce950_t;
extern data_ov002_022ce950_t data_ov002_022ce870;

extern void func_ov002_0229acd0(int a, int b, int c, int d);
extern int func_ov002_0229c6e8(int a);

void func_ov002_021d196c(void) {
    int flag = (data_ov002_022ce870.flags & 0x8000) ? 1 : 0;
    if (data_ov002_022ce870.field_810 == 0) {
        func_ov002_0229acd0(0x3c, flag, 0, 0);
        data_ov002_022ce870.field_810 += 1;
    } else {
        if (func_ov002_0229c6e8(0x3c) == 0) {
            data_ov002_022ce870.field_80c = 0;
        }
    }
}
