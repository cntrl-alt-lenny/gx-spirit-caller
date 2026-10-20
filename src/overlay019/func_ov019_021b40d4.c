typedef unsigned short u16;
struct State { unsigned int unk0; unsigned int mode : 3; unsigned int rest : 29; };
extern struct State data_02104f4c;
extern char data_ov019_021b6334[];
extern int func_020195b8(int a0, int a1);
extern char *func_0202c0c0(int id);
extern void func_ov019_021b2938(int tile, void *buffer, void *text, int size);
extern void func_ov019_021b2818(int a0, int a1);
void func_ov019_021b40d4(int a0, int id, int index) {
    char *text;
    switch (id) {
    case 0x19:
        if (data_02104f4c.mode == 3 || data_02104f4c.mode == 4)
            text = func_0202c0c0(id + 0x5dc);
        else
            text = func_0202c0c0(id + 0x578);
        break;
    case 0x13:
    case 0x48:
        if (data_02104f4c.mode != 0) {
            text = func_0202c0c0(id + 0x5dc);
            break;
        }
    default:
        text = func_0202c0c0(id + 0x578);
        break;
    }
    func_ov019_021b2938((u16)(index * 12 + 0x348), data_ov019_021b6334, text, 0x500);
    func_ov019_021b2818(0x6600000 + ((index * 3 + 0x3a8) << 7), func_020195b8(id, 0) > 99 ? 99 : func_020195b8(id, 0));
    func_ov019_021b2818(0x6600000 + ((index * 3 + 0x3a9) << 7), func_020195b8(id, 1) > 99 ? 99 : func_020195b8(id, 1));
    func_ov019_021b2818(0x6600000 + ((index * 3 + 0x3aa) << 7), func_020195b8(id, 2) > 99 ? 99 : func_020195b8(id, 2));
}
