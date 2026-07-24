/* func_ov011_021d0f38: idx-th record (stride 0x28) at data_ov011_021d4660;
 * the low byte of the 32-bit field at +0xc is a :8 bitfield. If it already
 * equals val (compared as a full int), return the record unchanged;
 * otherwise replace the low byte with val&0xff, store, and return the new
 * value. Read via an actual :8 bitfield (not (v<<24)>>24) so mwcc keeps the
 * lsl;lsr pair instead of folding the symmetric shift into `and #0xff`. */
typedef unsigned int u32;

struct Ov011Field { unsigned b : 8; unsigned : 24; };

struct Ov011Rec021d0f38 {
    char _pad[0xc];
    struct Ov011Field f_c;
    char _pad2[0x28 - 0xc - 4];
};

extern struct Ov011Rec021d0f38 data_ov011_021d4660[];

int func_ov011_021d0f38(int idx, int val) {
    struct Ov011Rec021d0f38 *e = &data_ov011_021d4660[idx];
    u32 v = *(u32 *)&e->f_c;
    if (val == (int)e->f_c.b)
        return v;
    v = (v & ~0xffu) | (val & 0xff);
    *(u32 *)&e->f_c = v;
    return v;
}
