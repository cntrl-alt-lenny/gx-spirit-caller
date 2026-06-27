/* CAMPAIGN-PREP candidate for func_0202d4a8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order + nibble-insert mask|bitfield; clone of 021c13c4 marshaller
 *   risk:       data_0219ad48[0x6c] read as ushort (lsl16;lsr16) + the 0x10f/<<5 scaling are struct-guessed; confirm field widths/offset against real struct (struct-guessed)
 *   confidence: med
 */
/* func_0202d4a8: build + submit a graphics command record for index `arg0`.
 * Structural twin of the proven func_ov006_021c13c4 (same 02091554 /
 * 02006c0c(buf,4,0) / 0201d47c / 0201e5b8 / 02006e1c marshalling chain).
 *
 * asm field stores (cmd at sp+0):
 *   cmd+0   = h                       (func_02006c0c handle)
 *   cmd+8   = -1
 *   cmd+0x14: low nibble <- (ushort)data_0219ad48[0x6c] & 0xf
 *   cmd+0xc = ((arg0<<2)+0x10f) << 5
 *   cmd+0x10= (short)((arg0+6) << 5)
 * arg1 (r1) is a short-table index into data_020be9e8. */
extern short data_020be9e8[];
extern char  data_020c6d28[];
extern char  data_0219ad48[];
extern void  func_02091554(void *out, void *a, int b);
extern int   func_02006c0c(void *p, int b, int c);
extern void  func_0201d47c(void *cmd);
extern void  func_0201e5b8(void *cmd);
extern void  func_02006e1c(int h);

int func_0202d4a8(int arg0, int arg1) {
    char cmd[40];
    char buf[32];
    int h;
    func_02091554(buf, data_020c6d28, data_020be9e8[arg1]);
    h = func_02006c0c(buf, 4, 0);
    func_0201d47c(cmd);
    *(int *)(cmd + 0) = h;
    *(int *)(cmd + 8) = -1;
    *(unsigned short *)(cmd + 0x14) =
        (*(unsigned short *)(cmd + 0x14) & ~0xf) |
        (*(unsigned short *)(data_0219ad48 + 0x6c) & 0xf);
    *(int *)(cmd + 0xc) = (((arg0 << 2) + 0x10f) << 5);
    *(short *)(cmd + 0x10) = (short)((arg0 + 6) << 5);
    func_0201e5b8(cmd);
    func_02006e1c(h);
    return h;
}
