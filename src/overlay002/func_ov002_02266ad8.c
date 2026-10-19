extern int func_ov002_021baca8(int a0, int a1, int a2);
extern int func_ov002_021bbf50(int arg0);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern int func_ov002_021d6870(int a, int b, int c, int d, int e, int f);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
typedef struct { char pad[0xd28]; unsigned int index; } State;
extern State data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
struct Slot { unsigned int id:13; unsigned int bit:1; unsigned int pad:8; unsigned int index:8; unsigned int rest:2; char tail[16]; };
int func_ov002_02266ad8(int a) {
    unsigned int i;
    for (i = data_ov002_022d016c.index; i <= 4; i = ++data_ov002_022d016c.index) {
        if (func_ov002_021baca8(a, i, 0x1338) && func_ov002_021bbf50(a) == 1) {
            int off = (a & 1) * 0x868;
            int slotOff = i * 20;
            struct Slot *p = (struct Slot *)(data_ov002_022cf16c + off + 0x30 + slotOff);
            func_ov002_021df62c(a, i, p->index * 2 + p->bit);
            if (*(unsigned short *)(data_ov002_022cf1a2 + off + slotOff) == 0)
                func_ov002_021d6870(a, i, 0, 0, 0x1338, 0);
            func_ov002_021e2d94(a, i, 0x15, 1);
            data_ov002_022d016c.index++;
            return 0;
        }
    }
    return 1;
}

