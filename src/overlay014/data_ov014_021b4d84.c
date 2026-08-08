/* data_ov014_021b4d84 (12 bytes, 4-aligned): HitRect entry 5 (last) of
 * the 6-member data_ov014_021b4d48 array family (see that file for the
 * full family evidence). Reuses the `HitRect` typedef from
 * src/overlay014/Ov014_HitTestPrimary.c.
 *
 * Single reader (matches the census): func_ov014_021b2908, literal-pool
 * word at src/overlay014/func_ov014_021b2908.s:224 (`.L_021b2ee8`), used
 * :224-243 (same pattern) and again at :367-399 as a FIXED (not
 * dynamically indexed) base for a second, inner 3-iteration loop
 * emitting 3 OAM sub-tiles for this one element -- consistent with it
 * being the odd-one-out (singleton, attr high byte 3, no paired sibling,
 * width 162 vs the others' 35/72, so it needs more sub-tiles). relocs.txt
 * :116 (from:0x021b2ee8 kind:load to:0x021b4d84 module:overlay(14)).
 *
 * Bytes: x=44 y=156 w=162 h=26 pad6={2,0,0,0} attr=0x0300. Section:
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

HitRect data_ov014_021b4d84 = {
    44, 156, 162, 26, {0x02, 0x00, 0x00, 0x00}, 0x0300
};
