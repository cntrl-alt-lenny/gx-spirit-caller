; func_0204be40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204aaf4
        .extern func_0204bf44
        .extern func_0204d284
        .extern func_0204d438
        .extern func_0204f0a8
        .global func_0204be40
        .arm
func_0204be40:
    stmdb sp!, {r4, lr}
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x17]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x20]
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a8]
    bl func_020498f0
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    beq .L_e20
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_de0
    mov r0, #0x3
    bl func_020498dc
    mov r0, #0x0
    bl func_0204f0a8
    mov r4, r0
    bl func_0204aaf4
    cmp r0, #0x0
    beq .L_e28
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_de0:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_e28
    mov r0, #0x4
    bl func_020498dc
    bl func_020498f0
    ldr r0, [r0, #0x208]
    mov r1, #0x0
    bl func_0204d284
    mov r4, r0
    bl func_0204d438
    cmp r0, #0x0
    beq .L_e28
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_e20:
    mov r0, #0x1
    bl func_0204bf44
.L_e28:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
