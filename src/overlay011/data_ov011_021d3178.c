/* data_ov011_021d3178 (16 bytes, 4-aligned): BOUNDARY FIX as part of
 * cm-data-inference-7 -- was wrongly declared as 96 opaque bytes
 * (mechanical "Cluster C Pattern 1" carve, never checked for embedded
 * pointers). relocs.txt proves this symbol's own base address has a
 * relocation ON it: it is actually record 8 (the last) of a real
 * 144-byte, 9-record pointer table -- see sibling data_ov011_021d30f8.c
 * (records 0-3) and data_ov011_021d3138.c (records 4-7) for the rest.
 * Address and record-8 content are UNCHANGED; only the declared size
 * shrinks to this record's real 16 bytes. The trailing 80 bytes this
 * file used to also claim (offset 16-95, i.e. 0x021d3188-0x021d31d8)
 * are NOT part of this object -- no relocations there, genuinely
 * separate, opaque non-pointer data -- and now live in their own new
 * file, data_ov011_021d3188.c.
 *
 * Raw address-literal casts, not `&symbol` -- see data_ov011_021d30f8.c
 * for why (section-placement: a real relocation would push this global
 * into `.data`, but ground truth requires `.rodata`).
 *
 * Already-matched sole consumer func_ov011_021caafc.c:20-21: `extern
 * char data_ov011_021d3178[]; ... *(unsigned char *)(data_ov011_021d3178
 * + ((row) << 4) + (v - 1))` -- computed-stride, `<<4` = x16 stride,
 * confirming the 16-byte record size directly and independently of the
 * relocs.txt reconstruction. `data_ov011_021d3177` (dsd's own 1-byte
 * "ghost" symbol immediately before this one, at row=0/v=0 in this
 * same formula) is the compile-time-folded proof that v==0 is a real,
 * reachable case -- see data_ov011_021d3138.c for that symbol's
 * disposition.
 */

void *const data_ov011_021d3178[4] = {
    (void *)0x021d3b5c, (void *)0x021d3b20, (void *)0x021d3a58, (void *)0x021d3a80,  /* record 8 */
};
