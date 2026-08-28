/* func_02052be4: 3-way dispatcher on func_02053614(arg1) (fresh call
 * each time, never cached). func_02053698 returns a 64-bit value
 * (occupies r0:r1), so func_02053414's 2nd arg (a local buffer
 * address) naturally lands in r2, not r1 -- no extra register move
 * needed, matching the target's instruction sequence exactly.
 */

typedef struct {
    char _pad[0x24];
    int f24;
} Arg0Struct02052c58;

extern int func_02053614(void *a);
extern int func_020535dc(void *a);
extern long long func_02053698(void *a);
extern int func_02053414(long long a, void *buf);
extern int func_02053308(void *a, int b, void *buf);

int func_02052be4(Arg0Struct02052c58 *arg0, void *arg1) {
    char local[0x24];
    int v;

    if (func_02053614(arg1) == 3) {
        return func_020535dc(arg1);
    }
    if (func_02053614(arg1) == 2) {
        return func_02053414(func_02053698(arg1), local);
    }
    v = func_02053614(arg1);
    if (v != 1) {
        return v;
    }
    return func_02053308(arg1, arg0->f24, local + 0xd);
}
