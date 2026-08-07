/* data_ov006_021ceb04 (12 bytes): signed char[12] board-cell index table,
 * cm-restock-carve-1. Direct sibling of the already-shipped
 * data_ov006_021ceb2c[32] (D-2 scalar array) -- identical consumer idiom
 * in the SAME two ship-as-.s functions: func_ov006_021c82ac.s (_LIT11:
 * `ldr r0,_LIT11; ldrsb r8,[r0,fp]`, fp = mla flat row*width+col index)
 * and func_ov006_021c9d00.s (_LIT6: `ldr r0,_LIT6; ldrsb r4,[r0,r5]`, r5
 * = mla flat index), both reading a SIGNED byte at a per-cell flat
 * index. relocs.txt: 2 loads, zero embedded pointers -- matches the 2
 * confirmed consumer sites exactly. Values are a permutation of 1..12 (no
 * sentinel, all 12 slots live), consistent with the neighbouring
 * board-layout tables in this cluster (data_ov006_021ceb00/_10/_2c/_4c).
 * delinks.txt/symbols.txt confirm a clean 12-byte extent between
 * data_ov006_021ceb00 and data_ov006_021ceb10. Kept non-const, matching
 * the symbol's own prior non-const declaration (.data ground truth).
 */
signed char data_ov006_021ceb04[12] = {
    12, 8, 4, 11, 7, 3, 10, 6, 2, 9, 5, 1,
};
