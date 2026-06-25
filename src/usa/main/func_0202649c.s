; func_0202649c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006e00
        .extern func_0200f000
        .extern func_0202252c
        .global func_0202649c
        .arm
func_0202649c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    add r4, r7, #0x94
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_530
    bl func_0200f000
    mov r0, #0x0
    str r0, [r4, #0x10]
.L_530:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_558
    ldrb r1, [r4, #0x16]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    bne .L_558
    bl func_02006e00
    mov r0, #0x0
    str r0, [r4]
.L_558:
    mov r5, #0x0
    mov r6, r5
.L_560:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_58c
    ldrb r1, [r4, #0x16]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    bne .L_58c
    bl func_02006e00
    add r0, r4, r5, lsl #0x2
    str r6, [r0, #0x4]
.L_58c:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_560
    add r0, r7, #0x3
    add r5, r0, #0x100
    mov r6, #0x0
    mvn r4, #0x0
.L_5a8:
    add r0, r7, r6, lsl #0x4
    add r0, r0, #0x100
    ldrsh r0, [r0]
    cmp r0, #0x0
    blt .L_5d8
    bl func_0202252c
    add r0, r7, r6, lsl #0x4
    add r0, r0, #0x100
    strh r4, [r0]
    ldrb r0, [r5]
    bic r0, r0, #0x1
    strb r0, [r5]
.L_5d8:
    add r6, r6, #0x1
    cmp r6, #0x6
    add r5, r5, #0x10
    blt .L_5a8
    add r1, r7, #0x100
    ldrh r2, [r1, #0x6a]
    mov r0, #0x1
    bic r2, r2, #0x1
    strh r2, [r1, #0x6a]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
