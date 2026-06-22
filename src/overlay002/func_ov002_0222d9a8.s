; func_ov002_0222d9a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern func_ov002_021d7970
        .extern func_ov002_021de408
        .extern func_ov002_02257704
        .global func_ov002_0222d9a8
        .arm
func_ov002_0222d9a8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_388
    cmp r1, #0x7f
    beq .L_344
    cmp r1, #0x80
    bne .L_3c4
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x7f
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_021d7970
    mov r0, #0x80
    ldmia sp!, {r4, pc}
.L_344:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x7e
    ldmeqia sp!, {r4, pc}
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021d7970
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_388:
    bl func_ov002_02257704
    mvn r1, #0x0
    ldrh r2, [r4, #0x2]
    eor r3, r0, r1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r2, lsl #0x1a
    mov r0, r0, lsl #0x4
    add r0, r0, r1, lsr #0x1b
    mov r1, #0x1
    eor r1, r3, r1, lsl r0
    mov r0, r4
    bl func_ov002_021de408
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_3c4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
