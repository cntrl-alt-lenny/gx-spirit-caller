/* func_ov011_021cf048: bit-clear 0xc0000 on data_ov011_021d4000+0x2ac.
 * Sibling of ov011_021cdb94 (this PR) with different mask. */

typedef struct {
    char _pad[0x2ac];
    unsigned int flags;
} ov011_state_2ac_t;

extern ov011_state_2ac_t data_ov011_021d4000;

void func_ov011_021cf048(void) {
    data_ov011_021d4000.flags &= ~0xc0000u;
}
