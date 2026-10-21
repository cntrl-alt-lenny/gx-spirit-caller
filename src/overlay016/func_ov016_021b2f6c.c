typedef struct {
    int state, phase, timer;
    char pad[0x8c];
    unsigned short flags;
} State;
typedef struct {
    unsigned char _pad0[8];
    int f_8;
} state_021b5a28_t;
extern char data_ov016_021bac38[];
extern char data_ov016_021bac64[];
extern char data_ov016_021b9740[];
extern int func_02009494(void *p);
extern void *func_0202c0c0(int id);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern void func_0208c884(unsigned short *a0, int a1);
extern int func_ov016_021b3174(State *p);
extern int func_ov016_021b5544(void *p, int mode, void *text);
extern int func_ov016_021b5a28(state_021b5a28_t *p);
extern int func_ov016_021b5a6c(void *p);
extern void func_ov016_021b700c(void *p);

int func_ov016_021b2f6c(State *p) {
    char *base = data_ov016_021b9740;
    int done = 0;
    if (*(int *)(data_ov016_021bac38 + 8) != 0) {
        if (func_ov016_021b5a6c(data_ov016_021bac38)) {
            func_ov016_021b5a28((state_021b5a28_t *)data_ov016_021bac38);
            if ((p->flags & 2) && 1 - *(int *)(data_ov016_021bac38 + 0x10)) {
                func_ov016_021b700c(data_ov016_021bac64);
            }
            p->flags = 0;
        }
        if (*(int *)data_ov016_021bac38 == 0 && *(int *)(base + 0x13f4) != 0) {
            p->timer += (p->timer < 0x40);
            if (p->timer == 8) func_02009494(base + 0x44);
            if (p->timer >= 0x30) {
                if (p->timer == 0x30) func_02037208(0x42, -1, 0, 1);
                func_0208c884((unsigned short *)0x0400006c, 0x30 - p->timer);
                func_0208c884((unsigned short *)0x0400106c, 0x30 - p->timer);
            }
            if (p->timer >= 0x40) done = 1;
        }
    } else {
        switch (p->state) {
        case 0:
            p->timer++;
            func_0208c884((unsigned short *)0x0400006c, p->timer - 0x10);
            func_0208c884((unsigned short *)0x0400106c, p->timer - 0x10);
            if (p->timer >= 0x10) {
                p->state = 1;
                p->timer = 0;
            }
            break;
        case 1:
            if (func_ov016_021b3174(p)) {
                if (*(int *)(base + 0x13f4) == 0) p->state = 2;
                else func_ov016_021b5544(data_ov016_021bac38, 0, func_0202c0c0(0x6b3));
                p->timer = 0;
            }
            break;
        case 2:
            p->timer++;
            func_0208c884((unsigned short *)0x0400006c, -p->timer);
            func_0208c884((unsigned short *)0x0400106c, -p->timer);
            if (p->timer >= 0x10) done = 1;
            break;
        }
    }
    return done;
}
