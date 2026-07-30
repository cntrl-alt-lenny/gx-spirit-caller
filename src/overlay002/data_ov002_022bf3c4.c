/* data_ov002_022bf3c4 (5376 bytes, 4-aligned): retyped from opaque
 * unsigned int[1344] to a typed struct array (cm-data-inference, this wave).
 * This is the third and last member of the ov002 "INDIRECT-DISPATCH FAMILY"
 * / "Cluster C Pattern 1" 6-word card-effect dispatch table set -- the
 * other two (data_ov002_022be1ac, 193 records; data_ov002_022c357c, 812
 * records) were already retyped to this exact struct shape under
 * cm-data-inference-2 batches 3 and 4; data_ov002_022c357c.c's own header
 * comment explicitly names this symbol as one of "the other two, out of
 * scope for this item and left untouched" -- this wave resolves that
 * deferral. See also docs/research/data/Ov002DataComplete.md (independently
 * catalogs this exact 224-record/24-byte-stride shape) and
 * docs/research/xref/DataToFunction.md (calls this table "set B" of the
 * same 3-table dispatch directory).
 *
 * Evidence: sole consumer is the still-unmatched
 * src/overlay002/func_ov002_02257464.s, a shared 4-way dispatcher/binary
 * search helper used by all 3 sibling tables (plus a 4th, data_ov002_022c08c4,
 * for a distinct record shape) that computes `mov ip, #0x18` (24) then
 * `mul r3, lr, ip; ldr r3, [r1, r3]` -- a genuine idx*24 computed stride --
 * and returns a POINTER TO THE MATCHED RECORD (`add r0, r1, r3`), not a
 * single field. The default-case dispatch arm loads this table with
 * `hi = 0xdf` (223); since the driver's binary-search loop only ever
 * probes indices < hi and the post-loop code unconditionally reads
 * table[lo] (lo can reach hi itself), the real record count is hi+1 = 224,
 * matching 5376/24 = 224 exactly. This "hi = count-1" convention is
 * independently cross-confirmed against BOTH already-shipped siblings'
 * own real declared sizes: data_ov002_022c357c's hi=0x32b(811)=812-1, and
 * data_ov002_022be1ac's hi=0xc0(192)=193-1 -- both exactly matching.
 *
 * Corroborated far beyond the consumer's stride constant alone: every one
 * of the 836 relocations whose source address falls inside this blob's
 * byte range lands at record-relative offset in {4,8,12,16,20} with zero
 * anomalies (checked systematically for all 224 records / 1344 words) --
 * offset 0 (the id field) never carries a relocation (224/224 nonzero,
 * 0/224 reloc'd) while offsets 4/8/12/16/20 carry a relocation on every
 * single nonzero occurrence and never on a zero one (e.g. offset 8:
 * 113/224 nonzero, 113/224 reloc'd). Exactly 1 relocation targets this
 * blob from outside it (from func_ov002_02257464 itself, loading the base
 * address for the dispatch). All 319 distinct non-zero pointer values
 * across the 5 handler fields resolve exactly to the start address of a
 * real kind:function symbol in config/eur/arm9/overlays/ov002/symbols.txt
 * (0 misses, 0 mid-function, 0 unresolvable) -- several of those functions
 * are themselves named siblings of the consumer (e.g. func_ov002_02257454,
 * func_ov002_0225745c). The id field (offset 0) is strictly sorted
 * ascending across all 224 records with zero duplicates, ranging
 * 0x0fb6-0x1b4e (consistent with a binary-search key over card IDs, and
 * with the immediately preceding sibling table data_ov002_022be1ac's own
 * 0x0fd6-0x1b4a id range).
 *
 * No other consumer exists anywhere in the repo (src/, libs/, all
 * regions): grepping the whole tree for the symbol name finds only this
 * file and the .s driver's .extern/.word references.
 *
 * Field names are placeholders (id + handler1..5) -- no semantic names
 * recovered beyond "function pointer", matching the established
 * convention from both sibling retypes (same field count, same names,
 * same offsets). Pointer fields are emitted as raw (void *)0x... literal-
 * address casts rather than symbol references, matching this project's
 * const-placement rule (ground truth section is .rodata per delinks.txt:
 * `.rodata start:0x022bf3c4 end:0x022c08c4`; a literal cast avoids the
 * &symbol-forces-.data behavior an extern reference would trigger) and
 * exactly reproducing both siblings' already-shipped representation.
 *
 * Byte content is an exact reinterpretation of the same bytes previously
 * shipped as `const unsigned int data_ov002_022bf3c4[1344]` -- this
 * retype changes only the C-level type, not any byte value. Verified by
 * script (never hand-transcribed): read directly from
 * extract/eur/arm9_overlays/ov002.bin at file offset
 * (0x022bf3c4 - 0x021aa4a0 text base) = 0x114f24, confirmed byte-identical
 * to the prior committed literal, and the generated initializer below was
 * round-trip re-parsed and confirmed to reproduce the exact original 5376
 * ROM bytes before being written here.
 */
