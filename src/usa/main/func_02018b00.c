/* func_02018b00: hard-tier setter — write-side counterpart of the
 * func_02018b14 getter (both touch offset 0x814 in the state
 * singleton returned by GetSystemWork).
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_5.s):
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0                  ; cache incoming value
 *     bl    GetSystemWork           ; r0 = state ptr
 *     str   r4, [r0, #0x814]        ; state[0x814] = value
 *     ldmia sp!, {r4, pc}
 *
 * 5 ARM instructions, 0x14 bytes. The cache-into-r4 pattern is forced
 * by the `bl` clobbering r0; mwcc picks the lowest callee-saved slot
 * for the value argument.
 */

extern char *GetSystemWork(void);

void func_02018b00(int value) {
    *(int *)(GetSystemWork() + 0x814) = value;
}
