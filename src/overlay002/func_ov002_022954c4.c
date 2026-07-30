typedef unsigned short u16;

extern int func_ov002_02281a74(int player);
extern int func_ov002_021bd364(int player, int arg1);
extern int func_ov002_02281994(int player, int arg1);
extern int func_ov002_021c2f24(int player, int arg1);
extern int func_ov002_021c3bdc(int player);

int func_ov002_022954c4(void *self) {
    u16 field2 = *(u16 *)((char *)self + 2);
    int player = (unsigned)(field2 << 31) >> 31;
    if (func_ov002_02281a74(player) == 0) {
        return 0;
    }
    field2 = *(u16 *)((char *)self + 2);
    player = (unsigned)(field2 << 31) >> 31;
    if (func_ov002_021bd364(player, 0x15) != 0) {
        return 1;
    }
    field2 = *(u16 *)((char *)self + 2);
    player = (unsigned)(field2 << 31) >> 31;
    if (func_ov002_02281994(player, 0x18f6) == 0) {
        field2 = *(u16 *)((char *)self + 2);
        player = (unsigned)(field2 << 31) >> 31;
        if (func_ov002_021c2f24(player, 0x18f6) != 0) {
            return 1;
        }
    }
    field2 = *(u16 *)((char *)self + 2);
    player = (unsigned)(field2 << 31) >> 31;
    return func_ov002_021c3bdc(player) == 0;
}
