; func_02051d84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045280
        .extern func_020469b4
        .extern func_020498f0
        .extern func_0204f820
        .global func_02051d84
        .arm
func_02051d84:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_02045280
    cmp r0, #0x0
    bne .L_320
    bl func_020498f0
    cmp r0, #0x0
    beq .L_320
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_320
    bl func_020469b4
    cmp r0, #0x5
    beq .L_328
    bl func_020469b4
    cmp r0, #0x6
    beq .L_328
.L_320:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_328:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xa
    bne .L_364
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x16]
    bl func_0204f820
    cmp r6, #0x0
    beq .L_380
    mov r0, r5
    blx r6
    b .L_380
.L_364:
    bl func_020498f0
    str r6, [r0, #0x47c]
    bl func_020498f0
    str r5, [r0, #0x480]
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x1ae]
.L_380:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
