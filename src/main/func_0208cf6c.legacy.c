/* func_0208cf6c: reads *p, zeroes *p, OR-accumulates the read value
 * into data_021a6304, notifies func_0208dce4 with it, and returns it.
 */
extern void func_0208dce4(int a0);
extern unsigned short data_021a6304;

unsigned short func_0208cf6c(unsigned short *p) {
    unsigned short val = *p;
    *p = 0;
    data_021a6304 |= val;
    func_0208dce4(val);
    return val;
}
