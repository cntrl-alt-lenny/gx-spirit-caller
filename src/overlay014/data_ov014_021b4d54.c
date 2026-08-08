/* data_ov014_021b4d54 (12 bytes, 4-aligned): HitRect entry 1 of the
 * 6-member data_ov014_021b4d48 array family (see that file for the full
 * family evidence: func_ov014_021b2908 / Ov014_DrawPaneAHUD processes
 * all 6 elements near-identically; func_ov014_021b3568 loops over the
 * whole array with a proven 12-byte stride). Reuses the `HitRect`
 * typedef from src/overlay014/Ov014_HitTestPrimary.c.
 *
 * Single reader (matches the census): func_ov014_021b2908, literal-pool
 * word at src/overlay014/func_ov014_021b2908.s:82 (`.L_021b2ed8`), used
 * :82-97 (same hit-test-then-extra-fields pattern as entry 0).
 * relocs.txt:112 (from:0x021b2ed8 kind:load to:0x021b4d54
 * module:overlay(14)).
 *
 * Bytes: x=176 y=56 w=35 h=40 pad6={2,0,0,0} attr=0x0100. Section:
 * ov014 .data (delinks.txt) -- kept non-const.
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
    unsigned char pad6[4];
    unsigned short attr;
} HitRect;

HitRect data_ov014_021b4d54 = {
    176, 56, 35, 40, {0x02, 0x00, 0x00, 0x00}, 0x0100
};
