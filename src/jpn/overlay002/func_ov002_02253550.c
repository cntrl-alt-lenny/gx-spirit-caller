/* func_ov002_02253550: binary search a 390-entry, 8-byte-stride sorted key
 * table for `key`; return the index or -1. */
struct S02253638KeyRec { unsigned int key; unsigned int rest; };
extern struct S02253638KeyRec data_ov002_022cac34[];

int func_ov002_02253550(unsigned int key) {
    int lo = 0, hi = 0x186;
    while (lo < hi) {
        int mid = (lo + hi) / 2;
        if (data_ov002_022cac34[mid].key < key) lo = mid + 1;
        else hi = mid;
    }
    if (key != data_ov002_022cac34[lo].key) return -1;
    return lo;
}
