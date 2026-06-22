; func_0201aa7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .global func_0201aa7c
        .arm
func_0201aa7c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r3, [r0, #0x900]
    sub r1, r4, #0x75
    mov r2, #0x1
    mov r1, r2, lsl r1
    mov r2, r3, lsl #0x18
    orr r1, r1, r2, lsr #0x18
    bic r2, r3, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r0, #0x900]
    ldmia sp!, {r4, pc}
