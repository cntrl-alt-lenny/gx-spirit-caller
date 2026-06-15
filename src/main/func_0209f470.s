; func_0209f470 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_0209f514
        .global func_0209f470
        .arm
func_0209f470:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x28
    mov r6, r1
    mov r7, r0
    mov r5, r2
    add r1, sp, #0x8
    mov r0, #0x0
    mov r2, #0x1c
    mov r4, r3
    bl Fill32
    ldrh lr, [sp, #0x44]
    ldr r1, [sp, #0x58]
    ldrh ip, [sp, #0x48]
    ldr r0, [sp, #0x54]
    ldr r8, _LIT0
    cmp r0, #0x0
    ldr r3, [sp, #0x4c]
    ldr r2, [sp, #0x50]
    strb r1, [sp, #0x22]
    strh ip, [sp, #0x1e]
    strb r3, [sp, #0x20]
    strb r2, [sp, #0x21]
    ldrh r1, [sp, #0x40]
    str r8, [sp, #0x8]
    orrne r0, r8, #0x4
    strne r0, [sp, #0x8]
    strh lr, [sp, #0xc]
    strh lr, [sp, #0xe]
    strneh lr, [sp, #0x10]
    str r1, [sp]
    add ip, sp, #0x8
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    str ip, [sp, #0x4]
    bl func_0209f514
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0x00001e03
