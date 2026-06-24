; func_02067be4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020552bc
        .extern func_02068378
        .global func_02067be4
        .arm
func_02067be4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    bl func_020552bc
    ldr r3, [r6, #0x8]
    mov r5, r0
    cmp r3, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r4, _LIT0
    add r7, r6, #0x8
    mov r8, #0x1
.L_28:
    ldr r0, [r3, #0x1c]
    add r0, r0, r4
    cmp r5, r0
    ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r2, [r3, #0x15]
    mov r0, r6
    mov r1, r8
    orr r2, r2, #0x10
    strb r2, [r3, #0x15]
    ldr r2, [r6, #0x8]
    str r4, [r2, #0x1c]
    ldr r3, [r6, #0x8]
    ldrb r2, [r3, #0x15]
    and r2, r2, #0xd3
    strb r2, [r3, #0x15]
    ldr r2, [r6, #0x8]
    ldr r3, [r6, #0x48]
    ldr ip, [r6, #0x44]
    blx ip
    mov r0, r7
    bl func_02068378
    ldr r3, [r6, #0x8]
    cmp r3, #0x0
    bne .L_28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x000009c4
