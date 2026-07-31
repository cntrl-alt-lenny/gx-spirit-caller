/* func_ov002_022814f0: membership predicate -- returns 1 if id is one
 * of 9 specific card/kind ids, else 0. No calls (leaf function); the
 * original's compare-chain is a binary-search tree over the sorted
 * id set, reproduced directly by a plain switch (C-45 lever). */

int func_ov002_022814f0(int id) {
    switch (id) {
    case 0x10a6:
    case 0x1281:
    case 0x1284:
    case 0x129a:
    case 0x1310:
    case 0x14a4:
    case 0x1639:
    case 0x1657:
    case 0x172c:
        return 1;
    default:
        return 0;
    }
}
