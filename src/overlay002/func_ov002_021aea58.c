/* func_ov002_021aea58: helper + 2 stores at pool-loaded global.
 *
 *     push  {r3, lr}
 *     bl    helper
 *     ldr   r1, [pc, #16]        ; r1 = pool addr (&data_ov002_022d016c)
 *     mov   r0, #0
 *     str   r0, [r1, #0xcf4]
 *     mov   r0, #1
 *     str   r0, [r1, #0xd04]
 *     pop   {r3, pc}
 *
 * Brief 242 C-42 sub-shape 2 (pool-data + 2 global writes). Recipe
 * gotcha: orig allocates r1 for the pool and r0 for the literals
 * (despite r0 being "natural first choice" for a 0-arg fn). The
 * trick: function returns `1` — the last `mov r0, #1` does double-
 * duty as the field-write AND the return value, so mwcc must
 * allocate r1 (not r0) for the pool pointer.
 */
struct FuncOv002021aea58PoolStruct {
    char pad[3316];
    int f3316;
    char pad2[12];
    int f3332;
};
extern struct FuncOv002021aea58PoolStruct data_ov002_022d016c;
extern void func_ov002_021ae89c(void);

int func_ov002_021aea58(void) {
    func_ov002_021ae89c();
    data_ov002_022d016c.f3316 = 0;
    data_ov002_022d016c.f3332 = 1;
    return 1;
}
