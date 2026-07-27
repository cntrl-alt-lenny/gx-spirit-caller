/* func_ov002_021f13ec: if self+0xa is set, forward straight through;
 * else guard on func_ov002_021efa38 then scan k=0..4 (skipping arg2). */
extern int func_ov002_021efa38(void *self);
extern int func_ov002_021efe44(void *self, int arg1, int k);

int func_ov002_021f13ec(void *self, int arg1, int arg2) {
    int k;
    if (*(unsigned short *)((char *)self + 0xa) != 0) {
        return func_ov002_021efe44(self, arg1, arg2);
    }
    if (func_ov002_021efa38(self) != 0) {
        for (k = 0; k <= 4; k++) {
            if (arg2 == k) continue;
            if (func_ov002_021efe44(self, arg1, k) != 0) return 1;
        }
    }
    return 0;
}
