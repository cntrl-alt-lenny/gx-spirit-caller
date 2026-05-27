/* func_ov002_0228aba0: brief 236 C-39e — sibling of 0228ab68 (cmp #23).
 *
 * Same shape, helper != 23 check.
 */

struct F0228aba0_Self {
    unsigned short pad0;
};

struct F0228aba0_Arg {
    unsigned short f0;
};

extern int func_0202b878(unsigned short f0);
extern int func_ov002_0228a974(struct F0228aba0_Self *self, struct F0228aba0_Arg *arg1);

int func_ov002_0228aba0(struct F0228aba0_Self *self, struct F0228aba0_Arg *arg1) {
    if (arg1 == 0) return 0;
    if (func_0202b878(arg1->f0) != 23) return 0;
    return func_ov002_0228a974(self, arg1);
}
