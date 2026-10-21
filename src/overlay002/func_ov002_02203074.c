typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 w0;
    u16 bit0 : 1;
    u16 pad1 : 13;
    u16 bit14 : 1;
    u16 pad15 : 1;
} S021ff3bc;
typedef struct { u32 id : 13; u32 rest : 19; } Entry;
extern int func_0202e234(int x);
extern int func_0202e310(int unused0);
extern int func_0203058c(int a);
extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern u32 func_ov002_021b947c(int arg);
extern int func_ov002_021bbe8c(int arg);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);

int func_ov002_02203074(S021ff3bc *p, int arg) {
    int found;
    u32 packed;
    int idx, kind, side;
    Entry *entry;
    found = func_ov002_021b4120(p->bit0, 0xb, 0x1415);
    if (func_ov002_021ff3bc(p, arg) == 0) return 0;
    if (found >= 0) {
        packed = func_ov002_021b947c(found);
        idx = (u16)(packed >> 16);
        side = (unsigned char)packed;
        kind = (unsigned char)((u16)packed >> 8);
        entry = func_ov002_021c93f0(side, kind, idx);
        if (kind != 0xe) return 0;
        if (func_0202e234(entry->id) != 0) {
            if (func_ov002_021c33e4(p->bit0, side, idx) != 0) {
                if (func_0202e310(entry->id) == 0 || func_0203058c(entry->id) == 0 || func_ov002_021bbe8c(p->bit0) != 0) {
                    return 1;
                }
            }
        }
    }
    return 0;
}


