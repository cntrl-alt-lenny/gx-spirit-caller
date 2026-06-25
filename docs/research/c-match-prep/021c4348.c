/* CAMPAIGN-PREP candidate for func_021c4348 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT store-order + min/max-style if-guards, counted scan loop
 *   risk:       struct field offsets/types guessed; r3-as-4th-param ABI may force a different reg-alloc
 *   confidence: low
 */
/* func_ov006_021c4348: clear out->{0,4,8}, scan 8 entries of
 * data_ov006_021cde48 (stride 0xc): shorts at +0/+2/+4/+6, word at +8.
 * Hit when x>=e0 && y>=e2 && x<=e4 && y<=e6 -> out[0]=1, out[1]=e[8].
 * No hit -> out[0]=0. First param is unused (clobbered scratch).
 *
 *   str ip,[r3]; str ip,[r3,#4]; str ip,[r3,#8]   (zero in this order)
 *   loop 8x stride 0xc over data_ov006_021cde48
 */

extern short data_ov006_021cde48[];

typedef struct {
    short x0;
    short y0;
    short x1;
    short y1;
    int   val;
} Box;

int func_ov006_021c4348(int unused, int x, int y, int *out) {
    Box *e = (Box *)data_ov006_021cde48;
    int i;
    out[0] = 0;
    out[1] = 0;
    out[2] = 0;
    for (i = 0; i < 8; i++) {
        if (x >= e[i].x0 && y >= e[i].y0 && x <= e[i].x1 && y <= e[i].y1) {
            out[0] = 1;
            out[1] = *(int *)((char *)&e[i] + 0x8);
            return *(int *)out; /* falls through to ldmia; value irrelevant */
        }
    }
    out[0] = 0;
    return 0;
}
