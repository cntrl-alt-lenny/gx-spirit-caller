/* func_ov006_021be7e0: gate on self->f40==1 && self->f74!=0; when both
 * hold, compute a countdown = 0x2a30 - ((data_02103fcc.f38 + self->f68) -
 * self->f64), wrapping the difference into [0,0x10000) on underflow, and
 * clamp the result to a minimum of -1. Returns 0 when the gate fails. */
extern char data_02103fcc[];

int func_ov006_021be7e0(char *self) {
    int diff, result;

    if (*(int *)(self + 0x40) != 1 || *(int *)(self + 0x74) == 0) return 0;

    diff = (*(int *)(data_02103fcc + 0x38) + *(int *)(self + 0x68)) - *(int *)(self + 0x64);
    if (diff < 0) diff += 0x10000;
    result = 0x2a30 - diff;
    if (result < -1) result = -1;
    return result;
}
