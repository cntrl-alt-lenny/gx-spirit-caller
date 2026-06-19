/* func_ov002_0220d084: C-39b tag-check skip + helper + tail-call.
 *
 *   if (self->f2.tag6 != 0x23) {
 *       if (helper1(bit0, TAG) != 0) return 0;
 *   }
 *   return helper2(self, arg1);
 */

struct F0220d174_F2 {
    unsigned short bit0 : 1;
    unsigned short pad  : 5;
    unsigned short tag6 : 6;
    unsigned short rest : 4;
};
struct F0220d174_Self { unsigned short f0; struct F0220d174_F2 f2; };

extern int func_ov002_021bbf20(unsigned int bit, int (*fnref)(int));
extern int func_ov002_021ff37c(struct F0220d174_Self *self, int arg1);
extern int func_0202ed3c(int);

int func_ov002_0220d084(struct F0220d174_Self *self, int arg1) {
    if (self->f2.tag6 != 0x23) {
        if (func_ov002_021bbf20(self->f2.bit0, func_0202ed3c) != 0) return 0;
    }
    return func_ov002_021ff37c(self, arg1);
}
