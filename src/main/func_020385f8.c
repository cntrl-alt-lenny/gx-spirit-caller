typedef struct {
    int   current;
    int   target;
    short step_incr;
    short frames_left;
} anim_020385f8_t;

int func_020385f8(anim_020385f8_t *a) {
    int cur = a->current;
    int tgt = a->target;
    int step;

    if ((cur >> 8) != (tgt >> 8) || a->frames_left != 0) {
        a->frames_left--;
        if (a->frames_left <= 0) {
            a->frames_left = 0;
            a->current = tgt;
        } else {
            step = a->step_incr;
            cur += step;
            if ((step >= 0 && cur > tgt) || (step < 0 && cur < tgt)) {
                cur = tgt;
            }
            a->current = cur;
        }
        return 1;
    }
    return 0;
}
