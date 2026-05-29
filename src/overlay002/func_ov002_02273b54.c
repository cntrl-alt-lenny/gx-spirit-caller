/* func_ov002_02273b54: C-39g global-ptr-chase (gotcha 15).
 * Takes no args -> the global loads into r0 and is reused (orig).
 * A stray live arg would push the global to r1 (the 69% miss).
 */
typedef unsigned short u16;
struct W0b54 { unsigned bit0:1; unsigned rest:31; };  /* offset 0, u32 */
struct F22b54 { u16 b0:1; u16 bit1:1; u16 rest:14; }; /* offset 0x16, u16 */
extern char data_ov002_022cd300[];
extern int func_ov002_021df780(int a, int b);
extern int func_ov002_02271ab4(void);
int func_ov002_02273b54(void) {
    if (((struct F22b54 *)(data_ov002_022cd300 + 0x16))->bit1) {
        func_ov002_021df780(((struct W0b54 *)data_ov002_022cd300)->bit0, 500);
        return 1;
    }
    return func_ov002_02271ab4();
}
