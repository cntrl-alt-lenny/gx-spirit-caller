/* func_02007e70: fill a 0x50-byte stack buffer via func_020938b0, then
 * branch on data_02103fcc's mode field (+0x34). When mode==2, dispatch on
 * buf[0] via a dense switch (0,2-5 explicit; 1 falls under default along
 * with the out-of-range values) that remaps case2<->case3's return values;
 * otherwise a simple buf[0]==0 check.
 */
typedef struct {
    char _pad_034[0x34];
    int  mode;      /* +0x34 */
} state_021040ac_t;

extern state_021040ac_t data_02103fcc;
extern void func_020938b0(void *out);

int func_02007e70(void) {
    unsigned char buf[0x50];

    func_020938b0(buf);
    if (data_02103fcc.mode == 2) {
        switch (buf[0]) {
        case 2: return 3;
        case 3: return 2;
        case 4: return 4;
        case 5: return 5;
        case 0: return 0;
        default: goto return_one;
        }
    }

    switch (buf[0]) {
    case 0: return 0;
    default: goto return_one;
    }

return_one:
    return 1;
}
