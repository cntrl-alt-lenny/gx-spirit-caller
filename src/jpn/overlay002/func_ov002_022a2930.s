; func_ov002_022a2930 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021afae4
        .global func_ov002_022a2930
        .arm
func_ov002_022a2930:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r3, [r1, #0x4]
    mov r5, r0
    mov r4, r2
    cmp r3, #0x5
    beq .L_11d8
    cmp r3, #0x6
    cmpne r3, #0x9
    b .L_1220
.L_11d8:
    ldr r3, _LIT0
    mov r2, r4, lsr #0x1f
    smull r0, lr, r3, r4
    smull r0, ip, r3, r4
    add ip, r2, ip, asr #0x2
    add lr, r2, lr, asr #0x2
    mov r3, #0xa
    smull r0, r2, r3, lr
    sub lr, r4, r0
    mov r0, lr, lsl #0x4
    add r2, r0, #0x38
    ldr r1, [r1, #0x30]
    mov r0, ip, lsl #0x4
    add r0, r0, r1, lsl #0x3
    add r0, r0, #0x8
    str r2, [sp]
    str r0, [sp, #0x4]
    b .L_1280
.L_1220:
    cmp r3, #0x0
    bge .L_1260
    bl func_ov002_021afae4
    cmp r0, #0x6
    movgt r0, #0x6
    bgt .L_123c
    bl func_ov002_021afae4
.L_123c:
    mov r0, r0, lsl #0x5
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x90
    add r1, r0, r4, lsl #0x5
    mov r0, #0x4a
    str r1, [sp]
    str r0, [sp, #0x4]
    b .L_1280
.L_1260:
    mov r0, #0x18
    mul r2, r4, r0
    ldr r0, [r1, #0x30]
    add r1, r2, #0x40
    mov r0, r0, lsl #0x3
    add r0, r0, #0x8
    str r1, [sp]
    str r0, [sp, #0x4]
.L_1280:
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    str r1, [r5]
    str r0, [r5, #0x4]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x66666667
