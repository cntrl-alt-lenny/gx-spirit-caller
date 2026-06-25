/* Ov013_SlotToCell: map a logical slot id (0..7) to its hardware cell index.
 * Anything out of range → 0. (ov013_core.h) */
int Ov013_SlotToCell(int slot) {
    switch (slot) {
    case 0: return 8;
    case 1: return 4;
    case 2: return 3;
    case 3: return 5;
    case 4: return 6;
    case 5: return 0x46;
    case 6: return 9;
    case 7: return 0xa;
    default: return 0;
    }
}
