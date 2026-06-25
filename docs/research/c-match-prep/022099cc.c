/* CAMPAIGN-PREP candidate for func_022099cc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested do-while; bind per-player row base; addne count on packed-mismatch
 *   risk:       permuter-class: 10-register frame (r4-fp all live: count, base, mla product, j, rowp) - mwcc reg-alloc/decl-order likely rotates which callee-saved holds count/rowp vs orig. Row field split also struct-guessed.
 *   confidence: low
 */
/* func_ov002_022099cc: nested loop (player p in [0,2), slot j in [0,10]) counting
 * rows where func_ov002_022575c8(self,p,j)!=0 AND packed (field6*2+bit13) of the
 * row word (+0x30, stride 0x14) != self->f4-decoded field9; return count>=2. */
typedef unsigned short u16;

struct Row022099cc { unsigned int b0_21 : 22; unsigned int field6 : 8; unsigned int hi : 2; };

extern char data_ov002_022cf16c[];
extern int func_ov002_022575c8(void *self, int p, int j);

int func_ov002_022099cc(void *self) {
    int count = 0;
    int p = 0;
    do {
        char *rowp = data_ov002_022cf16c + (p & 1) * 0x868 + 0x30;
        int j = 0;
        do {
            if (func_ov002_022575c8(self, p, j) != 0) {
                struct Row022099cc *r = (struct Row022099cc *)rowp;
                u16 f4 = *(u16 *)((char *)self + 4);
                if ((unsigned int)((f4 << 17) >> 23) != (unsigned int)(r->field6 * 2 + (r->b0_21 >> 13 & 1)))
                    count++;
            }
            j++;
            rowp += 0x14;
        } while (j <= 10);
        p++;
    } while (p < 2);
    return count >= 2;
}
