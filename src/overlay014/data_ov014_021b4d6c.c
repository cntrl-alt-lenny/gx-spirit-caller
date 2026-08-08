/* data_ov014_021b4d6c (12 bytes, 4-aligned): HitRect entry 3 of the
 * 6-member data_ov014_021b4d48 array family (see that file for the full
 * family evidence). Reuses the `HitRect` typedef from
 * src/overlay014/Ov014_HitTestPrimary.c.
 *
 * Single reader (matches the census): func_ov014_021b2908, literal-pool
 * word at src/overlay014/func_ov014_021b2908.s:153 (`.L_021b2ee0`), used
 * :153-169 (same hit-test-then-extra-fields pattern). relocs.txt:114
 * (from:0x021b2ee0 kind:load to:0x021b4d6c module:overlay(14)).
 *
 * Bytes: x=176 y=104 w=35 h=40 pad6={2,0,0,0} attr=0x0200. Section:
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

HitRect data_ov014_021b4d6c = {
    176, 104, 35, 40, {0x02, 0x00, 0x00, 0x00}, 0x0200
};
