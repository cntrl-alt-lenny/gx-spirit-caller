; func_ov002_0229cfa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229cf0c
        .global func_ov002_0229cfa0
        .arm
func_ov002_0229cfa0:
    stmdb sp!, {r3, lr}
    movs r2, r1
    mov ip, #0x0
    moveq r0, #0x12800
    ldmeqia sp!, {r3, pc}
    mov r3, ip
.L_18:
    ldr r1, [r0, r3, lsl #0x2]
    cmp r2, r1
    bne .L_40
    add r1, r3, #0x1
    add r2, r0, r3, lsl #0x2
    mov r0, r1, lsl #0xa
    mov r1, #0x0
    str r1, [r2, #0xd4]
    add r0, r0, #0x12800
    ldmia sp!, {r3, pc}
.L_40:
    add r3, r3, #0x1
    cmp r3, #0x35
    blt .L_18
    mov lr, #0x0
.L_50:
    ldr r1, [r0, lr, lsl #0x2]
    cmp r1, #0x0
    beq .L_80
    add r3, r0, lr, lsl #0x2
    add r1, r0, ip, lsl #0x2
    ldr r3, [r3, #0xd4]
    ldr r1, [r1, #0xd4]
    cmp r3, r1
    movgt ip, lr
    add lr, lr, #0x1
    cmp lr, #0x35
    blt .L_50
.L_80:
    cmp lr, #0x35
    moveq lr, ip
    str r2, [r0, lr, lsl #0x2]
    add r3, r0, lr, lsl #0x2
    mov ip, #0x0
    add r1, lr, #0x1
    str ip, [r3, #0xd4]
    bl func_ov002_0229cf0c
    ldmia sp!, {r3, pc}
