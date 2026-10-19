typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 state:8; u16 other:8; } State;
typedef struct { char pad[12]; State state; } Control;
typedef struct { char pad[0x80c]; int active; int next; } Work;
typedef struct { char pad[0x300]; u32 flags; } Flags;
extern Control data_ov002_022cdc68;
extern State data_ov002_022cdc74;
extern Work data_ov002_022ce950;
extern u32 data_ov002_022cdc6c;
extern Flags data_ov002_022cd968;
extern int func_ov002_0229cd70(int a, int b, int c);
extern void func_ov002_021d48f4(void);
extern void func_ov002_021b1458(int arg0, int arg1, int arg2, int arg3);
int func_ov002_021d4e10(void) {
    switch (data_ov002_022cdc68.state.state) {
    case 0:
        func_ov002_0229cd70((int)&data_ov002_022ce950, (int)&data_ov002_022cdc6c, 8);
        data_ov002_022ce950.active = 1;
        data_ov002_022ce950.next = 0;
        data_ov002_022cdc74.state++;
    case 1:
        func_ov002_021d48f4();
        if (data_ov002_022ce950.active != 0) return 1;
        data_ov002_022cdc74.state++;
    case 2:
        func_ov002_021b1458(8, 0, 0, 0);
        data_ov002_022cd968.flags &= ~4;
        return 1;
    }
    return 1;
}
