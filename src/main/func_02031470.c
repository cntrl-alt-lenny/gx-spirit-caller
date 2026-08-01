/* func_02031470 (main, class D): membership predicate over a sparse
 * 15-value card-id set. mwcc lowers this as a pure binary-search
 * compare-tree (no jump table). */
int func_02031470(int x) {
    switch (x) {
    case 0xfe0:
    case 0xfee:
    case 0x114f:
    case 0x158a:
    case 0x1594:
    case 0x168f:
    case 0x1774:
    case 0x179c:
    case 0x1a24:
    case 0x1a25:
    case 0x1a60:
    case 0x1b41:
    case 0x1b42:
    case 0x1b43:
    case 0x1b44:
        return 1;
    default:
        return 0;
    }
}
