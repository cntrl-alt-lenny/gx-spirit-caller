typedef struct {
    char pad[0x34];
    int state;
    int timer;
} Pane;

extern int func_ov007_021b2630(void *a);
extern int func_ov007_021b2694(void *a);

int func_ov007_021b25a0(Pane *a) {
    switch (a->state) {
    case 0:
        if (a->timer == 3) {
            func_ov007_021b2630(a);
            a->state = 1;
            a->timer = 0;
        }
        break;
    case 1:
        if (func_ov007_021b2694(a)) {
            a->state = 2;
            a->timer = 0;
        }
        break;
    case 2:
        return 1;
    }
    a->timer++;
    return 0;
}
