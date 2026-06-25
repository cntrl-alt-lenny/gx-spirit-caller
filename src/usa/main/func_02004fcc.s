; func_02004fcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02001ed4
        .extern func_02003aa0
        .extern func_02003af8
        .extern func_02004ed8
        .global func_02004fcc
        .arm
func_02004fcc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r6, r1
    mov r1, #0x0
    mov r5, r2
    mov r2, r1
    mov r7, r0
    mov r4, r3
    bl func_02001ed4
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x24]
    add r1, r1, #0x1
    str r1, [sp]
    ldr r2, _LIT0
    str r0, [sp, #0x4]
    mov r0, r7
    mov r1, r6
    str r2, [sp, #0x8]
    mov r2, r5
    add r3, r4, #0x1
    bl func_02004ed8
    mov r0, r7
    mov r1, #0x1
    mov r2, r1
    bl func_02001ed4
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    ldr r5, [sp, #0x20]
    ldr r4, [sp, #0x24]
    str r5, [sp]
    str r4, [sp, #0x4]
    ldr r4, _LIT1
    str r4, [sp, #0x8]
    bl func_02004ed8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_02003af8
_LIT1: .word func_02003aa0
