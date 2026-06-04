/* func_ov021_021ab090: per-frame sub-state machine (+0x38) with a per-state frame
 * counter (+0x40). State 0 waits 3 frames then opens (→1); state 1 runs the
 * intro until its done-flag (+0x3c) trips (→2); state 2 runs the loop until the
 * flag trips (→1); state 3 is done (returns 0). Non-terminal states bump +0x40
 * and return 1. (ov021_core.h) */
extern void func_ov021_021ab150(void *);
extern void func_ov021_021ab3fc(void *);
extern void func_ov021_021ab6c0(void *);
int func_ov021_021ab090(void *o) {
    switch (*(int *)((char *)o + 0x38)) {
    case 0:
        if (*(int *)((char *)o + 0x40) == 3) {
            func_ov021_021ab150(o);
            *(int *)((char *)o + 0x38) = 1;
            *(int *)((char *)o + 0x40) = 0;
        }
        break;
    case 1:
        func_ov021_021ab3fc(o);
        if (*(int *)((char *)o + 0x3c) != 0) {
            *(int *)((char *)o + 0x3c) = 0;
            *(int *)((char *)o + 0x38) = 2;
            *(int *)((char *)o + 0x40) = 0;
        }
        break;
    case 2:
        func_ov021_021ab6c0(o);
        if (*(int *)((char *)o + 0x3c) != 0) {
            *(int *)((char *)o + 0x3c) = 0;
            *(int *)((char *)o + 0x38) = 1;
            *(int *)((char *)o + 0x40) = 0;
        }
        break;
    case 3:
        return 0;
    }
    *(int *)((char *)o + 0x40) += 1;
    return 1;
}
