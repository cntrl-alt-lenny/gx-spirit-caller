/* func_02054b44 (main) — Park-Miller minstd step: seed*16807 mod 2^31-1,
 * via the hi16/lo16 split and the (x>0x7fffffff -> (x&0x7fffffff)+1) carry fold.
 *   ph = (seed>>16) * 16807;  pl = (seed & 0xffff) * 16807;
 *   x  = pl + ((ph & 0x7fff) << 16);  reduce;
 *   x += ph >> 15;                    reduce.
 */

unsigned int func_02054b44(unsigned int seed) {
    unsigned int lo = seed & 0xffff;
    unsigned int hi = seed >> 16;
    unsigned int pl = lo * 16807;
    unsigned int ph = hi * 16807;
    unsigned int x  = pl + ((ph & 0x7fff) << 16);

    if (x > 0x7fffffffU) x = (x & 0x7fffffffU) + 1;
    x = x + (ph >> 15);
    if (x > 0x7fffffffU) x = (x & 0x7fffffffU) + 1;
    return x;
}
