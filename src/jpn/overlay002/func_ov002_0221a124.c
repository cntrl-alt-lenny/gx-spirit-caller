/* func_ov002_0221a124: brief 234 — 2-helper sequence; return 0.
 *
 *   helper1(1-bit0, 1); helper2(60); return 0
 */

struct F0221a214_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};
struct F0221a214_Self {
    unsigned short pad0;
    struct F0221a214_F2 f2;
};

extern int func_ov002_021e26d0(unsigned int v, unsigned int one);
extern int func_ov002_021e2a2c(unsigned int n);

int func_ov002_0221a124(struct F0221a214_Self *self) {
    func_ov002_021e26d0(1 - self->f2.bit0, 1);
    func_ov002_021e2a2c(60);
    return 0;
}
