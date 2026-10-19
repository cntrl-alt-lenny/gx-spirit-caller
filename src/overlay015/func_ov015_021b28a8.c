typedef struct {
    char pad0[8];
    int mode;
    int state;
} Widget;

int func_ov015_021b28a8(Widget *self)
{
    int result;
    switch (self->mode) {
    case 0:
        result = self->state == 1;
        break;
    case 1:
        if (self->state == 0) result = 0;
        else result = 1;
        break;
    default:
        result = 0;
        break;
    }
    return result;
}
