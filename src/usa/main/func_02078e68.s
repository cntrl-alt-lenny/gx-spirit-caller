; func_02078e68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094500
        .global func_02078e68
        .arm
func_02078e68:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    mov r2, r3, lsl #0x1
    mov r1, #0x0
    mov r4, r0
    bl func_02094500
    sub r0, r5, #0x1
    cmp r5, #0x1
    add r6, r6, r0
    ble .L_4c
.L_2c:
    ldrb r1, [r6]
    ldrb r0, [r6, #-1]
    sub r5, r5, #0x2
    cmp r5, #0x1
    add r0, r1, r0, lsl #0x8
    strh r0, [r4], #0x2
    sub r6, r6, #0x2
    bgt .L_2c
.L_4c:
    cmp r5, #0x0
    ldrgtb r0, [r6]
    strgth r0, [r4]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
