typedef signed int s32;
extern char data_ov002_022d016c[];
int func_ov002_021baca8(s32, s32, s32);
int func_ov002_021c2f24(s32, s32);
void func_ov002_021de480(s32, s32, s32, s32);

s32 func_ov002_022564dc(void) {
    s32 a, j, i;
    for (i = 0; i < 2; i++) {
        a = *(s32 *)(data_ov002_022d016c + 0xcec) ^ i;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021baca8(a, j, 0x1645) != 0) {
                if (func_ov002_021c2f24(a, 0xfb7) == 0 ||
                    func_ov002_021c2f24(a, 0xfb8) == 0 ||
                    func_ov002_021c2f24(a, 0xfb9) == 0 ||
                    func_ov002_021c2f24(a, 0xfba) == 0 ||
                    func_ov002_021c2f24(a, 0xfbb) == 0) {
                    func_ov002_021de480(a, j, 0, 0);
                    return 1;
                }
            }
        }
    }
    return 0;
}
