/* func_ov002_022085bc: self's +2 halfword carries bit0 + a 5-bit field
 * (same F2Bits shape as func_ov002_0220c2d4/02222068); forward to a
 * sink, and if >=2, gate on a d016c flag before firing a second sink. */
struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
struct F2Bits { unsigned short b0 : 1; unsigned short f1_5 : 5; };

extern int func_ov002_021bb718(int bit0, int field0, int fivebit);
extern char data_ov002_022d008c[];
extern int func_ov002_021bad9c(int a, int b, int c);

int func_ov002_022085bc(struct Ov002Self *self) {
    struct F2Bits *f2 = (struct F2Bits *)((char *)self + 2);
    if (func_ov002_021bb718(f2->b0, self->f0, f2->f1_5) >= 2) {
        if (*(int *)(data_ov002_022d008c + 0xcf8) != 0) {
            if (func_ov002_021bad9c(1 - f2->b0, 0x178b, -1) != 0)
                return 0;
        }
    }
    return 2;
}
