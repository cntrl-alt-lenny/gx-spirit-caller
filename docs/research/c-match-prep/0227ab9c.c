/* CAMPAIGN-PREP candidate for func_0227ab9c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: Slot.id :13 bitfield; asymmetric shift extracts raw; header :15/:9 fields; strb 9-before-8 store-order
 *   risk:       orig keeps slot value v live in r4 and interleaves f8/f23 inserts across one RMW; the strb +0x9-then-+0x8 order and the +0x16 read-modify must not be reordered by mwcc. Field widths struct-guessed; the v-unpack math is permuter-class on reg-alloc.
 *   confidence: low
 */
/* func_ov002_0227ab9c (ov002, class D, MED) — dense bitfield-pack RMW.
 * reads a 20-byte sub-row slot from the per-player cf16c table
 * (base + (arg0&1)*0x868 + 0x30 + arg1*0x14), unpacks it, repacks into the
 * data_022cd300 packed header (bit0 player, :15 @bit8, :9 @bit23), sets +0x16
 * mode=2, +0x4=1, +0x6=0, zeroes +0x8/+0x9, then tail-calls 0227a8fc. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Hdr300 { u32 b0:1; u32 f1:4; u32 b5:1; u32 b6:1; u32 b7:1; u32 f8:15; u32 f23:9; };
struct F30016 { u16 lo8:8; u16 mode:3; u16 hi:5; };
struct Slot   { u32 id:13; };          /* lsl#19;lsr#19 -> bitfield, never (x<<19)>>19 */

extern char data_ov002_022cf16c[];     /* per-player rows, stride 0x868 */
extern char data_ov002_022cd300[];
extern void func_ov002_0227a8fc(void);

int func_ov002_0227ab9c(int a, int b)
{
    struct Hdr300 *h = (struct Hdr300 *)data_ov002_022cd300;
    char *row = data_ov002_022cf16c + (a & 1) * 0x868 + 0x30;
    u32 v = *(u32 *)(row + b * 0x14);
    h->b0 = a;
    h->b5 = 1;
    h->b6 = 0;
    h->b7 = 0;
    h->f8 = (u32)((((unsigned)(v << 2) >> 0x18) << 1) + ((unsigned)(v << 0x12) >> 0x1f));
    h->f23 = ((struct Slot *)&v)->id;
    *(u16 *)(data_ov002_022cd300 + 0x16) = (*(u16 *)(data_ov002_022cd300 + 0x16) & ~0x700) | 0x200;
    data_ov002_022cd300[9] = 0;
    data_ov002_022cd300[8] = 0;
    *(u16 *)(data_ov002_022cd300 + 4) = 1;
    *(u16 *)(data_ov002_022cd300 + 6) = 0;
    func_ov002_0227a8fc();
    return 0;
}
