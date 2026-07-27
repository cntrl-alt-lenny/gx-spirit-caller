/* func_ov002_02292454: loop i in [0,5); on a hit from the first sink,
 * chain two more calls (self->b0 and self->f0 re-read fresh each site,
 * matching the orig's repeated ldrh reloads across each bl). Returns 1
 * on the first successful chain, else 0. */
struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
extern int func_ov002_022575c8(struct Ov002Self *self, int bit0, int i);
extern int func_ov002_021c84e0(int bit0, int i);
extern int func_ov002_022536e8(int bit0, int f0, int call2result);

int func_ov002_02292454(struct Ov002Self *self) {
    int i;
    for (i = 0; i < 5; i++) {
        if (func_ov002_022575c8(self, self->b0, i) != 0) {
            int call2 = func_ov002_021c84e0(self->b0, i);
            if (func_ov002_022536e8(self->b0, self->f0, call2) != 0)
                return 1;
        }
    }
    return 0;
}
