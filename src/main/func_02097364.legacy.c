typedef struct {
    char pad[0x1c];
    volatile unsigned int flags;
    char pad20[12];
    int f2c;
    int f30;
    int f34;
    int f38;
    int f3c;
    int f40;
    int f44;
    void *f48;
    void *f4c;
    void *f50;
} Device;
typedef Device Dev;
extern int func_02097258(Device *self);
extern int func_020972d4(Dev *dev);

int func_02097364(Device *self) {
    int result = 0;
    int active = (self->flags & 2) ? 1 : 0;
    if (active != 0) {
        int acquired = func_020972d4(self);
        int pending = (self->flags & 4) ? 1 : 0;
        if (pending != 0) {
            self->flags &= ~4;
            result = self->f44;
            self->f44 = 0;
            self->f2c = self->f3c;
            self->f34 = self->f40;
            self->f50 = self->f48;
        }
        if (acquired) {
            func_02097258(self);
        }
    }
    return result;
}


