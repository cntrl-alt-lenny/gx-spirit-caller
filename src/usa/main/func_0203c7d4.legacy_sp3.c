/* func_0203c7d4: stmfd-only prologue + helper + global struct byte write.
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     bl func_0203c7c4()
 *     ldr r1, [pool]; ldr r1, [r1, #0]  ; r1 = *pool (= struct ptr)
 *     strb r0, [r1, #0x17]               ; struct->f17 = (u8)helper_ret
 *     pop
 */
struct F0203c824 {
    char pad[0x17];
    unsigned char f17;
};
extern struct F0203c824 *data_0219d8e8;
extern int func_0203c7c4(void);

void func_0203c7d4(void) {
    data_0219d8e8->f17 = (unsigned char)func_0203c7c4();
}
