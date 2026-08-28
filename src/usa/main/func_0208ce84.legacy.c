/* func_0208ce84: reads *p, zeroes *p, OR-accumulates the read value
 * into data_021a6224, notifies func_0208dbfc with it, and returns it.
 */
extern void func_0208dbfc(int a0);
extern unsigned short data_021a6224;

unsigned short func_0208ce84(unsigned short *p) {
    unsigned short val = *p;
    *p = 0;
    data_021a6224 |= val;
    func_0208dbfc(val);
    return val;
}
