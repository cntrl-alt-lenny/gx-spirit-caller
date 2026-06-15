; func_02031ba0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219adb8
        .global func_02031ba0
        .arm
func_02031ba0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x10]
    mov r2, #0x0
    str r1, [r4, #0x8]
    ldr r1, [r4, #0xc]
    ldr r5, [r4, #0x4]
    cmp r1, #0x0
    ldr r6, [r4]
    ldr r7, [r4, #0x2c]
    beq .L_38
    blx r1
    mov r2, r0
.L_38:
    tst r7, #0x8000
    beq .L_4c
    cmp r2, #0x1
    moveq r0, r5
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_4c:
    str r5, [r6, #0x4]
    str r6, [r5]
    tst r7, #0x4000
    bne .L_70
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    beq .L_70
    mov r0, r4
    blx r1
.L_70:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_0219adb8
