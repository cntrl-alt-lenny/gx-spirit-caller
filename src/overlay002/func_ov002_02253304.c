#include <nitro/types.h>

extern char data_ov002_022cf16c[];

extern int func_0202e234(int id);
extern int func_0202b8a8(int id);
extern int func_0202e258(int id);
extern int func_ov002_021ca440(int player, int id);
extern int func_ov002_02253458(int a, int b, int c);

#define LOW13(x) (((unsigned)((x) << 19)) >> 19)

void func_ov002_02253304(int player, int unused1, int idx) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    int entry = *(int *)(row + idx * 4 + 0x120);
    int id = LOW13(entry);

    if (!func_0202e234(id)) {
        return;
    }
    if (func_0202b8a8(id) < 5) {
        return;
    }
    if (!func_0202e258(id)) {
        return;
    }
    if (!func_ov002_021ca440(player, id)) {
        return;
    }
    func_ov002_02253458(player, 0xb, idx);
}
