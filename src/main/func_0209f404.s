; func_0209f404 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_0209f514
        .global func_0209f404
        .arm
func_0209f404:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    mov r6, r1
    mov r7, r0
    mov r5, r2
    add r1, sp, #0x8
    mov r0, #0x0
    mov r2, #0x1c
    mov r4, r3
    bl Fill32
    ldrh ip, [sp, #0x3c]
    mov r0, #0x3
    str r0, [sp, #0x8]
    ldrh lr, [sp, #0x38]
    strh ip, [sp, #0xc]
    strh ip, [sp, #0xe]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    add ip, sp, #0x8
    str lr, [sp]
    str ip, [sp, #0x4]
    bl func_0209f514
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
