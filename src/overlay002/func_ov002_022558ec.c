typedef int s32;
struct Ctx { char pad[0xcec]; s32 w; };
extern struct Ctx data_ov002_022d016c;
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021bb950(int self, int arg2);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
int func_ov002_022558ec(void)
{
    int p, j, i;
    for (i = 0; i < 2; i++) {
        p = data_ov002_022d016c.w ^ i;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_021baca8(p, j, 0x1914) != 0 && func_ov002_021bb950(0, 0x1784) == 0 && func_ov002_021bb950(1, 0x1784) == 0) {
                func_ov002_021de480(p, j, 0, 0);
                return 1;
            }
        }
    }
    return 0;
}
