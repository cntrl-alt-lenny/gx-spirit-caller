typedef unsigned char u8;
typedef struct {
    u8 _pad0[8];
    int f_8;
} state_021b56f8_t;
extern void func_0208c884(unsigned short *a0, int a1);
extern int func_ov019_021b35dc(void *p);
extern int func_ov019_021b56f8(state_021b56f8_t *p);
extern int func_ov019_021b573c(state_021b56f8_t *p);
extern state_021b56f8_t data_ov019_021b6920;

typedef struct {
    int state;
    int timer;
} FadeState;

int func_ov019_021b3488(FadeState *p) {
    int result = 0;
    switch (p->state) {
    case 0:
        p->timer++;
        func_0208c884((unsigned short *)0x0400006c, p->timer - 16);
        func_0208c884((unsigned short *)0x0400106c, p->timer - 16);
        *(volatile int *)0x04000014 = ((p->timer - 16) * 13) & 0x1ff;
        *(volatile int *)0x04000018 = ((p->timer - 16) * 13) & 0x1ff;
        if (p->timer >= 16) {
            p->state = 1;
            p->timer = 0;
        }
        break;
    case 1:
        if (data_ov019_021b6920.f_8 != 0) {
            if (func_ov019_021b573c(&data_ov019_021b6920)) {
                func_ov019_021b56f8(&data_ov019_021b6920);
                p->state = 2;
                p->timer = 0;
            }
        } else {
            if (func_ov019_021b35dc(p)) {
                p->state = 2;
                p->timer = 0;
            }
        }
        break;
    case 2:
        p->timer++;
        func_0208c884((unsigned short *)0x0400006c, -p->timer);
        func_0208c884((unsigned short *)0x0400106c, -p->timer);
        if (p->timer >= 16)
            result = 1;
        break;
    }
    return result;
}
