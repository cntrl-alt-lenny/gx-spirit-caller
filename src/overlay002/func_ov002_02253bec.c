struct View { char pad[0x38]; unsigned short active; unsigned short pad2; unsigned int pad3; unsigned int flags; };
typedef unsigned int u32;
typedef unsigned short u16;
struct Entry { u32 id:13; u32 flag:1; u32 mid:8; u32 high:8; u32 tail:2; u32 pad; u16 active; u16 pad2; u32 pad3; u32 flags; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int func_0202e234(int x);
extern int func_ov002_021b9ecc(int a, int b);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_02253bec(int arg) {
    int side, j, i, lo, hi;
    char *base; struct View *p;
    if (func_0202e234(arg) != 0) { lo = 0; hi = 4; }
    else { lo = 5; hi = 9; }
    for (i = 0; i < 2; i++) {
        side = *(int *)(data_ov002_022d016c + 0xcec) ^ i;

        j = lo;
        if (j <= hi) {
        p = (struct View *)(data_ov002_022cf16c + (side & 1) * 0x868 + lo * 20);
        do {
            
            if (func_ov002_021b9ecc(side, j) == arg && p->active != 0 && (((p->flags >> 1) | (p->flags >> 2)) & 1) == 0 && ((p->flags >> 5) & 1) != 0) {
                func_ov002_021e30b4(((side << 31) & 0x80000000) | 0x200000 | ((j << 16) & 0x1f0000) | (u16)arg, (u16)(((struct Entry *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30))[j].high * 2 + ((struct Entry *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30))[j].flag), 0);
                func_ov002_021e2d94(side, j, 5, 0);
                return 1;
            }
            j++;
            p = (struct View *)((char *)p + 20);
        } while (j <= hi);
        }
    }
    return 0;
}





