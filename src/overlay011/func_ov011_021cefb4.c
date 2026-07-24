/* func_ov011_021cefb4: read two u16s from data_021d33bc (+0x52,+0x54),
 * <<12, and scatter into data_021d4000 fields in the asm's store order:
 *   h0=[33bc+0x52]<<12; h1=[33bc+0x54]<<12;
 *   [4000+0x258]=h0; [4000+0x25c]=h1; [4000+0x254]=0x1000;
 *   [4000+0x2ac] &= ~0x20000;  [4000+0x26c]=h0; [4000+0x270]=h1
 * Modeled as struct-member access (not pointer-cast) so mwcc keeps
 * [base,#off] addressing with ONE base reg instead of folding offsets
 * into separate per-field pool constants. */
struct Ov011Src33bc {
    char pad0[0x52];
    unsigned short field_52;
    unsigned short field_54;
};
extern struct Ov011Src33bc data_ov011_021d33bc;

struct Ov011Dst4000b {
    char pad0[0x254];
    unsigned int field_254;
    unsigned int field_258;
    unsigned int field_25c;
    char pad1[0x26c - 0x260];
    unsigned int field_26c;
    unsigned int field_270;
    char pad2[0x2ac - 0x274];
    unsigned int field_2ac;
};
extern struct Ov011Dst4000b data_ov011_021d4000;

void func_ov011_021cefb4(void) {
    unsigned int h0 = (unsigned int)data_ov011_021d33bc.field_52 << 12;
    unsigned int h1 = (unsigned int)data_ov011_021d33bc.field_54 << 12;
    data_ov011_021d4000.field_258 = h0;
    data_ov011_021d4000.field_25c = h1;
    data_ov011_021d4000.field_254 = 0x1000;
    data_ov011_021d4000.field_2ac &= ~0x20000;
    data_ov011_021d4000.field_26c = h0;
    data_ov011_021d4000.field_270 = h1;
}
