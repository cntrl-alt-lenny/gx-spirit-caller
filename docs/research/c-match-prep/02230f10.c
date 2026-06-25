/* CAMPAIGN-PREP candidate for func_02230f10 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     state if/else-if dispatch (0x7e/7f/80), bitfield args, bind-vs-reload globals
 *   risk:       _LIT2=022d016c[+0xd44]/_LIT3=022d0e6c[+0xb2] inferred (pool truncated); if/else-if vs switch range-opt on contiguous states; return values 0x7f/0x7e/0.
 *   confidence: low
 */
/* func_ov002_02230f10: dispatch on state=*(int*)(ce288+0x5a8).
 *  0x7e: if *(u16*)(d0e6c+0xb2)!=0 -> 021df818(self,1-b0,1000) else (self,b0,1000); ret 0.
 *  0x7f: 0226b22c(b0,f1,1,*(int*)(d016c+0xd44)); ret 0x7e.
 *  0x80: if cd744[b0]==1 -> *(int*)(d016c+0xd44)=021b00d0(2) else 021ae664(0x38); ret 0x7f.
 *  else: ret 0.
 * NOTE: literal pool was truncated in the source; _LIT2/_LIT3 bases (022d016c
 * for +0xd44, 022d0e6c for +0xb2) inferred from sibling 021f5090.s + offset usage. */
typedef unsigned short u16;

struct S02230f10 { u16 f0; u16 b0 : 1; u16 f1 : 5; u16 _r : 10; };

extern char data_ov002_022ce288[];
extern int  data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021ae664(int x);
extern void func_ov002_0226b22c(int a, int b, int c, int d);
extern void func_ov002_021df818(void *self, int a, int b);

int func_ov002_02230f10(struct S02230f10 *self) {
    int state = *(int *)((char *)data_ov002_022ce288 + 0x5a8);
    if (state == 0x7e) {
        if (*(u16 *)((char *)data_ov002_022d0e6c + 0xb2) != 0)
            func_ov002_021df818(self, 1 - self->b0, 1000);
        else
            func_ov002_021df818(self, self->b0, 1000);
        return 0;
    } else if (state == 0x7f) {
        func_ov002_0226b22c(self->b0, self->f1, 1,
                            *(int *)((char *)data_ov002_022d016c + 0xd44));
        return 0x7e;
    } else if (state == 0x80) {
        if (data_ov002_022cd744[self->b0] == 1)
            *(int *)((char *)data_ov002_022d016c + 0xd44) = func_ov002_021b00d0(2);
        else
            func_ov002_021ae664(0x38);
        return 0x7f;
    }
    return 0;
}
