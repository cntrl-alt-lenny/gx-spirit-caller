extern unsigned char data_ov002_022ce950[];
extern unsigned char data_ov002_022cf16c[];
typedef struct { unsigned char pad[0xce8]; int counter; } Counters;
extern Counters data_ov002_022d016c;
extern void func_ov002_021c9b80(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
typedef struct { unsigned int id:13; unsigned int rest:19; unsigned short serial; unsigned char pad[14]; } Slot;
void func_ov002_021cd64c(void) {
    int f = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    int i = (unsigned char)*(unsigned short *)(data_ov002_022ce950 + 2);
    Slot *p = (Slot *)(data_ov002_022cf16c + (f & 1) * 0x868 + 0x30) + i;
    if (p->id != 0) {
        p->serial = ++data_ov002_022d016c.counter;
        func_ov002_021c9b80(f, i, 1, 0);
        func_ov002_0229ade0(0x24, 0, 0, 0);
    }
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}

