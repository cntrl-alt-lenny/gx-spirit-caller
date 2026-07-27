/* func_ov002_021b1200: nested loop (outer 0..1, inner 0..10) calling a
 * callback fn(outer,inner,0), counting nonzero results. */

int func_ov002_021b1200(int (*fn)(int, int, int))
{
    int count = 0;
    int outer, inner;

    for (outer = 0; outer < 2; outer++) {
        for (inner = 0; inner <= 10; inner++) {
            if (fn(outer, inner, 0) != 0)
                count++;
        }
    }
    return count;
}
