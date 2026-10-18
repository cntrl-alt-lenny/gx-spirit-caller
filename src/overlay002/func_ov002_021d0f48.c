typedef unsigned int u32;
typedef int s32;

typedef struct {
    char pad0[0x80c];
    s32 f80c;
    s32 f810;
} State;

extern State data_ov002_022ce950;
extern void func_ov002_0229ade0(s32 a, s32 b, s32 c, s32 d);
extern s32 func_ov002_0229c7f8(s32 a);

void func_ov002_021d0f48(void)
{
    if (data_ov002_022ce950.f810 == 0) {
        func_ov002_0229ade0(1, 0, 0, 0);
        data_ov002_022ce950.f810 += 1;
        return;
    }
    if (func_ov002_0229c7f8(1) == 0) {
        data_ov002_022ce950.f80c = 0;
    }
}
