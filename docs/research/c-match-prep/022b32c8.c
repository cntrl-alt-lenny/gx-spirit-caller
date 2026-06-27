/* CAMPAIGN-PREP candidate for func_022b32c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: mla palette unpack ((g-1)*10+r), 3-way build branch, struct stores.
 *   risk:       asm is TRUNCATED at `str r4,[sp]` (~half of 364B unseen); whole descriptor-fill tail + exact struct offsets unknown. struct-guessed; will not match without full asm.
 *   confidence: low
 */
/* func_ov002_022b32c8 - palette/cell builder (size 364, asm TRUNCATED in
 * batch at `str r4,[sp]`). Visible structure: store val at obj[idx].f34,
 * early-out if obj->f4==0, branch on obj[idx].f2c, three-way palette unpack
 * feeding func_02091554, then 02006b10 / 02006c0c / 0201d47c descriptor
 * fill. Tail beyond `str r4,[sp]` is UNKNOWN -> scaffold only. */

struct ov002_obj {
    int f0;
    int f4;          /* 0x04 enable flag */
};

struct ov002_slot {
    char pad[0x2c];
    int  f2c;        /* 0x2c */
    int  f30;
    int  f34;        /* 0x34 stored val */
};

struct pal_desc { int raw[0x20]; };

extern unsigned short data_021040ac[];   /* { ... f4: which-bank } at [_LIT0] */
extern unsigned int   data_02104f4c[];   /* table[val] (_LIT2) */
extern unsigned int   data_ov002_022cc92c;
extern unsigned int   data_ov002_022cca9c;
extern unsigned int   data_ov002_022ccabc;
extern unsigned int   data_ov002_022ccadc;
extern unsigned int   data_ov002_022cd73c;
extern void func_02006b10(struct pal_desc *d);
extern int  func_02006c0c(struct pal_desc *d, int a, int b);
extern void func_02006e1c(int handle);
extern void func_0201d47c(void *d);
extern void func_0201e5b8(void *d);
extern void func_02091554(struct pal_desc *d, int a, int b, void *src);

struct lit0 { int f0; int f4; };
extern struct lit0 data_021040ac_hdr;   /* placeholder for [_LIT0,#4] */

extern unsigned short g_palstate[];      /* [_LIT1,#0xba8] / [_LIT4,#0xa64] */

void func_ov002_022b32c8(struct ov002_obj *obj, int idx, int val)
{
    struct pal_desc desc;
    struct ov002_slot *slot;
    int handle;
    unsigned short rgb;
    int r, g, b, palidx;

    slot = (struct ov002_slot *)((char *)obj + idx * 4);
    slot->f34 = val;
    if (obj->f4 == 0) return;

    if (slot->f2c != 0) {
        func_02091554(&desc, 0, ((int *)data_02104f4c)[val], &data_ov002_022cd73c);
    } else if (idx == (((struct lit0 *)&data_021040ac_hdr)->f4 ^ 1)) {
        rgb = g_palstate[0xba8 / 2];
        g = (rgb & 0x3e0) >> 5;
        r = rgb & 0x1f;
        palidx = (g - 1) * 0xa + r;
        func_02091554(&desc, palidx, ((int *)data_02104f4c)[val], &data_ov002_022cc92c);
    } else {
        rgb = g_palstate[0xa64 / 2];
        g = (rgb & 0x3e0) >> 5;
        r = rgb & 0x1f;
        palidx = (g - 1) * 0xa + r;
        func_02091554(&desc, palidx, ((int *)data_02104f4c)[val], &data_ov002_022cca9c);
    }

    if (func_02006b10(&desc), 0) { }
    handle = func_02006c0c(&desc, 4, 0);
    func_0201d47c(&desc);
    (void)handle;
    /* TAIL TRUNCATED in source batch - cannot complete */
}
