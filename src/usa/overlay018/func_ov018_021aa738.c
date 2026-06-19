/* func_ov018_021aa738: read the active page index. For sel!=1, return the 3-bit
 * system page field (data_02104e6c bits 2:0); for sel==1, return the clamped
 * 0..2 sub-page from data_02103fcc+0x34.
 */

typedef struct {
    char pad[4];
    unsigned int lo3 : 3;
} SysPage;

extern SysPage data_02104e6c;
extern char data_02103fcc[];

int func_ov018_021aa738(int sel) {
    if (sel != 1) {
        return data_02104e6c.lo3;
    }
    switch (*(int *)(data_02103fcc + 0x34)) {
    case 0: return 0;
    case 1: return 1;
    case 2: return 2;
    }
    return 0;
}
