; func_0205d614 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020aaf40
        .global func_0205d614
        .arm
func_0205d614:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    ldr r4, [r6, #0xc]
    mov r5, r2
    cmp r4, #0x0
    beq .L_a4
    ldr r0, [r5]
    ldr r1, [r4]
    bl func_020aaf40
    cmp r0, #0x0
    bne .L_a4
    ldr r0, [r5, #0x4]
    ldr r1, [r4, #0x8]
    bl func_020aaf40
    cmp r0, #0x0
    bne .L_a4
    ldr r1, [r5, #0x8]
    mov r0, #0x1
    str r6, [r1]
    str r0, [r5, #0xc]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_a4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
