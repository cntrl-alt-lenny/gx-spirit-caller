/* func_0202b3bc: helper(&data, 4, 0) + pool struct field write.
 *
 *     push {r3, lr}
 *     ldr r0, [pool0]    ; r0 = &data_020c6994 (array-decay address)
 *     mov r1, #4; mov r2, #0
 *     bl func_02006bf0(&data, 4, 0)
 *     ldr r1, [pool1]    ; r1 = address of data_0219a85c
 *     ldr r1, [r1, #0]   ; r1 = *pool (the actual ptr value)
 *     str r0, [r1, #0x38] ; *ptr->f38 = helper_ret
 *     pop
 */
struct F0202b410 {
    char pad[0x38];
    int f38;
};

extern char data_020c6994[];
extern struct F0202b410 *data_0219a85c;
extern int func_02006bf0(char *p, int n, int m);

void func_0202b3bc(void) {
    data_0219a85c->f38 = func_02006bf0(data_020c6994, 4, 0);
}
