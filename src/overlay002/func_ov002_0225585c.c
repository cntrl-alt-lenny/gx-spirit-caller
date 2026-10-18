typedef int s32;

struct Ctx {
    char pad[0xcec];
    s32 w;
};

extern struct Ctx data_ov002_022d016c;
extern s32 func_ov002_021baca8(s32 a, s32 b, s32 c);
extern s32 func_ov002_021bb90c();
extern int func_ov002_021de480(s32 a, s32 b, s32 c, s32 d);

s32 func_ov002_0225585c(void)
{
    s32 p;
    s32 j;
    s32 i;

    for (i = 0; i < 2; i++) {
        p = data_ov002_022d016c.w ^ i;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021baca8(p, j, 0x147a) != 0 && func_ov002_021bb90c(p, 0x146f) == 0) {
                func_ov002_021de480(p, j, 0, 0);
                return 1;
            }
        }
    }
    return 0;
}
