; func_ov002_021ae430 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern func_ov002_0229ade0
        .extern func_ov002_0229ce5c
        .extern func_ov002_0229cfa0
        .global func_ov002_021ae430
        .arm
func_ov002_021ae430:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x200
    ldr r2, _LIT0
    ldr r0, [r2, r0, lsl #0x2]
    cmp r0, #0x0
    addne sp, sp, #0x200
    ldmneia sp!, {r3, pc}
    add r0, sp, #0x0
    bl func_ov002_0229cfa0
    add r0, sp, #0x100
    add r2, sp, #0x0
    mov r1, #0x108
    bl func_ov002_0229ce5c
    mov r1, #0x0
    add r2, sp, #0x100
    mov r3, r1
    mov r0, #0x31
    bl func_ov002_0229ade0
    add sp, sp, #0x200
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd744
