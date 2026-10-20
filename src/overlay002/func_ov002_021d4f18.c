typedef unsigned int u32;
typedef struct { char pad[0xd0c]; int enabled; char pad2[0x78]; int state; } Control;
typedef struct { u32 low:2; u32 special:1; u32 busy:1; u32 rest:28; } Bits;
typedef struct { char pad[0x300]; Bits flags; } Flags;
typedef struct { char pad[0x808]; u32 count; int active; int next; int other; } Work;
typedef struct { char pad[8]; int mode; } Mode;
typedef struct { u32 a,b; } Entry;
extern Control data_ov002_022d016c;
extern Flags data_ov002_022cd968;
extern Work data_ov002_022ce950;
extern Entry data_ov002_022ce958[];
extern Mode data_ov002_022cd73c;
extern int func_ov002_0229c7f8(int a);
extern int func_ov002_0229cd70(int a, int b, int c);
extern int func_ov002_021d4e10(void);
extern void func_ov002_021d48f4(void);
extern void func_ov002_021b1570(int a, int b, void *c, int n);
extern void func_ov002_021b085c(int a);
int func_ov002_021d4f18(void) {
    u32 i;
    if (func_ov002_0229c7f8(0)) return 1;
    if (data_ov002_022d016c.enabled && data_ov002_022cd968.flags.special)
        return func_ov002_021d4e10();
    switch (data_ov002_022d016c.state) {
    case 0:
        if (data_ov002_022ce950.count == 0) return 0;
        func_ov002_0229cd70((int)&data_ov002_022ce950, (int)data_ov002_022ce958, 8);
        data_ov002_022ce950.count--;
        for (i = 0; i < data_ov002_022ce950.count; i++)
            func_ov002_0229cd70((int)&data_ov002_022ce958[i], (int)&data_ov002_022ce958[i+1], 8);
        data_ov002_022cd968.flags.busy = 1;
        data_ov002_022ce950.active = 1;
        if (data_ov002_022d016c.enabled) {
            func_ov002_021b1570(7, -1, &data_ov002_022ce950, 8);
            data_ov002_022cd968.flags.busy = 0;
        }
        data_ov002_022ce950.next = 0;
        data_ov002_022ce950.other = 0;
        data_ov002_022d016c.state++;
    case 1:
        func_ov002_021d48f4();
        if (data_ov002_022ce950.active) return 1;
        data_ov002_022d016c.state++;
    case 2:
        if (!data_ov002_022cd968.flags.busy) return 1;
        data_ov002_022d016c.state = 0;
        if (data_ov002_022ce950.count) return 1;
        if (data_ov002_022cd73c.mode == 3 && data_ov002_022ce950.active == 0) {
            func_ov002_021b085c(0);
            return 1;
        }
        return 0;
    }
    return 0;
}
