/* func_ov016_021b21d8: recursive quicksort over an array of 0x54-byte
 * elements. count<=1: no-op. count==2: compare+swap. Otherwise: swap the
 * middle element to the front as pivot, partition the rest around it
 * (func_ov016_021b21c8 compares, func_ov016_021b2180 swaps), move the
 * pivot to its final boundary position, and recurse on both halves. */
extern int func_ov016_021b21c8(void *a, void *b);
extern void func_ov016_021b2180(void *a, void *b);

void func_ov016_021b21d8(char *arr, int count) {
    char *p = arr + 0x54;
    char *boundary;
    int lt = 0;
    int i;

    if (count <= 1) {
        return;
    }
    if (count == 2) {
        if (func_ov016_021b21c8(arr, p) <= 0) {
            return;
        }
        func_ov016_021b2180(arr, p);
        return;
    }

    func_ov016_021b2180(arr, arr + (count / 2) * 0x54);

    boundary = arr;
    for (i = 1; i < count; i++) {
        if (func_ov016_021b21c8(p, arr) < 0) {
            boundary += 0x54;
            lt++;
            if (p != boundary) {
                func_ov016_021b2180(p, boundary);
            }
        }
        p += 0x54;
    }
    if (boundary != arr) {
        func_ov016_021b2180(arr, boundary);
    }
    func_ov016_021b21d8(arr, lt);
    func_ov016_021b21d8(boundary + 0x54, count - lt - 1);
}
