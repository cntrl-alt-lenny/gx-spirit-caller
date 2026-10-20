typedef unsigned short u16;
struct S {
    u16 id;
    u16 side : 1;
    u16 slot : 5;
    u16 rest : 10;
};
extern char data_ov002_022ce288[];
extern int func_ov002_02211b64(struct S *self, int arg);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_0222cc50(struct S *self, int arg) {
    if (*(int *)(data_ov002_022ce288 + 0x5a8) != 1) {
        return func_ov002_02211b64(self, arg);
    } else {
        unsigned int side = self->side;
        unsigned char slot = (unsigned char)self->slot;
        u16 packed = (u16)((unsigned char)side | (slot << 8));
        func_ov002_021d59cc(side, *(int *)(data_ov002_022ce288 + 0x5ac), packed, 0x17, 0);
        return 0;
    }
}