typedef struct {
    unsigned int id;         /* offset 0x00 */
    void *handler1;           /* offset 0x04 */
    void *handler2;            /* offset 0x08 */
    void *handler3;             /* offset 0x0C */
    void *handler4;              /* offset 0x10 */
    void *handler5;               /* offset 0x14 */
} RecordOv002_022bf3c4;

const RecordOv002_022bf3c4 data_ov002_022bf3c4[224] = {
    { 0x0fb6, (void *)0x02210ce8, (void *)0x021e96a0, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x0fff, (void *)0x02210104, (void *)0x021e8a58, (void *)0x00000000, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x10ac, (void *)0x02211a74, (void *)0x00000000, (void *)0x021ff6d0, (void *)0x021f4d3c, (void *)0x00000000 },
    { 0x1119, (void *)0x02212300, (void *)0x00000000, (void *)0x021ff7d8, (void *)0x021f4e70, (void *)0x0223fd54 },
    { 0x111a, (void *)0x02212300, (void *)0x00000000, (void *)0x021ff7d8, (void *)0x021f4e70, (void *)0x0223fd54 },
    { 0x111b, (void *)0x02212300, (void *)0x00000000, (void *)0x021ff7d8, (void *)0x021f4e70, (void *)0x0223fd54 },
    { 0x1138, (void *)0x02212394, (void *)0x00000000, (void *)0x021ff500, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x114a, (void *)0x02212488, (void *)0x00000000, (void *)0x021ff400, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x1153, (void *)0x022127b4, (void *)0x00000000, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x11a0, (void *)0x02212a54, (void *)0x00000000, (void *)0x021ff91c, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x11a6, (void *)0x02210104, (void *)0x00000000, (void *)0x021ff668, (void *)0x021f5180, (void *)0x00000000 },
    { 0x1232, (void *)0x02218068, (void *)0x00000000, (void *)0x021ffa80, (void *)0x021f526c, (void *)0x00000000 },
    { 0x1281, (void *)0x022140cc, (void *)0x021e7868, (void *)0x021fffa8, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1284, (void *)0x022140cc, (void *)0x021e7868, (void *)0x021fffa8, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x128d, (void *)0x0221454c, (void *)0x021e7748, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x128e, (void *)0x0220e74c, (void *)0x021eb530, (void *)0x02206454, (void *)0x021f8214, (void *)0x0223f684 },
    { 0x1295, (void *)0x02211a74, (void *)0x00000000, (void *)0x022000c0, (void *)0x021f84c8, (void *)0x00000000 },
    { 0x12f3, (void *)0x0221671c, (void *)0x00000000, (void *)0x0220079c, (void *)0x021f60fc, (void *)0x00000000 },
    { 0x1337, (void *)0x02211a74, (void *)0x00000000, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x1386, (void *)0x0220e75c, (void *)0x021e96a0, (void *)0x02203648, (void *)0x021f6754, (void *)0x00000000 },
    { 0x138a, (void *)0x0221af90, (void *)0x00000000, (void *)0x022024a8, (void *)0x021f6378, (void *)0x02241bf8 },
    { 0x13a7, (void *)0x0221b5ac, (void *)0x00000000, (void *)0x022026f0, (void *)0x021f639c, (void *)0x00000000 },
    { 0x13a8, (void *)0x02210104, (void *)0x021ec110, (void *)0x00000000, (void *)0x021f63e0, (void *)0x00000000 },
    { 0x1402, (void *)0x0221cef4, (void *)0x021f27b4, (void *)0x02202bec, (void *)0x00000000, (void *)0x0223f684 },
    { 0x1421, (void *)0x0221dd08, (void *)0x00000000, (void *)0x02203290, (void *)0x021f6544, (void *)0x00000000 },
    { 0x1436, (void *)0x0221e2a4, (void *)0x021ed1f8, (void *)0x022033cc, (void *)0x00000000, (void *)0x00000000 },
    { 0x143b, (void *)0x0221cef4, (void *)0x021f27b4, (void *)0x02202bec, (void *)0x00000000, (void *)0x0223f684 },
    { 0x1449, (void *)0x0221eb58, (void *)0x00000000, (void *)0x02203580, (void *)0x021f6704, (void *)0x00000000 },
    { 0x144b, (void *)0x02210104, (void *)0x00000000, (void *)0x02203648, (void *)0x021f6754, (void *)0x00000000 },
    { 0x144c, (void *)0x0221eb58, (void *)0x00000000, (void *)0x02203580, (void *)0x021f6704, (void *)0x00000000 },
    { 0x1452, (void *)0x0221eb58, (void *)0x00000000, (void *)0x02203580, (void *)0x021f6704, (void *)0x00000000 },
    { 0x1455, (void *)0x02210104, (void *)0x00000000, (void *)0x02203648, (void *)0x021f6754, (void *)0x00000000 },
    { 0x1457, (void *)0x0221eb58, (void *)0x00000000, (void *)0x02203580, (void *)0x021f6704, (void *)0x00000000 },
    { 0x146f, (void *)0x0221fafc, (void *)0x021ed4c0, (void *)0x02203864, (void *)0x021f6814, (void *)0x00000000 },
    { 0x1476, (void *)0x02210810, (void *)0x00000000, (void *)0x021ff46c, (void *)0x00000000, (void *)0x00000000 },
    { 0x147f, (void *)0x0220e75c, (void *)0x021edf2c, (void *)0x022039a4, (void *)0x021f691c, (void *)0x00000000 },
    { 0x1482, (void *)0x02220288, (void *)0x00000000, (void *)0x02203a40, (void *)0x021f699c, (void *)0x00000000 },
    { 0x148c, (void *)0x022101c4, (void *)0x00000000, (void *)0x02200908, (void *)0x021f6378, (void *)0x00000000 },
    { 0x1490, (void *)0x022209b4, (void *)0x021edd4c, (void *)0x02203b8c, (void *)0x021f6c60, (void *)0x00000000 },
    { 0x149c, (void *)0x0223be40, (void *)0x00000000, (void *)0x0223bdb8, (void *)0x00000000, (void *)0x00000000 },
    { 0x14b6, (void *)0x0222196c, (void *)0x00000000, (void *)0x02200908, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x14b8, (void *)0x02221a38, (void *)0x021ee23c, (void *)0x02204168, (void *)0x021f6378, (void *)0x00000000 },
    { 0x14b9, (void *)0x02225274, (void *)0x021e8fcc, (void *)0x02204168, (void *)0x021f6378, (void *)0x0223f684 },
    { 0x14c2, (void *)0x02216424, (void *)0x00000000, (void *)0x02204084, (void *)0x021f60fc, (void *)0x02242abc },
    { 0x14c5, (void *)0x0220e74c, (void *)0x021eed74, (void *)0x00000000, (void *)0x021f52f0, (void *)0x0223f684 },
    { 0x14c7, (void *)0x02221e3c, (void *)0x00000000, (void *)0x02200908, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x14cb, (void *)0x0220e74c, (void *)0x021eee20, (void *)0x02204168, (void *)0x021f6378, (void *)0x0223f684 },
    { 0x14d7, (void *)0x02211a74, (void *)0x00000000, (void *)0x02204290, (void *)0x021f8fc0, (void *)0x00000000 },
    { 0x14dc, (void *)0x02211a74, (void *)0x00000000, (void *)0x02204330, (void *)0x021fa5e8, (void *)0x00000000 },
    { 0x14de, (void *)0x02222068, (void *)0x00000000, (void *)0x02204380, (void *)0x021f60fc, (void *)0x00000000 },
    { 0x1507, (void *)0x02222df8, (void *)0x00000000, (void *)0x02204768, (void *)0x00000000, (void *)0x00000000 },
    { 0x1508, (void *)0x02222df8, (void *)0x00000000, (void *)0x02204768, (void *)0x00000000, (void *)0x00000000 },
    { 0x1517, (void *)0x02223440, (void *)0x00000000, (void *)0x02204840, (void *)0x021f60fc, (void *)0x00000000 },
    { 0x1527, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x1528, (void *)0x02223d78, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x1529, (void *)0x02211b64, (void *)0x00000000, (void *)0x02204bdc, (void *)0x021f6378, (void *)0x00000000 },
    { 0x152a, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x152b, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x152c, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x152d, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x152e, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x1533, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x1534, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x1535, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x153b, (void *)0x02224398, (void *)0x00000000, (void *)0x02204e20, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x154c, (void *)0x02211a74, (void *)0x00000000, (void *)0x02204fa8, (void *)0x00000000, (void *)0x00000000 },
    { 0x1561, (void *)0x02224c18, (void *)0x00000000, (void *)0x02205080, (void *)0x00000000, (void *)0x00000000 },
    { 0x1565, (void *)0x02210104, (void *)0x00000000, (void *)0x021ff668, (void *)0x021f5180, (void *)0x00000000 },
    { 0x158c, (void *)0x02210104, (void *)0x021ef6f4, (void *)0x00000000, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x1599, (void *)0x02225788, (void *)0x00000000, (void *)0x022056f0, (void *)0x021f5824, (void *)0x00000000 },
    { 0x15b0, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x15b1, (void *)0x0220e74c, (void *)0x021eeb6c, (void *)0x021ff354, (void *)0x021f4a00, (void *)0x0223f684 },
    { 0x15b3, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x15b4, (void *)0x0220e74c, (void *)0x021f162c, (void *)0x021ff354, (void *)0x021f4a00, (void *)0x0223f684 },
    { 0x15bc, (void *)0x022245d8, (void *)0x00000000, (void *)0x02205bbc, (void *)0x021fab74, (void *)0x00000000 },
    { 0x15ce, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x15cf, (void *)0x02226b4c, (void *)0x021e8a18, (void *)0x02205ca0, (void *)0x021f81a4, (void *)0x0224326c },
    { 0x15d1, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x15d3, (void *)0x02226c08, (void *)0x021e8a18, (void *)0x02205d20, (void *)0x021f81a4, (void *)0x0224326c },
    { 0x15d5, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x15d6, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x15d7, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x15d8, (void *)0x022140cc, (void *)0x021ec1a4, (void *)0x02205d70, (void *)0x00000000, (void *)0x0223f684 },
    { 0x15df, (void *)0x02226e8c, (void *)0x00000000, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x15e0, (void *)0x0222706c, (void *)0x00000000, (void *)0x02205e08, (void *)0x021f6378, (void *)0x00000000 },
    { 0x15e2, (void *)0x02210810, (void *)0x00000000, (void *)0x02205f30, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x15ee, (void *)0x02210104, (void *)0x00000000, (void *)0x02206024, (void *)0x021f81cc, (void *)0x00000000 },
    { 0x15f9, (void *)0x0220e74c, (void *)0x021eea90, (void *)0x021ff354, (void *)0x021f4a00, (void *)0x0223f684 },
    { 0x15fa, (void *)0x0220e74c, (void *)0x021eec48, (void *)0x021ff354, (void *)0x021f4a00, (void *)0x0223f684 },
    { 0x15fc, (void *)0x022101c4, (void *)0x00000000, (void *)0x02200908, (void *)0x021f4a00, (void *)0x00000000 },
    { 0x1610, (void *)0x02211b64, (void *)0x00000000, (void *)0x02206380, (void *)0x021f6378, (void *)0x00000000 },
    { 0x1611, (void *)0x02211b64, (void *)0x00000000, (void *)0x02206380, (void *)0x021f6378, (void *)0x00000000 },
    { 0x1615, (void *)0x0220e74c, (void *)0x021e99a4, (void *)0x02206454, (void *)0x021f8214, (void *)0x0223f684 },
    { 0x1617, (void *)0x0220e74c, (void *)0x021eb964, (void *)0x02206454, (void *)0x021f8214, (void *)0x0223f684 },
    { 0x1619, (void *)0x02220100, (void *)0x00000000, (void *)0x021ff400, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x161a, (void *)0x0221074c, (void *)0x00000000, (void *)0x02206490, (void *)0x021f8214, (void *)0x00000000 },
    { 0x161c, (void *)0x0220e75c, (void *)0x021e9ac4, (void *)0x022064d0, (void *)0x021f4a00, (void *)0x02241400 },
    { 0x1620, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x1624, (void *)0x0222800c, (void *)0x021f1bac, (void *)0x022064e8, (void *)0x021f8244, (void *)0x02243740 },
    { 0x1627, (void *)0x02210104, (void *)0x00000000, (void *)0x021ff668, (void *)0x021f5180, (void *)0x00000000 },
    { 0x164b, (void *)0x0220e74c, (void *)0x021ef844, (void *)0x00000000, (void *)0x021f63e0, (void *)0x0223f684 },
    { 0x1684, (void *)0x02218764, (void *)0x00000000, (void *)0x021ff320, (void *)0x021f84c8, (void *)0x00000000 },
    { 0x1693, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x1695, (void *)0x0220e75c, (void *)0x021ef9c4, (void *)0x02206454, (void *)0x021f8214, (void *)0x00000000 },
    { 0x1696, (void *)0x02229b54, (void *)0x00000000, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x169d, (void *)0x02229d00, (void *)0x00000000, (void *)0x0220c940, (void *)0x021f84c8, (void *)0x02241a14 },
    { 0x16b2, (void *)0x0220e74c, (void *)0x021ebe88, (void *)0x02207010, (void *)0x021f8530, (void *)0x0223f684 },
    { 0x16b9, (void *)0x0222a518, (void *)0x00000000, (void *)0x02207060, (void *)0x021f8560, (void *)0x00000000 },
    { 0x16c0, (void *)0x0220e74c, (void *)0x021e8fcc, (void *)0x022070e4, (void *)0x021f85f8, (void *)0x0223f684 },
    { 0x16c4, (void *)0x0222a7a8, (void *)0x00000000, (void *)0x02207204, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x16c9, (void *)0x0222a960, (void *)0x021e97bc, (void *)0x0220730c, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x16cb, (void *)0x0222a960, (void *)0x021e9a44, (void *)0x0220730c, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x16e4, (void *)0x0222b73c, (void *)0x00000000, (void *)0x00000000, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x16fa, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x1702, (void *)0x02210104, (void *)0x021ea390, (void *)0x00000000, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x1707, (void *)0x0220e75c, (void *)0x021efcf4, (void *)0x022079e4, (void *)0x021f8cf0, (void *)0x00000000 },
    { 0x1708, (void *)0x0220e74c, (void *)0x021efd38, (void *)0x00000000, (void *)0x021f52f0, (void *)0x0223f684 },
    { 0x1727, (void *)0x02212b58, (void *)0x021f1898, (void *)0x02207e68, (void *)0x021f8fc0, (void *)0x0223f684 },
    { 0x173f, (void *)0x0222c3dc, (void *)0x00000000, (void *)0x02207e94, (void *)0x021f6378, (void *)0x00000000 },
    { 0x1741, (void *)0x02211b64, (void *)0x00000000, (void *)0x02207f24, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x1748, (void *)0x0221074c, (void *)0x00000000, (void *)0x02207fb0, (void *)0x021f8d10, (void *)0x00000000 },
    { 0x174c, (void *)0x0221454c, (void *)0x021f162c, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1753, (void *)0x0220e74c, (void *)0x021eed74, (void *)0x00000000, (void *)0x021f52f0, (void *)0x0223f684 },
    { 0x1754, (void *)0x02217b30, (void *)0x021f00fc, (void *)0x0220803c, (void *)0x021f8fc0, (void *)0x00000000 },
    { 0x1758, (void *)0x0222c524, (void *)0x021e96a0, (void *)0x0220803c, (void *)0x021f8fc0, (void *)0x00000000 },
    { 0x178f, (void *)0x0222d2f8, (void *)0x021e96a0, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x1790, (void *)0x0221074c, (void *)0x021ea390, (void *)0x02208560, (void *)0x021faf44, (void *)0x00000000 },
    { 0x179b, (void *)0x02210104, (void *)0x021f02b0, (void *)0x00000000, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x17bc, (void *)0x0222e5e4, (void *)0x021f175c, (void *)0x00000000, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x17c2, (void *)0x0222196c, (void *)0x00000000, (void *)0x022088ec, (void *)0x00000000, (void *)0x00000000 },
    { 0x17c6, (void *)0x0222ed1c, (void *)0x00000000, (void *)0x02200908, (void *)0x00000000, (void *)0x00000000 },
    { 0x17d4, (void *)0x0222ed1c, (void *)0x00000000, (void *)0x02200908, (void *)0x00000000, (void *)0x00000000 },
    { 0x17da, (void *)0x0220e74c, (void *)0x021f0698, (void *)0x02208ca8, (void *)0x021f96d8, (void *)0x0223f684 },
    { 0x17db, (void *)0x0220e75c, (void *)0x021f06cc, (void *)0x02208ca8, (void *)0x021f96d8, (void *)0x00000000 },
    { 0x17dd, (void *)0x02210810, (void *)0x00000000, (void *)0x02208df8, (void *)0x021f97e8, (void *)0x00000000 },
    { 0x17e1, (void *)0x02210104, (void *)0x021f0a54, (void *)0x00000000, (void *)0x021f63e0, (void *)0x00000000 },
    { 0x1810, (void *)0x0221c9a4, (void *)0x00000000, (void *)0x02209268, (void *)0x021f9910, (void *)0x00000000 },
    { 0x1820, (void *)0x0222fa9c, (void *)0x00000000, (void *)0x02209678, (void *)0x021f4a4c, (void *)0x0223fa20 },
    { 0x1821, (void *)0x02210810, (void *)0x00000000, (void *)0x0220a328, (void *)0x021f6378, (void *)0x00000000 },
    { 0x1825, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x1835, (void *)0x02220038, (void *)0x021ea390, (void *)0x021ff320, (void *)0x021f9978, (void *)0x00000000 },
    { 0x183a, (void *)0x022101c4, (void *)0x00000000, (void *)0x02200908, (void *)0x021f6378, (void *)0x00000000 },
    { 0x183b, (void *)0x02230064, (void *)0x00000000, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x1847, (void *)0x02230324, (void *)0x00000000, (void *)0x02209868, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x1852, (void *)0x02224c18, (void *)0x00000000, (void *)0x02209c7c, (void *)0x00000000, (void *)0x00000000 },
    { 0x1855, (void *)0x02210104, (void *)0x021ea390, (void *)0x02209db0, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x185d, (void *)0x02211b64, (void *)0x021f1170, (void *)0x02209e00, (void *)0x021f9c94, (void *)0x00000000 },
    { 0x1863, (void *)0x0221669c, (void *)0x021eb300, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x186a, (void *)0x0220e74c, (void *)0x021e8fcc, (void *)0x02209ea0, (void *)0x021f9dac, (void *)0x0223f684 },
    { 0x186e, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x186f, (void *)0x02230f10, (void *)0x00000000, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x1870, (void *)0x02230ff4, (void *)0x021f126c, (void *)0x02209ed4, (void *)0x021f9eb4, (void *)0x00000000 },
    { 0x1871, (void *)0x02230ff4, (void *)0x021f126c, (void *)0x02209ed4, (void *)0x021f9eb4, (void *)0x00000000 },
    { 0x1872, (void *)0x02230ff4, (void *)0x021f126c, (void *)0x02209ed4, (void *)0x021f9eb4, (void *)0x00000000 },
    { 0x1876, (void *)0x02231094, (void *)0x00000000, (void *)0x02209f48, (void *)0x021f97e8, (void *)0x00000000 },
    { 0x1878, (void *)0x022313c4, (void *)0x00000000, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x1879, (void *)0x02210810, (void *)0x00000000, (void *)0x0220a008, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x1895, (void *)0x02214720, (void *)0x00000000, (void *)0x0220a0bc, (void *)0x021f8fc0, (void *)0x0223fa20 },
    { 0x189a, (void *)0x02210810, (void *)0x00000000, (void *)0x0220a328, (void *)0x021f6378, (void *)0x00000000 },
    { 0x18a3, (void *)0x02211b64, (void *)0x021ed4c0, (void *)0x0220a480, (void *)0x021fa310, (void *)0x00000000 },
    { 0x18a4, (void *)0x0221af90, (void *)0x00000000, (void *)0x0220a5b8, (void *)0x021f97e8, (void *)0x02241bf8 },
    { 0x18b3, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x18ba, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x18bb, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x18bd, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x18c6, (void *)0x02216dd0, (void *)0x021e7868, (void *)0x0220a780, (void *)0x021f8530, (void *)0x0223f684 },
    { 0x18c9, (void *)0x0220e74c, (void *)0x021e8fcc, (void *)0x0220a7b8, (void *)0x021fa5e8, (void *)0x0223f684 },
    { 0x18d2, (void *)0x02231f2c, (void *)0x021f1458, (void *)0x0220a838, (void *)0x021f84c8, (void *)0x00000000 },
    { 0x18e8, (void *)0x0223252c, (void *)0x021efcf4, (void *)0x0220aa64, (void *)0x021f8cf0, (void *)0x00000000 },
    { 0x18f0, (void *)0x02212ce8, (void *)0x021f15a8, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x18f8, (void *)0x022326fc, (void *)0x021eb964, (void *)0x0220aad0, (void *)0x021fab74, (void *)0x0223fdb4 },
    { 0x1900, (void *)0x02218068, (void *)0x00000000, (void *)0x0220ac78, (void *)0x021f8530, (void *)0x00000000 },
    { 0x1906, (void *)0x022327b8, (void *)0x021ebd5c, (void *)0x0220acd8, (void *)0x021f6378, (void *)0x00000000 },
    { 0x1909, (void *)0x02232a18, (void *)0x021e97bc, (void *)0x00000000, (void *)0x00000000, (void *)0x0223f684 },
    { 0x190e, (void *)0x0221669c, (void *)0x021e8fcc, (void *)0x021ff354, (void *)0x021f4a00, (void *)0x0223f684 },
    { 0x1913, (void *)0x02220340, (void *)0x021f208c, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1916, (void *)0x02226c08, (void *)0x021e8a18, (void *)0x02205d20, (void *)0x021f81a4, (void *)0x0224326c },
    { 0x1917, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x191e, (void *)0x0222b0dc, (void *)0x00000000, (void *)0x0220af9c, (void *)0x021f8530, (void *)0x0223fa20 },
    { 0x1936, (void *)0x0222196c, (void *)0x00000000, (void *)0x0220b488, (void *)0x021faab4, (void *)0x00000000 },
    { 0x1941, (void *)0x02211a74, (void *)0x021ea390, (void *)0x00000000, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x194b, (void *)0x02226268, (void *)0x021e8a18, (void *)0x022059d8, (void *)0x021f4a4c, (void *)0x0224326c },
    { 0x1953, (void *)0x02233f78, (void *)0x021e76b4, (void *)0x021ff354, (void *)0x021f4a00, (void *)0x0223f684 },
    { 0x1954, (void *)0x0222a960, (void *)0x021f16d4, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1957, (void *)0x02213f9c, (void *)0x021f2628, (void *)0x00000000, (void *)0x021f63e0, (void *)0x0223f684 },
    { 0x1962, (void *)0x0220e74c, (void *)0x021eb964, (void *)0x0220ba30, (void *)0x021fae4c, (void *)0x0223f684 },
    { 0x198c, (void *)0x0220e75c, (void *)0x021ebf40, (void *)0x02206a98, (void *)0x021f8490, (void *)0x00000000 },
    { 0x19a3, (void *)0x0220e74c, (void *)0x021eea90, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x19a5, (void *)0x02211a74, (void *)0x021f1170, (void *)0x021ff320, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x19a9, (void *)0x0220e74c, (void *)0x021e8fcc, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x19bb, (void *)0x02235904, (void *)0x00000000, (void *)0x02204168, (void *)0x021f6378, (void *)0x00000000 },
    { 0x19c8, (void *)0x0220e74c, (void *)0x021ebe88, (void *)0x0220730c, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x19d5, (void *)0x0220e75c, (void *)0x021f175c, (void *)0x00000000, (void *)0x021f49d0, (void *)0x00000000 },
    { 0x19d8, (void *)0x02211b64, (void *)0x00000000, (void *)0x0220c6b8, (void *)0x021f526c, (void *)0x00000000 },
    { 0x19f1, (void *)0x02223ddc, (void *)0x00000000, (void *)0x02204c1c, (void *)0x021f77e4, (void *)0x00000000 },
    { 0x19f3, (void *)0x0220e74c, (void *)0x021eb964, (void *)0x021ff354, (void *)0x021f4a00, (void *)0x0223f684 },
    { 0x1a02, (void *)0x02236f18, (void *)0x021e76b4, (void *)0x0220c8d0, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1a04, (void *)0x02237114, (void *)0x00000000, (void *)0x0220c940, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x1a06, (void *)0x02220f00, (void *)0x00000000, (void *)0x00000000, (void *)0x021f6378, (void *)0x00000000 },
    { 0x1a09, (void *)0x0220e74c, (void *)0x021f2ac8, (void *)0x0220a7b8, (void *)0x021fa5e8, (void *)0x0223f684 },
    { 0x1a1e, (void *)0x02237ca4, (void *)0x021f162c, (void *)0x0220cd70, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1a2b, (void *)0x02210810, (void *)0x021ec520, (void *)0x0220a008, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x1a2c, (void *)0x02210810, (void *)0x021ec520, (void *)0x0220a008, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x1a2d, (void *)0x02210810, (void *)0x021ec520, (void *)0x0220a008, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x1a2e, (void *)0x02210810, (void *)0x021ec520, (void *)0x0220a008, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x1a61, (void *)0x02211a74, (void *)0x021f1170, (void *)0x021ff320, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x1a67, (void *)0x02238864, (void *)0x00000000, (void *)0x0220d094, (void *)0x021fba08, (void *)0x00000000 },
    { 0x1a6c, (void *)0x02238bc8, (void *)0x00000000, (void *)0x0220d2d0, (void *)0x021f6378, (void *)0x00000000 },
    { 0x1a6d, (void *)0x02213f9c, (void *)0x021e8fcc, (void *)0x0220d398, (void *)0x00000000, (void *)0x0223f684 },
    { 0x1a6e, (void *)0x02238bfc, (void *)0x00000000, (void *)0x0220d3cc, (void *)0x021fa5e8, (void *)0x00000000 },
    { 0x1a70, (void *)0x02238d4c, (void *)0x00000000, (void *)0x0220d3cc, (void *)0x021fa5e8, (void *)0x00000000 },
    { 0x1a71, (void *)0x02210104, (void *)0x00000000, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x00000000 },
    { 0x1a74, (void *)0x02238f90, (void *)0x021eb300, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1a8d, (void *)0x0221d288, (void *)0x00000000, (void *)0x0220d558, (void *)0x021fbbc4, (void *)0x00000000 },
    { 0x1a96, (void *)0x022395e8, (void *)0x021eb300, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1aa0, (void *)0x02210104, (void *)0x021e8a58, (void *)0x0220d77c, (void *)0x021f52f0, (void *)0x00000000 },
    { 0x1ad6, (void *)0x022140cc, (void *)0x021ec1a4, (void *)0x021fffa8, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1ad7, (void *)0x022140cc, (void *)0x021ec1a4, (void *)0x0220db60, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1ad8, (void *)0x022140cc, (void *)0x021e7868, (void *)0x0220db60, (void *)0x021f4a4c, (void *)0x0223f684 },
    { 0x1adf, (void *)0x0223a2e4, (void *)0x021f1898, (void *)0x021ff354, (void *)0x021f4a00, (void *)0x0223f684 },
    { 0x1aef, (void *)0x0223a3b0, (void *)0x00000000, (void *)0x0220dba4, (void *)0x021f4a4c, (void *)0x02244d2c },
    { 0x1af1, (void *)0x0223a3b0, (void *)0x00000000, (void *)0x0220dba4, (void *)0x021f4a4c, (void *)0x02244d2c },
    { 0x1afd, (void *)0x0223a87c, (void *)0x021f3000, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x02244e8c },
    { 0x1b4e, (void *)0x02212b58, (void *)0x021e76b4, (void *)0x021ff320, (void *)0x021f4a4c, (void *)0x0223f684 },
};
