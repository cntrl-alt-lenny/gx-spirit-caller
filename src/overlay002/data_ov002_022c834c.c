/* data_ov002_022c834c (8 bytes, 4-aligned): NEW carve as part of
 * cm-data-inference-11, filling a previously-unclaimed delinks.txt gap
 * (found while resolving the neighboring data_ov002_022c8368 cluster in
 * wave 8; the gap itself never investigated until now).
 *
 * STRONG: sole consumer func_ov002_022643e8.s indexes this array via
 * `ldr r6,[sl,r1,lsl#0x2]` (word stride), where the index is a
 * DuelStateSingleton (data_ov002_022d016c) persistent counter field
 * bound-checked against #0x2 both on entry and as the loop-continuation
 * test -- the index's own structural domain proves exactly 2 elements.
 * Values (0x17ab, 0x17ac) sit inside this overlay's established
 * `unsigned int cardId` numeric range (data_ov002_022c819c.c and
 * siblings). Cross-region confirmed: USA/JPN independently derive the
 * same 8-byte boundary and byte-identical content at their own
 * (differently-based) address data_ov002_022c823c, via a structurally
 * identical consumer.
 */

const unsigned int data_ov002_022c834c[2] = {
    0x000017ab, 0x000017ac,
};
