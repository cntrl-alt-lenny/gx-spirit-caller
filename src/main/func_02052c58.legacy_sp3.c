/* func_02052c58: 3-way dispatcher on func_02053688(arg1) (fresh call
 * each time, never cached). func_0205370c returns a 64-bit value
 * (occupies r0:r1), so func_02053488's 2nd arg (a local buffer
 * address) naturally lands in r2, not r1 -- no extra register move
 * needed, matching the target's instruction sequence exactly.
 */

typedef struct {
    char _pad[0x24];
    int f24;
} Arg0Struct02052c58;

extern int func_02053688(void *a);
extern int func_02053650(void *a);
extern long long func_0205370c(void *a);
extern int func_02053488(long long a, void *buf);
extern int func_0205337c(void *a, int b, void *buf);

int func_02052c58(Arg0Struct02052c58 *arg0, void *arg1) {
    char local[0x24];
    int v;

    if (func_02053688(arg1) == 3) {
        return func_02053650(arg1);
    }
    if (func_02053688(arg1) == 2) {
        return func_02053488(func_0205370c(arg1), local);
    }
    v = func_02053688(arg1);
    if (v != 1) {
        return v;
    }
    return func_0205337c(arg1, arg0->f24, local + 0xd);
}
