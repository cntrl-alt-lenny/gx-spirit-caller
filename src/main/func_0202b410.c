/* func_0202b410: helper(&data, 4, 0) + pool struct field write.
 *
 *     push {r3, lr}
 *     ldr r0, [pool0]    ; r0 = &data_020c6a74 (array-decay address)
 *     mov r1, #4; mov r2, #0
 *     bl func_02006c0c(&data, 4, 0)
 *     ldr r1, [pool1]    ; r1 = address of data_0219a93c
 *     ldr r1, [r1, #0]   ; r1 = *pool (the actual ptr value)
 *     str r0, [r1, #0x38] ; *ptr->f38 = helper_ret
 *     pop
 */
struct F0202b410 {
    char pad[0x38];
    int f38;
};

extern char data_020c6a74[];
extern struct F0202b410 *data_0219a93c;
extern int func_02006c0c(char *p, int n, int m);

void func_0202b410(void) {
    data_0219a93c->f38 = func_02006c0c(data_020c6a74, 4, 0);
}
