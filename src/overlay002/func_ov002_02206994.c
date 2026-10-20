typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 5;
    unsigned short kind : 6;
    unsigned short pad12 : 2;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;

extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_021c2f24(int player, int id);
extern int func_ov002_021c3ae4(int arg0, int arg1);

int func_ov002_02206994(S021ff3bc *p, int unused1) {
    if (func_ov002_021ff3bc(p, unused1) == 0) return 0;
    if (p->kind != 0x23) {
        if (func_ov002_021c2f24(p->bit0, 0xfb7) == 0) return 0;
        if (func_ov002_021c2f24(p->bit0, 0xfb8) == 0) return 0;
        if (func_ov002_021c2f24(p->bit0, 0xfb9) == 0) return 0;
        if (func_ov002_021c2f24(p->bit0, 0xfba) == 0) return 0;
        if (func_ov002_021c2f24(p->bit0, 0xfbb) == 0) return 0;
    }
    if (func_ov002_021c3ae4(p->bit0, 0x1645) == 0) return 0;
    return 1;
}

