extern int func_020215d8(void *p);
extern int func_ov007_021b2d0c(char *a0);
extern int func_ov007_021b2d3c(char *a0);

typedef struct {
    void *handle;
    int f4;
    int state;
    int timer;
} Context;

int func_ov007_021b2ad0(Context *self) {
    switch (self->state) {
    case 0:
        if (self->timer == 2) {
            func_ov007_021b2d0c((char *)self);
            self->state = 1;
            self->timer = 0;
        }
        break;
    case 1:
        if (func_020215d8(self->handle) == 0) {
            self->handle = 0;
            self->state = 2;
            self->timer = 0;
        } else {
            func_ov007_021b2d3c((char *)self);
        }
        break;
    case 2:
        return 1;
    }
    self->timer++;
    return 0;
}
