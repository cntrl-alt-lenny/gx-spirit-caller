typedef struct { unsigned int control; unsigned short status; unsigned short vcount; unsigned short bg[4]; } Display;
typedef struct { unsigned int low:8; unsigned int mode:5; unsigned int high:19; } DisplayControl;
typedef struct { char pad[0x50]; int start; int end; } Timers;
extern Timers data_ov018_021ad860;
typedef struct { int state; int field4; int divisor; int timer; } State;
extern State data_ov018_021ad8a8;
extern int func_02037b34(void);
extern int func_020379f8(int id);
extern int func_020373cc(int a, int b, int c, int d);
extern void func_0208c940(void);
extern void func_0208c884(unsigned short *a0, int a1);
extern int func_020b3870(int a, int b);

static inline void setPlanes(unsigned int *reg, unsigned int planes) {
    *reg = (*reg & ~0x1f00) | (planes << 8);
}
static inline void setPriority(unsigned short *reg, int priority) {
    *reg = (*reg & ~3) | priority;
}
int func_ov018_021ab4f4(void) {
    State *p = &data_ov018_021ad8a8;
    int v;
    int t;
    if (data_ov018_021ad860.end == data_ov018_021ad860.start) {
        if (func_02037b34() == -1) {
            func_020379f8(0);
            func_020373cc(0x30, 1, 0, -1);
        }
        ((DisplayControl *)0x04000000)->mode = 8;
        ((DisplayControl *)0x04001000)->mode = 8;
        setPriority((volatile unsigned short *)0x04000008, 0);
        setPriority((volatile unsigned short *)0x0400000a, 1);
        setPriority((volatile unsigned short *)0x0400000c, 2);
        setPriority((volatile unsigned short *)0x0400000e, 3);
        setPriority((volatile unsigned short *)0x04001008, 0);
        setPriority((volatile unsigned short *)0x0400100a, 1);
        setPriority((volatile unsigned short *)0x0400100c, 2);
        setPriority((volatile unsigned short *)0x0400100e, 3);
        func_0208c940();
        *(unsigned int *)0x04001000 |= 0x10000;
    }
    t = p->timer - 0x1000;
    p->timer = t;
    if (t < 0) p->timer = 0;
    v = func_020b3870(-(p->timer << 4), p->divisor);
    func_0208c884((unsigned short *)0x0400006c, v);
    func_0208c884((unsigned short *)0x0400106c, v);
    if (p->timer != 0) return 0;
    func_0208c884((unsigned short *)0x0400006c, 0);
    func_0208c884((unsigned short *)0x0400106c, 0);
    data_ov018_021ad860.start = 0x3c000;
    data_ov018_021ad860.end = 0x3c000;
    p->state = 1;
    return 1;
}









