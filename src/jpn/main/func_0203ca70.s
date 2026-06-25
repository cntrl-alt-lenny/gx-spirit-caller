; func_0203ca70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c8b0
        .global func_0203ca70
        .arm
func_0203ca70:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r0, #0x1
    mov r4, r1
    bl func_0203c8b0
    ldrb r1, [r0, #0x8]
    ands r2, r1, r5
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, pc}
    orr r1, r1, r5
    strb r1, [r0, #0x8]
    ldr r2, [r0]
    mov r0, r5
    mov r1, r4
    blx r2
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
