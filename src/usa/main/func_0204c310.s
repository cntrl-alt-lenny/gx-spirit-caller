; func_0204c310 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204b20c
        .global func_0204c310
        .arm
func_0204c310:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl func_0204987c
    ldrb r0, [r0, #0x19e]
    cmp r0, #0x0
    beq .L_470
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_470:
    cmp r5, #0x0
    mov r4, #0x0
    bls .L_4c0
.L_47c:
    ldr r0, [r6, r4, lsl #0x2]
    bl func_0204b20c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_0204987c
    ldrb r0, [r0, #0x19e]
    cmp r0, #0x0
    beq .L_4b4
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x1
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_4b4:
    add r4, r4, #0x1
    cmp r4, r5
    bcc .L_47c
.L_4c0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
