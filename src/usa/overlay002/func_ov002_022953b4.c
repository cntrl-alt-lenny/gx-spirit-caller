typedef unsigned short u16;

extern int func_ov002_02281964(int player);
extern int func_ov002_021bd284(int player, int arg1);
extern int func_ov002_02281884(int player, int arg1);
extern int func_ov002_021c2e44(int player, int arg1);
extern int func_ov002_021c3afc(int player);

int func_ov002_022953b4(void *self) {
    u16 field2 = *(u16 *)((char *)self + 2);
    int player = (unsigned)(field2 << 31) >> 31;
    if (func_ov002_02281964(player) == 0) {
        return 0;
    }
    field2 = *(u16 *)((char *)self + 2);
    player = (unsigned)(field2 << 31) >> 31;
    if (func_ov002_021bd284(player, 0x15) != 0) {
        return 1;
    }
    field2 = *(u16 *)((char *)self + 2);
    player = (unsigned)(field2 << 31) >> 31;
    if (func_ov002_02281884(player, 0x18f6) == 0) {
        field2 = *(u16 *)((char *)self + 2);
        player = (unsigned)(field2 << 31) >> 31;
        if (func_ov002_021c2e44(player, 0x18f6) != 0) {
            return 1;
        }
    }
    field2 = *(u16 *)((char *)self + 2);
    player = (unsigned)(field2 << 31) >> 31;
    return func_ov002_021c3afc(player) == 0;
}
