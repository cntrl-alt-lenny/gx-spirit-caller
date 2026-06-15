; func_0204c384 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_0204b280
        .global func_0204c384
        .arm
func_0204c384:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_020498f0
    ldrb r0, [r0, #0x1a6]
    cmp r0, #0x0
    beq .L_12e4
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_12e4:
    cmp r5, #0x0
    mov r4, #0x0
    bls .L_1334
.L_12f0:
    ldr r0, [r6, r4, lsl #0x2]
    bl func_0204b280
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_020498f0
    ldrb r0, [r0, #0x1a6]
    cmp r0, #0x0
    beq .L_1328
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_1328:
    add r4, r4, #0x1
    cmp r4, r5
    bcc .L_12f0
.L_1334:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
