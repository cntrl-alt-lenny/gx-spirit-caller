; func_0201be68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern GetSystemWork
        .extern func_0201bd9c
        .global func_0201be68
        .arm
func_0201be68:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    mov r1, r5
    add r0, r4, #0x810
    mov r2, #0x20
    bl Copy32
    ldr r1, [r4, #0x8e0]
    mov r0, r5
    orr r1, r1, #0x2
    str r1, [r4, #0x8e0]
    bl func_0201bd9c
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x2
    str r0, [r4, #0x8e0]
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    ldreq r0, [r5, #0x10]
    cmpeq r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
