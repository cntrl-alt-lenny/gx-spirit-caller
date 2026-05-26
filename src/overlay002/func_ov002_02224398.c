/* func_ov002_02224398: C-39b MMIO state == 0x80 → helper bit-check + tail.
 *
 *   if (data[0x5a8/4] == 0x80) {
 *       if (helper(bit0) != 0) return 0;
 *   }
 *   return helper2(self, arg1);
 */

struct F02224398_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02224398_Self { unsigned short f0; struct F02224398_F2 f2; };

extern int data_ov002_022ce288[];
extern int func_ov002_021bbf50(unsigned int bit);
extern int func_ov002_02210810(struct F02224398_Self *self, int arg1);

int func_ov002_02224398(struct F02224398_Self *self, int arg1) {
    if (data_ov002_022ce288[0x5a8 / 4] == 0x80) {
        if (func_ov002_021bbf50(self->f2.bit0) != 0) return 0;
    }
    return func_ov002_02210810(self, arg1);
}
