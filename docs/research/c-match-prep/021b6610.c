/* CAMPAIGN-PREP candidate for func_021b6610 (ov017, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dense switch -> jump table of plain stores; reload-vs-bind two globals
 *   risk:       two pool .word order and per-case bind-vs-reload of the two globals; strh vs str widths must match exactly
 *   confidence: med
 */
/* func_ov017_021b6610: dispatch on self->f4 (0..3), each case copies self->f60
 * into a different field of data_ov017_021b8894 and writes a distinct event
 * mask (0xd8) into data_ov017_021b8994. Returns 1.
 */

extern char data_ov017_021b8894[];
extern char data_ov017_021b8994[];

int func_ov017_021b6610(char *self) {
    switch (*(int *)(self + 0x4)) {
    case 0:
        *(unsigned char *)(data_ov017_021b8894 + 0x1ce) = *(int *)(self + 0x60);
        *(unsigned short *)(data_ov017_021b8994 + 0xd8) = 4;
        break;
    case 1:
        *(unsigned char *)(data_ov017_021b8894 + 0x1cf) = *(int *)(self + 0x60);
        *(unsigned short *)(data_ov017_021b8994 + 0xd8) = 8;
        break;
    case 2:
        *(unsigned short *)(data_ov017_021b8994 + 0xd0) = *(int *)(self + 0x60);
        *(unsigned short *)(data_ov017_021b8994 + 0xd8) = 0x10;
        break;
    case 3:
        *(int *)(data_ov017_021b8894 + 0x1d4) = *(int *)(self + 0x60);
        *(unsigned short *)(data_ov017_021b8994 + 0xd8) = 0x40;
        break;
    }
    return 1;
}
