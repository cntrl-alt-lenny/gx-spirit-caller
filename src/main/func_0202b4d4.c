/* func_0202b4d4: equality check against two card IDs (0x18f9, 0x19a6).
 * Sibling of func_0202b4b4. Same shape, different constants:
 * 0x18f9 (loaded via pool) and 0x18f9 + 0xad = 0x19a6 (derived via
 * `addne #0xad`).
 */

int func_0202b4d4(int id) {
    return id == 0x18f9 || id == 0x18f9 + 0xad;
}
