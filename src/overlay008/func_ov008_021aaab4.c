extern int Ov008_Rand(void), func_0202111c(void), func_02021158(void);
extern void func_0200ddc4(void), func_0200e9c4(void);
extern int func_0202224c(int), func_02022234(unsigned int, unsigned int);
extern void func_0208c884(unsigned short *, int);
extern int func_0208e120(void), func_0208e1cc(void);
extern void func_02094504(int, int, int);
extern void func_ov008_021aa900(void), func_ov008_021ab508(void), func_ov008_021abcdc(void);
extern int func_ov008_021ac2ac(void);
extern void func_ov008_021ac35c(int, int), func_ov008_021acb7c(void);
extern int func_ov008_021ad570(void);
extern void func_ov008_021adaa8(int), func_ov008_021ae674(void);
extern int func_ov008_021ae70c(void);
extern void func_ov008_021b01d8(void), func_ov008_021b0a14(void);
extern int func_ov008_021b0bc4(void);
extern void func_ov008_021b16f8(void), func_ov008_021b18a4(int), func_ov008_021b2028(int), func_ov008_021b2244(void);
struct State { unsigned short state, timer; char pad[12]; unsigned short value; char pad2[0x622]; int f634; };
extern struct State data_ov008_021b2780;
struct Other { char pad[0x10]; int value; };
extern struct Other data_ov008_021b2eac;
struct Count { char pad[0x5a]; unsigned short count; };
extern struct Count data_ov008_021b2c80;
int func_ov008_021aaab4(void) {
    int done = 0;
    void (*update)(void) = 0;
    int i;
    Ov008_Rand();
    switch (data_ov008_021b2780.state) {
    case 0:
        data_ov008_021b2780.timer += 2;
        if (data_ov008_021b2780.timer == 4) {
            func_ov008_021b18a4(1);
            func_ov008_021ab508();
            data_ov008_021b2780.timer = 0;
            data_ov008_021b2780.state = 1;
        }
        break;
    case 1:
        update = func_ov008_021acb7c;
        if (data_ov008_021b2780.timer >= 16) data_ov008_021b2780.state = 2;
        if (data_ov008_021b2780.timer == 2) {
            *(volatile unsigned int *)0x04000000 = (*(volatile unsigned int *)0x04000000 & ~0x1f00) | 0xf00;
            *(volatile unsigned int *)0x04001000 = (*(volatile unsigned int *)0x04001000 & ~0x1f00) | 0x1c00;
        }
        data_ov008_021b2780.timer += 2;
        func_ov008_021b2028(0);
        break;
    case 2:
        switch (func_ov008_021ad570()) {
        case 1: data_ov008_021b2780.state = 3; break;
        case 2: data_ov008_021b2780.timer = 0; data_ov008_021b2780.state = 10; func_02022234(0, func_0202224c(0) | 1); break;
        case 3: data_ov008_021b2780.state = 6; break;
        }
        update = func_ov008_021acb7c;
        break;
    case 3:
        func_ov008_021adaa8(0); data_ov008_021b2780.state = 4; update = func_ov008_021abcdc; break;
    case 4:
        switch (func_ov008_021ae70c()) {
        case 4: data_ov008_021b2780.state = 5; break;
        case 5: data_ov008_021b2780.state = 6; break;
        }
        update = func_ov008_021ae674; break;
    case 5: data_ov008_021b2780.state = 2; update = func_ov008_021abcdc; break;
    case 6: func_ov008_021b01d8(); func_ov008_021b18a4(0); data_ov008_021b2780.state = 7; update = func_ov008_021b0a14; break;
    case 7: if (func_ov008_021b0bc4() == 1) data_ov008_021b2780.state = 8; update = func_ov008_021b0a14; break;
    case 8:
        func_ov008_021b16f8(); data_ov008_021b2eac.value = data_ov008_021b2780.value; data_ov008_021b2780.state = 9; update = func_ov008_021abcdc;
        func_02094504(0, func_0208e1cc(), 0x600); func_02094504(0, func_0208e120(), 0x600); func_ov008_021b18a4(1); break;
    case 9:
        for (i = 0; i < (data_ov008_021b2c80.count > 6 ? 7 : data_ov008_021b2c80.count); i++) func_ov008_021ac35c(i, i);
        func_ov008_021ac2ac(); func_ov008_021adaa8(1); func_ov008_021aa900(); data_ov008_021b2780.state = 2; update = func_ov008_021abcdc; break;
    case 10:
        update = func_ov008_021acb7c;
        if (data_ov008_021b2780.timer > 16) { data_ov008_021b2780.state = 2; done = 1; }
        data_ov008_021b2780.timer++; break;
    }
    func_0202111c(); func_0200ddc4(); if (update) update(); func_ov008_021b2244(); func_02021158(); func_0200e9c4();
    *(volatile int *)0x04000540 = 1; data_ov008_021b2780.f634 = 0;
    if (done) { func_0208c884((unsigned short *)0x0400006c, -16); func_0208c884((unsigned short *)0x0400106c, -16); }
    return done;
}
