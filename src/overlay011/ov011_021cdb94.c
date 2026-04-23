/* func_ov011_021cdb94: bit-clear 0x20000 on data_ov011_021d4000+0x2ac.
 * Sibling of ov011_021ca67c (brief 005). */

typedef struct {
    char _pad[0x2ac];
    unsigned int flags;
} ov011_state_2ac_t;

extern ov011_state_2ac_t data_ov011_021d4000;

void func_ov011_021cdb94(void) {
    data_ov011_021d4000.flags &= ~0x20000u;
}
