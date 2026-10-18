typedef unsigned int u32;
typedef unsigned short u16;
typedef int s32;

typedef struct {
    u16 pad0[0x1C];
    u16 h38;
    u16 pad1;
    u32 w3c;
    u32 flags;
    u32 pad2;
} Slot; /* 0x14 stride overlapped via raw layout below */

typedef struct {
    char pad[0x38];
    u16 h38;
    char pad2[6];
    u32 flags;
    char pad3[0x868 - 0x44];
} Side;

extern Side data_ov002_022cf16c[];
extern s32 func_ov002_021b9ecc(s32 a, s32 b);

s32 func_ov002_021c2568(void)
{
    s32 i;
    s32 j;
    s32 count = 0;
    char *p;
    for (i = 0; i < 2; i++) {
        p = (char *)&data_ov002_022cf16c[i & 1];
        for (j = 0; j <= 4; j++, p += 0x14) {
            switch (func_ov002_021b9ecc(i, j)) {
            case 0x1a90:
            case 0x1a92:
            case 0x1a94:
            case 0x1a96: {
                u32 f = *(u32 *)(p + 0x40);
                u32 h = *(u16 *)(p + 0x38);
                if ((h & ~((f >> 6) & 1)) & ~(((f >> 1) | (f >> 2)) & 1)) {
                    count++;
                }
                break;
            }
            default:
                break;
            }
        }
    }
    return count;
}
