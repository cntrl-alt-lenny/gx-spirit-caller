#include <nitro/types.h>

extern char data_ov002_022cf08c[];

extern int func_0202e1e0(int id);
extern int func_0202b854(int id);
extern int func_0202e204(int id);
extern int func_ov002_021ca360(int player, int id);
extern int func_ov002_02253370(int a, int b, int c);

#define LOW13(x) (((unsigned)((x) << 19)) >> 19)

void func_ov002_0225321c(int player, int unused1, int idx) {
    char *row = data_ov002_022cf08c + (player & 1) * 0x868;
    int entry = *(int *)(row + idx * 4 + 0x120);
    int id = LOW13(entry);

    if (!func_0202e1e0(id)) {
        return;
    }
    if (func_0202b854(id) < 5) {
        return;
    }
    if (!func_0202e204(id)) {
        return;
    }
    if (!func_ov002_021ca360(player, id)) {
        return;
    }
    func_ov002_02253370(player, 0xb, idx);
}
