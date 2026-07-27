/* func_ov002_022086ac: self's +2 halfword carries bit0 + a 5-bit field
 * (same F2Bits shape as func_ov002_0220c3c4/02222068); forward to a
 * sink, and if >=2, gate on a d016c flag before firing a second sink. */
struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
struct F2Bits { unsigned short b0 : 1; unsigned short f1_5 : 5; };

extern int func_ov002_021bb7f8(int bit0, int field0, int fivebit);
extern char data_ov002_022d016c[];
extern int func_ov002_021bae7c(int a, int b, int c);

int func_ov002_022086ac(struct Ov002Self *self) {
    struct F2Bits *f2 = (struct F2Bits *)((char *)self + 2);
    if (func_ov002_021bb7f8(f2->b0, self->f0, f2->f1_5) >= 2) {
        if (*(int *)(data_ov002_022d016c + 0xcf8) != 0) {
            if (func_ov002_021bae7c(1 - f2->b0, 0x178b, -1) != 0)
                return 0;
        }
    }
    return 2;
}
